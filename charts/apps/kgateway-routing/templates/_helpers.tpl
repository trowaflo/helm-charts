{{/*
Expand the name of the chart.
*/}}
{{- define "kgateway-routing.name" -}}
  {{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "kgateway-routing.fullname" -}}
  {{- if .Values.fullnameOverride }}
    {{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
  {{- else }}
    {{- $name := default .Chart.Name .Values.nameOverride }}
    {{- if contains $name .Release.Name }}
      {{- .Release.Name | trunc 63 | trimSuffix "-" }}
    {{- else }}
      {{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
    {{- end }}
  {{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "kgateway-routing.chart" -}}
  {{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "kgateway-routing.labels" -}}
helm.sh/chart: {{ include "kgateway-routing.chart" . | quote }}
{{ include "kgateway-routing.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end }}

{{/*
Chart labels merged with user labels, as a YAML map. A user label wins on a
shared key so an existing selector on it keeps matching.
Usage: {{ include "kgateway-routing.resourceLabels" (dict "root" $ "extra" $cfg.labels) | nindent 4 }}
*/}}
{{- define "kgateway-routing.resourceLabels" -}}
  {{- $chart := include "kgateway-routing.labels" .root | fromYaml -}}
  {{- toYaml (merge (deepCopy (.extra | default dict)) $chart) -}}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "kgateway-routing.selectorLabels" -}}
{{- /* Quoted: a release name such as 123 would otherwise parse as a number. */ -}}
app.kubernetes.io/name: {{ include "kgateway-routing.name" . | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end }}

{{/*
Return the namespace to use
*/}}
{{- define "kgateway-routing.namespace" -}}
  {{- default .Release.Namespace .Values.namespaceOverride }}
{{- end }}

{{/*
Generate route name from key and config
*/}}
{{- define "kgateway-routing.routeName" -}}
  {{- $key := .key -}}
  {{- $config := .config -}}
  {{- $root := .root -}}
  {{- if $config.name }}
    {{- $config.name }}
  {{- else }}
    {{- $key }}
  {{- end }}
{{- end }}

{{/*
Generate backend name from key and config
*/}}
{{- define "kgateway-routing.backendName" -}}
  {{- $key := .key -}}
  {{- $config := .config -}}
  {{- $root := .root -}}
  {{- if $config.name }}
    {{- $config.name }}
  {{- else }}
    {{- printf "%s-backend" $key }}
  {{- end }}
{{- end }}

{{/*
Render the `filters:` items of one HTTPRoute rule: the user filters plus the
global `.Values.defaultSecurityHeaders`, unless the route opted out via
`securityHeaders: false`.

Gateway API rejects a rule that repeats a ResponseHeaderModifier, so the
default headers and the user's ResponseHeaderModifier operations go into one
filter, rendered first. On a header name (case-insensitive), the user wins:
a user `set`/`add` replaces the default `set` and cancels a default `remove`,
a user `remove` drops the default `set`.

Returns the items as a YAML list at column 0 (call with `| nindent N`), or
empty when there is nothing to render.

Fails explicitly if the per-route `securityHeaders` field is present but not
a boolean, so typos like `securityHeaders: "true"` (string) or attempts to
inline the map shape at route level are caught at render time.

Usage:
  {{- with include "kgateway-routing.filters" (dict "root" $ "config" $cfg "key" $key "filters" $backend.filters) }}
*/}}
{{- define "kgateway-routing.filters" -}}
  {{- $cfg := .config -}}
  {{- $key := .key | default "<route>" -}}
  {{- $enabled := true -}}
  {{- if hasKey $cfg "securityHeaders" -}}
    {{- $enabled = $cfg.securityHeaders -}}
    {{- if not (kindIs "bool" $enabled) -}}
      {{- fail (printf "routes.%s.securityHeaders must be a boolean: omit or set `true` to keep them, `false` to opt out. The header list is configured globally at top-level `defaultSecurityHeaders:` (got %s)" $key (kindOf $enabled)) -}}
    {{- end -}}
  {{- end -}}
  {{- $items := list -}}
  {{- if not $enabled -}}
    {{- range .filters -}}
      {{- $items = append $items (include "kgateway-routing.filter" .) -}}
    {{- end -}}
  {{- else -}}
    {{- $defaults := .root.Values.defaultSecurityHeaders | default dict -}}
    {{- $userSet := list -}}
    {{- $userAdd := list -}}
    {{- $userRemove := list -}}
    {{- $others := list -}}
    {{- range .filters -}}
      {{- if eq .type "ResponseHeaderModifier" -}}
        {{- $m := .responseHeaderModifier | default dict -}}
        {{- $userSet = concat $userSet ($m.set | default list) -}}
        {{- $userAdd = concat $userAdd ($m.add | default list) -}}
        {{- $userRemove = concat $userRemove ($m.remove | default list) -}}
      {{- else -}}
        {{- $others = append $others . -}}
      {{- end -}}
    {{- end -}}
    {{- $written := dict -}}
    {{- range concat $userSet $userAdd -}}
      {{- $_ := set $written (lower (required "header name is required" .name)) true -}}
    {{- end -}}
    {{- $removed := dict -}}
    {{- range $userRemove -}}
      {{- $_ := set $removed (lower .) true -}}
    {{- end -}}
    {{- $set := list -}}
    {{- range $defaults.set -}}
      {{- $name := required "defaultSecurityHeaders.set[].name is required" .name -}}
      {{- $_ := required "defaultSecurityHeaders.set[].value is required" .value -}}
      {{- if not (or (hasKey $written (lower $name)) (hasKey $removed (lower $name))) -}}
        {{- $set = append $set . -}}
      {{- end -}}
    {{- end -}}
    {{- $set = concat $set $userSet -}}
    {{- $remove := list -}}
    {{- range $defaults.remove -}}
      {{- if not (hasKey $written (lower .)) -}}
        {{- $remove = append $remove . -}}
      {{- end -}}
    {{- end -}}
    {{- $remove = concat $remove $userRemove | uniq -}}
    {{- if or $set $userAdd $remove -}}
      {{- $modifier := dict "set" $set "add" $userAdd "remove" $remove -}}
      {{- $items = append $items (include "kgateway-routing.filter" (dict "type" "ResponseHeaderModifier" "responseHeaderModifier" $modifier)) -}}
    {{- end -}}
    {{- range $others -}}
      {{- $items = append $items (include "kgateway-routing.filter" .) -}}
    {{- end -}}
  {{- end -}}
  {{- join "\n" $items -}}
{{- end -}}

{{/*
Render one HTTPRoute filter as a YAML list item at column 0.
*/}}
{{- define "kgateway-routing.filter" -}}
- type: {{ required "filter type is required" .type }}
  {{- if .requestHeaderModifier }}
  requestHeaderModifier:
    {{- include "kgateway-routing.headerModifier" .requestHeaderModifier | trim | nindent 4 }}
  {{- end }}
  {{- if .responseHeaderModifier }}
  responseHeaderModifier:
    {{- include "kgateway-routing.headerModifier" .responseHeaderModifier | trim | nindent 4 }}
  {{- end }}
  {{- if .requestRedirect }}
  requestRedirect:
    {{- toYaml .requestRedirect | nindent 4 }}
  {{- end }}
  {{- if .requestMirror }}
  requestMirror:
    {{- toYaml .requestMirror | nindent 4 }}
  {{- end }}
  {{- if .urlRewrite }}
  urlRewrite:
    {{- toYaml .urlRewrite | nindent 4 }}
  {{- end }}
  {{- if .extensionRef }}
  extensionRef:
    {{- toYaml .extensionRef | nindent 4 }}
  {{- end }}
{{- end -}}

{{/*
Render the set/add/remove body of a header modifier at column 0.
*/}}
{{- define "kgateway-routing.headerModifier" -}}
  {{- if .set }}
set:
    {{- range .set }}
  - name: {{ required "header name is required" .name }}
    value: {{ required "header value is required" .value | quote }}
    {{- end }}
  {{- end }}
  {{- if .add }}
add:
    {{- range .add }}
  - name: {{ required "header name is required" .name }}
    value: {{ required "header value is required" .value | quote }}
    {{- end }}
  {{- end }}
  {{- if .remove }}
remove:
    {{- toYaml .remove | nindent 2 }}
  {{- end }}
{{- end -}}
