{{/*
Expand the name of the chart.
*/}}
{{- define "kgateway-platform.name" -}}
  {{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "kgateway-platform.fullname" -}}
  {{- if .Values.fullnameOverride -}}
    {{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
  {{- else -}}
    {{- $name := default .Chart.Name .Values.nameOverride -}}
    {{- if contains $name .Release.Name -}}
      {{- .Release.Name | trunc 63 | trimSuffix "-" -}}
    {{- else -}}
      {{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
    {{- end -}}
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
