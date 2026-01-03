{{- define "kgateway-plateform.gateways" -}}
{{- $namespace := include "common.helpers.namespace" . -}}
{{- $fullname := include "common.helpers.fullname" . -}}
{{- $items := list -}}

{{- if .Values.gateways.public.enabled }}
  {{- $cfg := .Values.gateways.public -}}
  {{- $name := default (printf "%s-public" $fullname) $cfg.name -}}
  {{- $items = append $items (dict "key" "public" "name" $name "paramsName" (printf "%s-params" $name) "ipSlot" (default "public" $cfg.ipSlot) "address" $cfg.address "namespace" $namespace) }}
{{- end -}}

{{- if .Values.gateways.private.enabled }}
  {{- $cfg := .Values.gateways.private -}}
  {{- $name := default (printf "%s-private" $fullname) $cfg.name -}}
  {{- $items = append $items (dict "key" "private" "name" $name "paramsName" (printf "%s-params" $name) "ipSlot" (default "private" $cfg.ipSlot) "address" $cfg.address "namespace" $namespace) }}
{{- end -}}

{{- toYaml $items -}}
{{- end -}}