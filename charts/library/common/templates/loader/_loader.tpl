{{- define "common.loader" -}}

  {{/* Merge values from chart and common chart */}}
  {{- include "common.values.prepare" . -}}

  {{/* Render persistent volumes - infrastructure layer */}}
  {{- include "common.manifests.persistentVolume" . | nindent 0 -}}

  {{/* Render persistent volume claims - infrastructure layer */}}
  {{- include "common.manifests.persistentVolumeClaim" . | nindent 0 -}}

  {{/* Render CNPG cluster - database dependency layer */}}
  {{- include "common.manifests.cnpgCluster" . | nindent 0 -}}

  {{/* Render secrets - secret layer */}}
  {{- include "common.manifests.secret" . | nindent 0 -}}

  {{/* Render service - networking layer */}}
  {{- include "common.manifests.service" . | nindent 0 -}}

  {{/* Render deployment - workload layer */}}
  {{- include "common.manifests.deployment" . | nindent 0 -}}

  {{/* Render statefulset - workload layer */}}
  {{- include "common.manifests.statefulset" . | nindent 0 -}}

  {{/* Render cronjob - workload layer */}}
  {{- include "common.manifests.cronjob" . | nindent 0 -}}

  {{/* Render job - workload layer */}}
  {{- include "common.manifests.job" . | nindent 0 -}}

  {{/* Render ingress - external access layer */}}
  {{- include "common.manifests.ingress" . | nindent 0 -}}

  {{/* Render service-monitor - observability layer */}}
  {{- include "common.manifests.serviceMonitor" . | nindent 0 -}}

{{- end -}}
