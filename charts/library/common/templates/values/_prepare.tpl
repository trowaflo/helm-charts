{{- define "common.values.prepare" -}}

{{- $commonValues := .Values.common | default dict | deepCopy -}}
{{- $chartValues := mustDeepCopy (omit .Values "common") -}}
{{- $mergedValues := mustMergeOverwrite $commonValues $chartValues -}}
{{- $_ := set . "Values" (mustDeepCopy $mergedValues) -}}

{{- end -}}
