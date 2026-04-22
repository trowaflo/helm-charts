{{- define "common.manifests.statefulset" -}}
  {{- range $name := keys .Values.statefulsets | sortAlpha }}
    {{- $statefulset := index $.Values.statefulsets $name }}
    {{- if $statefulset.enabled }}
      {{- $_ := required (printf "statefulsets.%s.containers is required and must define at least one container when enabled" $name) $statefulset.containers }}
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
  {{- with $statefulset.updateStrategy }}
  updateStrategy:
    {{- toYaml . | nindent 4 }}
  {{- end }}
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
      {{- with $statefulset.podAnnotations }}
      annotations:
        {{- range $key, $value := . }}
        {{ $key }}: {{ $value | quote }}
        {{- end }}
      {{- end }}
    spec:
      {{- with $statefulset.serviceAccountName }}
      serviceAccountName: {{ . }}
      {{- end }}
      automountServiceAccountToken: false
      enableServiceLinks: {{ $statefulset.enableServiceLinks | default false }}
      {{- if hasKey $statefulset "shareProcessNamespace" }}
      shareProcessNamespace: {{ $statefulset.shareProcessNamespace }}
      {{- end }}
      {{- if hasKey $statefulset "hostNetwork" }}
      hostNetwork: {{ $statefulset.hostNetwork }}
      {{- end }}
      {{- with $statefulset.hostAliases }}
      hostAliases:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $statefulset.dnsPolicy }}
      dnsPolicy: {{ . }}
      {{- end }}
      {{- with $statefulset.dnsConfig }}
      dnsConfig:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $statefulset.schedulerName }}
      schedulerName: {{ . }}
      {{- end }}
      {{- with $statefulset.runtimeClassName }}
      runtimeClassName: {{ . }}
      {{- end }}
      {{- if hasKey $statefulset "terminationGracePeriodSeconds" }}
      terminationGracePeriodSeconds: {{ $statefulset.terminationGracePeriodSeconds }}
      {{- end }}
      {{- with $statefulset.priorityClassName }}
      priorityClassName: {{ . }}
      {{- end }}
      {{- with $statefulset.topologySpreadConstraints }}
      topologySpreadConstraints:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $statefulset.imagePullSecrets }}
      imagePullSecrets:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $statefulset.podSecurityContext }}
      securityContext:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $statefulset.initContainers }}
      initContainers:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      containers:
        {{- range $containerName, $container := $statefulset.containers }}
        {{- include "common.helpers.container" (dict "root" $ "container" $container "containerName" $containerName) | nindent 8 }}
        {{- end }}
      {{- with $statefulset.volumes }}
      volumes:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $statefulset.nodeSelector }}
      nodeSelector:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $statefulset.affinity }}
      affinity:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $statefulset.tolerations }}
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
