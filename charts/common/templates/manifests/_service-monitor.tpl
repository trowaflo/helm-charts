{{- define "common.manifests.serviceMonitor" -}}
{{- if .Values.serviceMonitor.enabled }}
---
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: {{ include "common.helpers.fullname" . }}
  namespace: {{ include "common.helpers.namespace" . }}
  labels:
    release: {{ .Values.serviceMonitor.labels.release }}
spec:
  selector:
    matchLabels:
      app.kubernetes.io/name: {{ include "common.helpers.name" . }}
      app.kubernetes.io/instance: {{ .Release.Name }}
  endpoints:
    - port: {{ .Values.serviceMonitor.endpoints.port }}
...
{{- end }}
{{- end -}}
