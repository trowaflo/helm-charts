{{- define "common.fullname" -}}
  {{- $name := .Values.nameOverride | default .Release.Name -}}
  {{- trunc 63 $name | trimSuffix "-" -}}
{{- end -}}

{{- define "common.volumeMounts" -}}
  {{- range $persistenceIndex, $persistenceItem := .Values.persistence }}
    {{- if $persistenceItem.enabled -}}
- name: {{ $persistenceIndex }}
  mountPath: {{ $persistenceItem.mountPath }}
  subPath: {{ $persistenceItem.subPath }}
    {{- end -}}
  {{- end }}
{{- end -}}

{{- define "common.volumes" -}}
  {{- range $persistenceIndex, $persistenceItem := .Values.persistence }}
    {{- if $persistenceItem.enabled -}}
- name: {{ include "common.fullname" $ }}-{{ $persistenceIndex }}
  persistentVolumeClaim:
    claimName: {{ include "common.fullname" $ }}-{{ $persistenceIndex }}
    {{- end -}}
  {{- end }}
{{- end -}}
