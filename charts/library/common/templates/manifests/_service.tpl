{{- define "common.manifests.service" -}}
  {{- range $serviceName := keys .Values.k8sServices | sortAlpha }}
    {{- $svcConfig := index $.Values.k8sServices $serviceName }}
    {{- if $svcConfig.enabled }}
      {{- $targetComponent := $svcConfig.targetComponent | default $serviceName }}
---
apiVersion: v1
kind: Service
metadata:
  name: {{ include "common.helpers.fullname" $ }}-{{ $serviceName }}
  namespace: {{ include "common.helpers.namespace" $ }}
  labels:
    {{- include "common.helpers.labels" $ | nindent 4 }}
    app.kubernetes.io/component: {{ $serviceName }}
    {{- with $svcConfig.labels }}
    {{- toYaml . | nindent 4 }}
    {{- end }}
  {{- with $svcConfig.annotations }}
  annotations:
    {{- toYaml . | nindent 4 }}
  {{- end }}
spec:
  type: {{ $svcConfig.type | default "ClusterIP" }}
  ports:
  {{- range $portName, $portCfg := $svcConfig.ports }}
  {{- if $portCfg }}
    - name: {{ $portName }}
      port: {{ $portCfg.port }}
      protocol: {{ include "common.helpers.protocol" $portCfg.protocol }}
      targetPort: {{ $portName }}
  {{- end }}
  {{- end }}
  selector:
    app.kubernetes.io/name: {{ include "common.helpers.name" $ }}
    app.kubernetes.io/instance: {{ $.Release.Name }}
    app.kubernetes.io/component: {{ $targetComponent }}
    {{- end }}
  {{- end }}
{{- end -}}
