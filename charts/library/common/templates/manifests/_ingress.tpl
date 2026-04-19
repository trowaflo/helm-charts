{{- define "common.manifests.ingress" -}}
  {{- $fullname := include "common.helpers.fullname" . -}}
  {{- range $name, $cfg := .Values.ingresses }}
    {{- if $cfg.enabled }}
      {{- $_ := required (printf "ingresses.%s.hosts is required and must contain at least one entry when enabled" $name) $cfg.hosts }}
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: {{ $fullname }}-{{ $name }}
  namespace: {{ include "common.helpers.namespace" $ }}
  labels:
    {{- include "common.helpers.labels" $ | nindent 4 }}
    app.kubernetes.io/component: {{ $name }}
  {{- with $cfg.annotations }}
  annotations:
    {{- toYaml . | nindent 4 }}
  {{- end }}
spec:
  ingressClassName: {{ $cfg.className | default "traefik" | quote }}
  rules:
  {{- $defaultTarget := $cfg.targetService | default $name }}
  {{- range $host := $cfg.hosts }}
    {{- if not $host.paths }}
      {{- fail (printf "ingresses.%s host %q: paths is required and must contain at least one entry" $name $host.host) }}
    {{- end }}
    - host: {{ $host.host }}
      http:
        paths:
        {{- range $path := $host.paths }}
          {{- $backend := $path.backend | default dict }}
          {{- $svc := $backend.service | default dict }}
          {{- $port := $svc.port | default dict }}
          - path: {{ $path.path }}
            pathType: {{ $path.pathType | default "Prefix" }}
            backend:
              service:
                name: {{ $svc.name | default (printf "%s-%s" $fullname $defaultTarget) }}
                port:
                  {{- if $port.number }}
                  number: {{ $port.number }}
                  {{- else }}
                  name: {{ $port.name | default $defaultTarget }}
                  {{- end }}
        {{- end }}
  {{- end }}
  {{- with $cfg.tls }}
  tls:
    {{- toYaml . | nindent 4 }}
  {{- end }}
    {{- end }}
  {{- end }}
{{- end -}}
