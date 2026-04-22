{{- define "common.manifests.serviceMonitor" -}}
  {{- range $name := keys .Values.serviceMonitors | sortAlpha }}
    {{- $sm := index $.Values.serviceMonitors $name }}
    {{- if $sm.enabled }}
      {{- $targetService := $sm.targetService | default $name }}
---
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: {{ include "common.helpers.fullname" $ }}-{{ $name }}
  namespace: {{ include "common.helpers.namespace" $ }}
  labels:
    {{- include "common.helpers.labels" $ | nindent 4 }}
    app.kubernetes.io/component: {{ $name }}
    {{- with $sm.labels }}
    {{- toYaml . | nindent 4 }}
    {{- end }}
spec:
  selector:
    matchLabels:
      app.kubernetes.io/name: {{ include "common.helpers.name" $ }}
      app.kubernetes.io/instance: {{ $.Release.Name }}
      app.kubernetes.io/component: {{ $targetService }}
  endpoints:
  {{- range $ep := $sm.endpoints }}
    - port: {{ $ep.port }}
    {{- with $ep.relabelings }}
      relabelings:
        {{- toYaml . | nindent 8 }}
    {{- end }}
    {{- with $ep.metricRelabelings }}
      metricRelabelings:
        {{- toYaml . | nindent 8 }}
    {{- end }}
  {{- end }}
...
    {{- end }}
  {{- end }}
{{- end -}}
