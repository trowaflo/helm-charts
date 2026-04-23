{{/*
Expand the name of the chart.
*/}}
{{- define "ghostfolio.name" -}}
  {{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "ghostfolio.fullname" -}}
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
{{- define "ghostfolio.chart" -}}
  {{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "ghostfolio.labels" -}}
helm.sh/chart: {{ include "ghostfolio.chart" . }}
{{ include "ghostfolio.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "ghostfolio.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ghostfolio.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Redis labels
*/}}
{{- define "ghostfolio.redis.labels" -}}
helm.sh/chart: {{ include "ghostfolio.chart" . }}
{{ include "ghostfolio.redis.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/component: redis
{{- end }}

{{/*
Redis selector labels
*/}}
{{- define "ghostfolio.redis.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ghostfolio.name" . }}-redis
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
PostgreSQL labels
*/}}
{{- define "ghostfolio.postgresql.labels" -}}
helm.sh/chart: {{ include "ghostfolio.chart" . }}
{{ include "ghostfolio.postgresql.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/component: database
{{- end }}

{{/*
PostgreSQL selector labels
*/}}
{{- define "ghostfolio.postgresql.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ghostfolio.name" . }}-postgresql
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Backup labels
*/}}
{{- define "ghostfolio.backup.labels" -}}
helm.sh/chart: {{ include "ghostfolio.chart" . }}
{{ include "ghostfolio.backup.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/component: backup
{{- end }}

{{/*
Backup selector labels
*/}}
{{- define "ghostfolio.backup.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ghostfolio.name" . }}-backup
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Restore labels
*/}}
{{- define "ghostfolio.restore.labels" -}}
helm.sh/chart: {{ include "ghostfolio.chart" . }}
{{ include "ghostfolio.restore.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/component: restore
{{- end }}

{{/*
Restore selector labels
*/}}
{{- define "ghostfolio.restore.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ghostfolio.name" . }}-restore
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Redis host
*/}}
{{- define "ghostfolio.redis.host" -}}
  {{- if .Values.ghostfolio.redis.host }}
    {{- .Values.ghostfolio.redis.host }}
  {{- else }}
    {{- printf "%s-redis" (include "ghostfolio.fullname" .) }}
  {{- end }}
{{- end }}

{{/*
PostgreSQL host (CNPG cluster service)
*/}}
{{- define "ghostfolio.postgresql.host" -}}
  {{- printf "%s-postgresql-rw" (include "ghostfolio.fullname" .) }}
{{- end }}

{{/*
PostgreSQL database name
*/}}
{{- define "ghostfolio.postgresql.database" -}}
  {{- .Values.postgresql.cluster.bootstrap.initdb.database }}
{{- end }}

{{/*
PostgreSQL username
*/}}
{{- define "ghostfolio.postgresql.username" -}}
  {{- .Values.postgresql.cluster.bootstrap.initdb.owner }}
{{- end }}
