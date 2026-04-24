{{- define "common.manifests.statefulset" -}}
  {{- range $name := keys .Values.statefulsets | sortAlpha }}
    {{- $statefulset := index $.Values.statefulsets $name }}
    {{- if $statefulset.enabled }}
      {{- $podSpec := $statefulset.podSpec | default dict -}}
      {{- $_ := required (printf "statefulsets.%s.podSpec.containers is required and must define at least one container when enabled" $name) $podSpec.containers }}
      {{- $defaultUpdateStrategy := dict "type" "RollingUpdate" -}}
      {{- $updateStrategy := mergeOverwrite (deepCopy $defaultUpdateStrategy) ($statefulset.updateStrategy | default dict) -}}
      {{- $defaultPodSecCtx := dict "runAsNonRoot" true "fsGroupChangePolicy" "OnRootMismatch" -}}
      {{- $podSecCtx := mergeOverwrite (deepCopy $defaultPodSecCtx) ($podSpec.securityContext | default dict) }}
---
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: {{ include "common.helpers.fullname" $ }}-{{ $name }}
  namespace: {{ include "common.helpers.namespace" $ }}
  labels:
    {{- include "common.helpers.labels" $ | nindent 4 }}
    app.kubernetes.io/component: {{ $name }}
spec:
  serviceName: {{ $statefulset.serviceName | default (printf "%s-%s" (include "common.helpers.fullname" $) $name) }}
  {{- if hasKey $statefulset "replicas" }}
  replicas: {{ $statefulset.replicas }}
  {{- else }}
  replicas: 1
  {{- end }}
  {{- if hasKey $statefulset "revisionHistoryLimit" }}
  revisionHistoryLimit: {{ $statefulset.revisionHistoryLimit }}
  {{- else }}
  revisionHistoryLimit: 3
  {{- end }}
  {{- with $statefulset.podManagementPolicy }}
  podManagementPolicy: {{ . }}
  {{- end }}
  updateStrategy:
    {{- toYaml $updateStrategy | nindent 4 }}
  selector:
    matchLabels:
      app.kubernetes.io/name: {{ include "common.helpers.name" $ }}
      app.kubernetes.io/instance: {{ $.Release.Name }}
      app.kubernetes.io/component: {{ $name }}
  template:
    metadata:
      labels:
        app.kubernetes.io/name: {{ include "common.helpers.name" $ }}
        app.kubernetes.io/instance: {{ $.Release.Name }}
        app.kubernetes.io/component: {{ $name }}
      {{- with $podSpec.annotations }}
      annotations:
        {{- range $key, $value := . }}
        {{ $key }}: {{ $value | quote }}
        {{- end }}
      {{- end }}
    spec:
      {{- with $podSpec.serviceAccountName }}
      serviceAccountName: {{ . }}
      {{- end }}
      automountServiceAccountToken: false
      enableServiceLinks: {{ $podSpec.enableServiceLinks | default false }}
      {{- if hasKey $podSpec "shareProcessNamespace" }}
      shareProcessNamespace: {{ $podSpec.shareProcessNamespace }}
      {{- end }}
      {{- if hasKey $podSpec "hostNetwork" }}
      hostNetwork: {{ $podSpec.hostNetwork }}
      {{- end }}
      {{- with $podSpec.hostAliases }}
      hostAliases:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $podSpec.dnsPolicy }}
      dnsPolicy: {{ . }}
      {{- end }}
      {{- with $podSpec.dnsConfig }}
      dnsConfig:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $podSpec.schedulerName }}
      schedulerName: {{ . }}
      {{- end }}
      {{- with $podSpec.runtimeClassName }}
      runtimeClassName: {{ . }}
      {{- end }}
      {{- if hasKey $podSpec "terminationGracePeriodSeconds" }}
      terminationGracePeriodSeconds: {{ $podSpec.terminationGracePeriodSeconds }}
      {{- end }}
      {{- with $podSpec.priorityClassName }}
      priorityClassName: {{ . }}
      {{- end }}
      {{- with $podSpec.topologySpreadConstraints }}
      topologySpreadConstraints:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $podSpec.imagePullSecrets }}
      imagePullSecrets:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      securityContext:
        {{- toYaml $podSecCtx | nindent 8 }}
      {{- with $podSpec.initContainers }}
      initContainers:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      containers:
        {{- range $containerName, $container := $podSpec.containers }}
        {{- include "common.helpers.container" (dict "root" $ "container" $container "containerName" $containerName) | nindent 8 }}
        {{- end }}
      {{- with $podSpec.volumes }}
      volumes:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $podSpec.nodeSelector }}
      nodeSelector:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $podSpec.affinity }}
      affinity:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $podSpec.tolerations }}
      tolerations:
        {{- toYaml . | nindent 8 }}
      {{- end }}
  {{- if $statefulset.volumeClaimTemplates }}
  {{- range $vct := $statefulset.volumeClaimTemplates }}
    {{- $_ := required (printf "statefulsets.%s.volumeClaimTemplates[].metadata.name is required" $name) (($vct.metadata | default dict).name) }}
    {{- $_ := required (printf "statefulsets.%s.volumeClaimTemplates[%s].spec.resources.requests.storage is required" $name $vct.metadata.name) ((((($vct.spec | default dict).resources) | default dict).requests | default dict).storage) }}
  {{- end }}
  volumeClaimTemplates:
    {{- toYaml $statefulset.volumeClaimTemplates | nindent 4 }}
  {{- end }}
  {{- end }}
  {{- end }}
{{- end -}}
