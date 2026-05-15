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
helm.sh/chart: {{ include "kgateway-routing.chart" . }}
{{ include "kgateway-routing.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "kgateway-routing.selectorLabels" -}}
app.kubernetes.io/name: {{ include "kgateway-routing.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
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
Render a `ResponseHeaderModifier` filter populated with the global
`.Values.defaultSecurityHeaders.set` / `.remove` lists, but only if the route
has opted in via `securityHeaders: true`.

Returns the filter YAML as a list item starting at column 0 (call with
`| nindent N` to splice into a `filters:` block at the right column), or
empty if the route did not opt in.

Fails explicitly if the per-route `securityHeaders` field is present but not
a boolean, so typos like `securityHeaders: "true"` (string) or attempts to
inline the map shape at route level are caught at render time.

Usage:
  {{- $sh := include "kgateway-routing.securityHeadersFilter" (dict "root" $ "config" $cfg "key" $key) }}
*/}}
{{- define "kgateway-routing.securityHeadersFilter" -}}
  {{- $cfg := .config -}}
  {{- $key := .key | default "<route>" -}}
  {{- $optIn := $cfg.securityHeaders -}}
  {{- if and (hasKey $cfg "securityHeaders") (not (kindIs "bool" $optIn)) -}}
    {{- fail (printf "routes.%s.securityHeaders must be a boolean: set `true` to opt in or `false`/omit to opt out. The header list is configured globally at top-level `defaultSecurityHeaders:` (got %s)" $key (kindOf $optIn)) -}}
  {{- end -}}
  {{- if eq (default false $optIn) true -}}
    {{- $defaults := .root.Values.defaultSecurityHeaders | default dict -}}
- type: ResponseHeaderModifier
  responseHeaderModifier:
    {{- with $defaults.set }}
    set:
      {{- range . }}
      - name: {{ required "defaultSecurityHeaders.set[].name is required" .name }}
        value: {{ required "defaultSecurityHeaders.set[].value is required" .value | quote }}
      {{- end }}
    {{- end }}
    {{- with $defaults.remove }}
    remove:
      {{- toYaml . | nindent 6 }}
    {{- end }}
  {{- end -}}
{{- end -}}
