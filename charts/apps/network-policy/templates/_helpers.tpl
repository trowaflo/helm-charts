{{/*
Resource name prefix.
*/}}
{{- define "network-policy.fullname" -}}
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
Policy name: prefix plus suffix, the suffix kept whole when the prefix is cut.
Usage: {{ include "network-policy.name" (dict "root" $ "suffix" "egress-0") }}
*/}}
{{- define "network-policy.name" -}}
  {{- $prefix := include "network-policy.fullname" .root | trunc (int (sub 62 (len .suffix))) | trimSuffix "-" }}
  {{- printf "%s-%s" $prefix .suffix }}
{{- end }}

{{/*
Common labels.
*/}}
{{- define "network-policy.labels" -}}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" | quote }}
app.kubernetes.io/name: {{ .Chart.Name | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end }}

{{/*
Endpoint selector from a matchLabels map; an empty map selects every pod.
Usage: {{ include "network-policy.selector" $labels | nindent 4 }}
*/}}
{{- define "network-policy.selector" -}}
  {{- if . -}}
matchLabels:
    {{- toYaml . | nindent 2 }}
  {{- else -}}
{}
  {{- end }}
{{- end }}

{{/*
Peer pods: matchLabels plus the namespace label, Cilium reads a selector
without it as the policy namespace.
Usage: {{ include "network-policy.peer" (dict "selector" $r.selector "namespace" $ns) | nindent 8 }}
*/}}
{{- define "network-policy.peer" -}}
  {{- $labels := deepCopy (.selector | default dict) }}
  {{- $_ := set $labels "k8s:io.kubernetes.pod.namespace" .namespace -}}
- matchLabels:
    {{- toYaml $labels | nindent 4 }}
{{- end }}

{{/*
toPorts block, nothing when the list is empty.
Usage: {{ include "network-policy.ports" (dict "ports" $ports "protocol" $r.protocol) | nindent 6 }}
*/}}
{{- define "network-policy.ports" -}}
  {{- if .ports -}}
toPorts:
  - ports:
    {{- range .ports }}
      - port: {{ . | toString | quote }}
        protocol: {{ $.protocol | default "TCP" }}
    {{- end }}
  {{- end }}
{{- end }}
