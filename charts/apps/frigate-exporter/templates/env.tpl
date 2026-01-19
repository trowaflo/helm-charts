{{- define "frigateExporter.env" -}}
env:
  - name: "FRIGATE_STATS_URL"
    value: http://{{ .Values.frigate.serviceName }}.{{ .Values.frigate.namespace }}.svc.cluster.local:{{ .Values.frigate.port }}/api/stats
{{- end -}}
