{{/*
Validate cert-manager-webhook-ovh configVersion
The configVersion is used by the upstream chart to prevent breaking changes during upgrades.
See: https://github.com/aureq/cert-manager-webhook-ovh
*/}}
{{- define "cert-manager.validateConfig" -}}
{{- $webhookOvh := index .Values "cert-manager-webhook-ovh" }}
{{- if $webhookOvh.enabled }}
{{- $requiredVersion := "0.0.2" }}
{{- $providedVersion := $webhookOvh.configVersion | default "" }}
{{- if not $providedVersion }}
{{- fail (printf "cert-manager-webhook-ovh is enabled but 'configVersion' is missing.\n\nThe configVersion is required by the upstream chart to prevent breaking changes during upgrades.\nPlease set: cert-manager-webhook-ovh.configVersion = \"%s\"\n\nFor more information: https://github.com/aureq/cert-manager-webhook-ovh" $requiredVersion) }}
{{- end }}
{{- if ne $providedVersion $requiredVersion }}
{{- fail (printf "cert-manager-webhook-ovh configVersion mismatch.\n\nRequired by upstream chart: \"%s\"\nProvided in your values: \"%s\"\n\nThe configVersion must match to ensure compatibility and prevent breaking changes.\nPlease update: cert-manager-webhook-ovh.configVersion = \"%s\"\n\nFor more information: https://github.com/aureq/cert-manager-webhook-ovh" $requiredVersion $providedVersion $requiredVersion) }}
{{- end }}
{{- end }}
{{- end -}}
