{{- define "frigateExporter.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "frigateExporter.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "frigateExporter.labels" -}}
app.kubernetes.io/name: {{ include "frigateExporter.name" . }}
helm.sh/chart: {{ include "frigateExporter.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "frigateExporter.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "frigateExporter.imageTag" -}}
{{- if .Values.image.tag -}}
{{ .Values.image.tag }}
{{- else -}}
{{ .Chart.AppVersion }}
{{- end -}}
{{- end -}}

{{- define "frigateExporter.resources" -}}
{{- $resources := .Values.resources | default dict -}}
{{ $resources | toYaml }}
{{- end -}}
