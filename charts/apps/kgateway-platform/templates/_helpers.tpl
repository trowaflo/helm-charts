{{/*
Expand the name of the chart.
*/}}
{{- define "kgateway-platform.name" -}}
  {{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
Uses just the release name for simpler resource names.
This deviates from the standard Helm pattern to provide cleaner names by default.
*/}}
{{- define "kgateway-platform.fullname" -}}
  {{- if .Values.fullnameOverride -}}
    {{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
  {{- else -}}
    {{- .Release.Name | trunc 63 | trimSuffix "-" -}}
  {{- end -}}
{{- end -}}

{{/*
Get the namespace to use.
Uses Release.Namespace by default, but can be overridden.
*/}}
{{- define "kgateway-platform.namespace" -}}
  {{- default .Release.Namespace .Values.namespaceOverride -}}
{{- end -}}

{{/*
Generate the name for a gateway resource.
Takes a dict with keys: root (.), key (gateway key), config (gateway config)
*/}}
{{- define "kgateway-platform.gatewayName" -}}
  {{- $fullname := include "kgateway-platform.fullname" .root -}}
  {{- default (printf "%s-%s" $fullname .key) .config.name -}}
{{- end -}}

{{/*
Generate the name for a GatewayParameters resource.
Takes a dict with keys: root (.), key (gateway key), config (gateway config)
*/}}
{{- define "kgateway-platform.gatewayParametersName" -}}
  {{- $gatewayName := include "kgateway-platform.gatewayName" . -}}
  {{- printf "%s-params" $gatewayName -}}
{{- end -}}

{{/*
Generate the name for an HTTPListenerPolicy resource.
Takes a dict with keys: root (.), key (policy key), config (policy config)
*/}}
{{- define "kgateway-platform.httpListenerPolicyName" -}}
  {{- $fullname := include "kgateway-platform.fullname" .root -}}
  {{- default (printf "%s-%s" $fullname .key) .config.name -}}
{{- end -}}
