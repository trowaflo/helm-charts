{{- define "common.manifests.ingress" -}}
{{- if .Values.ingress.enabled -}}
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: {{ include "common.helpers.fullname" . }}
  namespace: {{ include "common.helpers.namespace" . }}
  labels:
    {{- include "common.helpers.labels" . | nindent 4 }}
  {{- with .Values.ingress.annotations }}
  annotations:
    {{- toYaml . | nindent 4 }}
  {{- end }}
spec:
  ingressClassName: ""
  rules:
  {{- range $serviceName, $hosts := .Values.ingress.hosts }}
    {{- range $host := $hosts }}
  - host: {{ $host.host }}
    http:
      paths:
      {{- range $path := $host.paths }}
      - path: {{ $path.path }}
        pathType: {{ $path.pathType | default "Prefix" }}
        backend:
          service:
            name: {{ include "common.helpers.fullname" $ }}
            port:
              name: {{ $serviceName }}
      {{- end }}
    {{- end }}
  {{- end }}
...
{{- end }}
{{- end -}}
