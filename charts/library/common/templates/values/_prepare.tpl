{{- define "common.values.prepare" -}}

{{- /* Récupère .Values.common (valeurs partagées injectées par la lib), ou un dict vide si absent */ -}}
{{- $commonValues := .Values.common | default dict | deepCopy -}}
{{- /* Copie tout .Values sauf la clé "common" → ce sont les valeurs propres à la chart applicative */ -}}
{{- $chartValues := mustDeepCopy (omit .Values "common") -}}
{{- /* Fusionne les deux : $chartValues écrase $commonValues en cas de conflit (la chart a priorité) */ -}}
{{- $mergedValues := mustMergeOverwrite $commonValues $chartValues -}}
{{- /* Remplace .Values par le résultat fusionné pour que tous les templates suivants voient les valeurs finales */ -}}
{{- $_ := set . "Values" (mustDeepCopy $mergedValues) -}}

{{- end -}}
