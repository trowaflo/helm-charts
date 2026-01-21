{{- define "common.manifests.persistentVolumeClaim" -}}
{{- if include "common.helpers.hasEnabled" .Values.persistentVolumeClaims -}}
{{- range $key, $config := .Values.persistentVolumeClaims }}
{{- if $config.enabled }}
{{- /* Validate configuration */ -}}
{{- include "common.helpers.validatePVC" (dict "key" $key "config" $config) }}
{{- $namespace := default $.Release.Namespace $config.namespace }}
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: {{ include "common.helpers.pvcName" (dict "key" $key "config" $config) }}
  namespace: {{ $namespace }}
  labels:
    {{- include "common.helpers.labels" $ | nindent 4 }}
    {{- with $config.labels }}
    {{- toYaml . | nindent 4 }}
    {{- end }}
  {{- with $config.annotations }}
  annotations:
    {{- toYaml . | nindent 4 }}
  {{- end }}
spec:
  accessModes:
    {{- toYaml $config.accessModes | nindent 4 }}
  {{- if hasKey $config "storageClassName" }}
  storageClassName: {{ $config.storageClassName | quote }}
  {{- end }}
  {{- with $config.volumeMode }}
  volumeMode: {{ . }}
  {{- end }}
  {{- with $config.volumeName }}
  volumeName: {{ . }}
  {{- end }}
  resources:
    {{- toYaml $config.resources | nindent 4 }}
  {{- with $config.selector }}
  selector:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with $config.dataSource }}
  dataSource:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with $config.dataSourceRef }}
  dataSourceRef:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
{{- end }}
{{- end }}
{{- end -}}
