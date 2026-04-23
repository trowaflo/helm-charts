{{/*
Return the effective auth secret name (existing if provided, else auto-generated).
Usage: {{ include "ghostfolio.secretName.auth" . }}
*/}}
{{- define "ghostfolio.secretName.auth" -}}
  {{- if .Values.ghostfolio.auth.existingSecret -}}
    {{- .Values.ghostfolio.auth.existingSecret -}}
  {{- else -}}
    {{- printf "%s-secrets" (include "common.helpers.fullname" .) -}}
  {{- end -}}
{{- end -}}

{{/*
Return the effective redis secret name (existing if provided, else auto-generated).
Usage: {{ include "ghostfolio.secretName.redis" . }}
*/}}
{{- define "ghostfolio.secretName.redis" -}}
  {{- if .Values.ghostfolio.redis.auth.existingSecret -}}
    {{- .Values.ghostfolio.redis.auth.existingSecret -}}
  {{- else -}}
    {{- printf "%s-redis" (include "common.helpers.fullname" .) -}}
  {{- end -}}
{{- end -}}

{{/*
Return the effective CNPG bootstrap secret name (existing if provided, else auto-generated).
Usage: {{ include "ghostfolio.secretName.dbBootstrap" . }}
*/}}
{{- define "ghostfolio.secretName.dbBootstrap" -}}
  {{- if .Values.ghostfolio.database.bootstrap.existingSecret -}}
    {{- .Values.ghostfolio.database.bootstrap.existingSecret -}}
  {{- else -}}
    {{- printf "%s-db-bootstrap" (include "common.helpers.fullname" .) -}}
  {{- end -}}
{{- end -}}
