{{- define "common.manifests.service" -}}
{{- if gt (len .Values.services) 0 }}
---
apiVersion: v1
kind: Service
metadata:
  name: {{ include "common.helpers.fullname" . }}
  namespace: {{ include "common.helpers.namespace" . }}
  labels:
    {{- include "common.helpers.labels" . | nindent 4 }}
  {{- if .Values.services.labels }}
    {{ toYaml .Values.services.labels | nindent 4 }}
  {{- end }}
{{- with .Values.services.annotations }}
  annotations:
{{ toYaml . | indent 4 }}
{{- end }}
spec:
  ports:
  {{- range $name, $values := .Values.services }}
    - name: {{ $name }}
      port: {{ $values.ports.port }}
      protocol: {{ include "common.helpers.protocol" $values.ports.protocol }}
      targetPort: {{ $name }}
  {{- end }}
  selector:
    app.kubernetes.io/name: {{ include "common.helpers.name" . }}
    app.kubernetes.io/instance: {{ .Release.Name }}
...
{{- end }}
{{- end -}}
