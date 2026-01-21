{{- define "common.manifests.persistentVolume" -}}
{{- if include "common.helpers.hasEnabled" .Values.persistentVolumes -}}
{{- range $key, $config := .Values.persistentVolumes }}
{{- if $config.enabled }}
{{- /* Validate configuration */ -}}
{{- include "common.helpers.validatePV" (dict "key" $key "config" $config) }}
---
apiVersion: v1
kind: PersistentVolume
metadata:
  name: {{ include "common.helpers.fullname" $ }}-{{ include "common.helpers.pvName" (dict "key" $key "config" $config) }}
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
  capacity:
    storage: {{ $config.capacity }}
  accessModes:
    {{- toYaml $config.accessModes | nindent 4 }}
  {{- with $config.storageClassName }}
  storageClassName: {{ . }}
  {{- end }}
  {{- with $config.persistentVolumeReclaimPolicy }}
  persistentVolumeReclaimPolicy: {{ . }}
  {{- end }}
  {{- with $config.volumeMode }}
  volumeMode: {{ . }}
  {{- end }}
  {{- with $config.mountOptions }}
  mountOptions:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with $config.nodeAffinity }}
  nodeAffinity:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with $config.claimRef }}
  claimRef:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- /* Volume sources */ -}}
  {{- with $config.hostPath }}
  hostPath:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with $config.nfs }}
  nfs:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with $config.local }}
  local:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with $config.iscsi }}
  iscsi:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with $config.cephfs }}
  cephfs:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with $config.glusterfs }}
  glusterfs:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
{{- end }}
{{- end }}
{{- end -}}
