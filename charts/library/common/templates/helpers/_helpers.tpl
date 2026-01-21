{{- define "common.helpers.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "common.helpers.fullname" -}}
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


{{- define "common.helpers.namespace" -}}
{{- $namespace := default .Chart.Name .Values.namespaceOverride -}}
{{- if contains $namespace .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $namespace | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "common.helpers.labels" -}}
app.kubernetes.io/name: {{ include "common.helpers.name" . }}
helm.sh/chart: {{ include "common.helpers.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "common.helpers.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "common.helpers.imageTag" -}}
{{- if .image.tag -}}
{{ .image.tag }}
{{- else -}}
{{ .Chart.AppVersion }}
{{- end -}}
{{- end -}}

{{- define "common.helpers.resources" -}}
{{- $resources := .resources | default dict -}}
{{ $resources | toYaml }}
{{- end -}}

{{- define "common.helpers.protocol" -}}
{{- $protocol := . | upper -}}
{{- if not (has $protocol (list "TCP" "UDP" "SCTP")) -}}
{{- fail (printf "Invalid protocol: %s. Expected: TCP, UDP, or SCTP." $protocol) -}}
{{- end -}}
{{ $protocol }}
{{- end -}}

{{- define "common.helpers.hasEnabled" -}}
{{- $hasEnabled := false -}}
{{- range $name, $cfg := . -}}
  {{- if and (kindIs "map" $cfg) $cfg.enabled -}}
    {{- $hasEnabled = true -}}
  {{- end -}}
{{- end -}}
{{- if $hasEnabled -}}
true
{{- end -}}
{{- end -}}

{{/*
Generate PV name from key and config
*/}}
{{- define "common.helpers.pvName" -}}
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
{{- define "common.helpers.pvcName" -}}
  {{- $key := .key -}}
  {{- $config := .config -}}
  {{- if $config.name }}
    {{- $config.name }}
  {{- else }}
    {{- $key }}
  {{- end }}
{{- end }}

{{/*
Validate PV configuration - ensure required fields are present
*/}}
{{- define "common.helpers.validatePV" -}}
  {{- $key := .key -}}
  {{- $config := .config -}}
  {{- if not $config.capacity }}
    {{- fail (printf "persistentVolumes.%s: 'capacity' is required" $key) }}
  {{- end }}
  {{- if not $config.accessModes }}
    {{- fail (printf "persistentVolumes.%s: 'accessModes' is required" $key) }}
  {{- end }}
  {{- $hasVolumeSource := false }}
  {{- if or $config.hostPath $config.nfs $config.csi $config.local $config.iscsi $config.fc $config.cephfs $config.glusterfs $config.rbd $config.awsElasticBlockStore $config.azureDisk $config.gcePersistentDisk }}
    {{- $hasVolumeSource = true }}
  {{- end }}
  {{- if not $hasVolumeSource }}
    {{- fail (printf "persistentVolumes.%s: at least one volume source (e.g. hostPath, nfs, csi, local, rbd, awsElasticBlockStore, azureDisk, gcePersistentDisk) is required" $key) }}
  {{- end }}
{{- end }}

{{/*
Validate PVC configuration - ensure required fields are present
*/}}
{{- define "common.helpers.validatePVC" -}}
  {{- $key := .key -}}
  {{- $config := .config -}}
  {{- if not $config.accessModes }}
    {{- fail (printf "persistentVolumeClaims.%s: 'accessModes' is required" $key) }}
  {{- end }}
  {{- if not $config.resources }}
    {{- fail (printf "persistentVolumeClaims.%s: 'resources' is required" $key) }}
  {{- end }}
  {{- if not $config.resources.requests }}
    {{- fail (printf "persistentVolumeClaims.%s: 'resources.requests' is required" $key) }}
  {{- end }}
  {{- if not $config.resources.requests.storage }}
    {{- fail (printf "persistentVolumeClaims.%s: 'resources.requests.storage' is required" $key) }}
  {{- end }}
{{- end -}}
