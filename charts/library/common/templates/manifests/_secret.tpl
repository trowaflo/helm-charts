{{- define "common.manifests.secret" -}}
  {{- $secrets := .Values.secrets | default dict }}
  {{- range $name := keys $secrets | sortAlpha }}
    {{- $secret := index $secrets $name }}
    {{- if and $secret.enabled (not $secret.existingSecret) }}
      {{- $secretName := printf "%s-%s" (include "common.helpers.fullname" $) $name -}}
      {{- $existingData := dict }}
      {{- with (lookup "v1" "Secret" $.Release.Namespace $secretName) }}
        {{- $existingData = .data | default dict }}
      {{- end }}
      {{- $renderedData := dict }}
      {{- range $key := keys ($secret.data | default dict) | sortAlpha }}
        {{- $defaultVal := index $secret.data $key }}
        {{- $val := ternary (randAlphaNum 32) $defaultVal (eq $defaultVal "") }}
        {{- if index $existingData $key }}
          {{- $val = index $existingData $key | b64dec }}
        {{- end }}
        {{- $_ := set $renderedData $key $val }}
      {{- end }}
---
apiVersion: v1
kind: Secret
metadata:
  name: {{ $secretName }}
  namespace: {{ include "common.helpers.namespace" $ }}
  annotations:
    helm.sh/resource-policy: keep
  labels:
    {{- include "common.helpers.labels" $ | nindent 4 }}
type: {{ $secret.type | default "Opaque" }}
stringData:
  {{- range $key := keys $renderedData | sortAlpha }}
  {{ $key }}: {{ index $renderedData $key | quote }}
  {{- end }}
    {{- end }}
  {{- end }}
{{- end -}}
