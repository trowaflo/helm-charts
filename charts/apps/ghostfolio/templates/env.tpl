{{- define "ghostfolio.env" -}}
env:
  # Database URL from secret
  - name: DATABASE_URL
    valueFrom:
      secretKeyRef:
        name: {{ .Values.ghostfolio.database.secretName }}
        key: {{ .Values.ghostfolio.database.secretKey }}
  # Redis configuration
  - name: REDIS_HOST
    value: {{ if .Values.ghostfolio.redis.host }}{{ .Values.ghostfolio.redis.host }}{{ else }}{{ include "common.helpers.fullname" . }}-redis{{ end }}
  - name: REDIS_PORT
    value: {{ .Values.ghostfolio.redis.port | quote }}
  - name: REDIS_PASSWORD
    valueFrom:
      secretKeyRef:
        name: {{ .Values.ghostfolio.redis.passwordSecretName }}
        key: {{ .Values.ghostfolio.redis.passwordSecretKey }}
  # Application secrets
  - name: ACCESS_TOKEN_SALT
    valueFrom:
      secretKeyRef:
        name: {{ .Values.ghostfolio.secretName }}
        key: ACCESS_TOKEN_SALT
  - name: JWT_SECRET_KEY
    valueFrom:
      secretKeyRef:
        name: {{ .Values.ghostfolio.secretName }}
        key: JWT_SECRET_KEY
{{- end -}}
