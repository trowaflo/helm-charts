{{/*
Expand the name of the chart.
*/}}
{{- define "persistent-volume.name" -}}
  {{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "persistent-volume.fullname" -}}
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
{{- define "persistent-volume.chart" -}}
  {{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "persistent-volume.labels" -}}
helm.sh/chart: {{ include "persistent-volume.chart" . }}
{{ include "persistent-volume.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "persistent-volume.selectorLabels" -}}
app.kubernetes.io/name: {{ include "persistent-volume.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Generate PV name from key and config
*/}}
{{- define "persistent-volume.pvName" -}}
  {{- $key := .key -}}
  {{- $config := .config -}}
  {{- if $config.name }}
    {{- $config.name }}
  {{- else }}
    {{- $key }}
  {{- end }}
{{- end }}

{{/*
Generate PVC name from key and config
*/}}
{{- define "persistent-volume.pvcName" -}}
  {{- $key := .key -}}
  {{- $config := .config -}}
  {{- if $config.name }}
    {{- $config.name }}
  {{- else }}
    {{- $key }}
  {{- end }}
{{- end }}

{{/*
Return the namespace for a PVC
*/}}
{{- define "persistent-volume.pvcNamespace" -}}
  {{- $config := .config -}}
  {{- $root := .root -}}
  {{- default $root.Release.Namespace $config.namespace }}
{{- end }}
