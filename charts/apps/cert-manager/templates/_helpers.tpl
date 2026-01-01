{{/*
Validate cert-manager-webhook-ovh configVersion
*/}}
{{- define "cert-manager.validateConfig" -}}
{{- $webhookOvh := index .Values "cert-manager-webhook-ovh" }}
{{- if $webhookOvh.enabled }}
{{- $requiredVersion := "0.0.2" }}
{{- $providedVersion := $webhookOvh.configVersion | default "" }}
{{- if not $providedVersion }}
{{- fail "The 'configVersion' key cannot be empty when cert-manager-webhook-ovh is enabled. Please set .Values.cert-manager-webhook-ovh.configVersion to '0.0.2'" }}
{{- end }}
{{- if ne $providedVersion $requiredVersion }}
{{- fail (printf "Incorrect 'configVersion': Expected: '%s', Provided: '%s'" $requiredVersion $providedVersion) }}
{{- end }}
{{- end }}
{{- end -}}
