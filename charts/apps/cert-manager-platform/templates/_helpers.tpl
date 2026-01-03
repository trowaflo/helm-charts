{{/*
Validate cert-manager-webhook-ovh configVersion

The configVersion is used by the upstream chart to prevent breaking changes during upgrades.
This value is tied to the chart dependency version in Chart.yaml and must be updated when
upgrading cert-manager-webhook-ovh to a new version with breaking changes.

Current dependency: cert-manager-webhook-ovh v0.8.0 requires configVersion "0.0.2"

When upgrading the dependency, check the upstream changelog for the new required configVersion:
https://github.com/aureq/cert-manager-webhook-ovh

NOTE: Update this $requiredVersion value when upgrading the cert-manager-webhook-ovh dependency.
*/}}
{{- define "cert-manager.validateConfig" -}}
  {{- $webhookOvh := index .Values "cert-manager-webhook-ovh" }}
  {{- if $webhookOvh.enabled }}
    {{- $requiredVersion := "0.0.2" }}
    {{- $providedVersion := $webhookOvh.configVersion | default "" }}
    {{- if not $providedVersion }}
      {{- fail (printf "cert-manager-webhook-ovh is enabled but 'configVersion' is missing.\n\nThe configVersion is required by the upstream chart to prevent breaking changes during upgrades.\nPlease set: cert-manager-webhook-ovh.configVersion = \"%s\"\n\nThis value corresponds to cert-manager-webhook-ovh chart version in Chart.yaml.\nFor more information: https://github.com/aureq/cert-manager-webhook-ovh" $requiredVersion) }}
    {{- end }}
    {{- if ne $providedVersion $requiredVersion }}
      {{- fail (printf "cert-manager-webhook-ovh configVersion mismatch.\n\nRequired by upstream chart: \"%s\"\nProvided in your values: \"%s\"\n\nThe configVersion must match to ensure compatibility and prevent breaking changes.\nThis value must be updated when upgrading the cert-manager-webhook-ovh dependency.\n\nPlease update: cert-manager-webhook-ovh.configVersion = \"%s\"\n\nFor more information: https://github.com/aureq/cert-manager-webhook-ovh" $requiredVersion $providedVersion $requiredVersion) }}
    {{- end }}
  {{- end }}
{{- end -}}
