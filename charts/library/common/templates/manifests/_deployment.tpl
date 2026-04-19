{{- define "common.manifests.deployment" -}}
  {{- range $name, $deployment := .Values.deployments }}
    {{- if $deployment.enabled }}
      {{- $_ := required (printf "deployments.%s.containers is required and must define at least one container when enabled" $name) $deployment.containers }}
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ include "common.helpers.fullname" $ }}-{{ $name }}
  namespace: {{ include "common.helpers.namespace" $ }}
  labels:
    {{- include "common.helpers.labels" $ | nindent 4 }}
    app.kubernetes.io/component: {{ $name }}
spec:
  {{- if hasKey $deployment "replicas" }}
  replicas: {{ $deployment.replicas }}
  {{- else }}
  replicas: 1
  {{- end }}
  {{- if hasKey $deployment "revisionHistoryLimit" }}
  revisionHistoryLimit: {{ $deployment.revisionHistoryLimit }}
  {{- else }}
  revisionHistoryLimit: 3
  {{- end }}
  {{- with $deployment.strategy }}
  strategy:
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
      {{- with $deployment.podAnnotations }}
      annotations:
        {{- range $key, $value := . }}
        {{ $key }}: {{ $value | quote }}
        {{- end }}
      {{- end }}
    spec:
      {{- with $deployment.serviceAccountName }}
      serviceAccountName: {{ . }}
      {{- end }}
      automountServiceAccountToken: false
      enableServiceLinks: {{ $deployment.enableServiceLinks | default false }}
      {{- if hasKey $deployment "shareProcessNamespace" }}
      shareProcessNamespace: {{ $deployment.shareProcessNamespace }}
      {{- end }}
      {{- if hasKey $deployment "hostNetwork" }}
      hostNetwork: {{ $deployment.hostNetwork }}
      {{- end }}
      {{- with $deployment.hostAliases }}
      hostAliases:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $deployment.dnsPolicy }}
      dnsPolicy: {{ . }}
      {{- end }}
      {{- with $deployment.dnsConfig }}
      dnsConfig:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $deployment.schedulerName }}
      schedulerName: {{ . }}
      {{- end }}
      {{- with $deployment.runtimeClassName }}
      runtimeClassName: {{ . }}
      {{- end }}
      {{- if hasKey $deployment "terminationGracePeriodSeconds" }}
      terminationGracePeriodSeconds: {{ $deployment.terminationGracePeriodSeconds }}
      {{- end }}
      {{- with $deployment.priorityClassName }}
      priorityClassName: {{ . }}
      {{- end }}
      {{- with $deployment.topologySpreadConstraints }}
      topologySpreadConstraints:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $deployment.imagePullSecrets }}
      imagePullSecrets:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $deployment.podSecurityContext }}
      securityContext:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $deployment.initContainers }}
      initContainers:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      containers:
        {{- range $containerName, $container := $deployment.containers }}
        {{- include "common.helpers.container" (dict "root" $ "container" $container "containerName" $containerName) | nindent 8 }}
        {{- end }}
      {{- with $deployment.volumes }}
      volumes:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $deployment.nodeSelector }}
      nodeSelector:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $deployment.affinity }}
      affinity:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $deployment.tolerations }}
      tolerations:
        {{- toYaml . | nindent 8 }}
      {{- end }}
    {{- end }}
  {{- end }}
{{- end -}}
