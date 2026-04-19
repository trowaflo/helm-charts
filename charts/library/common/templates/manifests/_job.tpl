{{- define "common.manifests.job" -}}
  {{- range $name, $job := .Values.jobs }}
    {{- if $job.enabled }}
      {{- $_ := required (printf "jobs.%s.containers is required and must define at least one container when enabled" $name) $job.containers }}
---
apiVersion: batch/v1
kind: Job
metadata:
  name: {{ include "common.helpers.fullname" $ }}-{{ $name }}
  namespace: {{ include "common.helpers.namespace" $ }}
  labels:
    {{- include "common.helpers.labels" $ | nindent 4 }}
    app.kubernetes.io/component: {{ $name }}
spec:
  {{- if hasKey $job "completions" }}
  completions: {{ $job.completions }}
  {{- end }}
  {{- if hasKey $job "parallelism" }}
  parallelism: {{ $job.parallelism }}
  {{- end }}
  {{- if hasKey $job "activeDeadlineSeconds" }}
  activeDeadlineSeconds: {{ $job.activeDeadlineSeconds }}
  {{- end }}
  {{- if hasKey $job "ttlSecondsAfterFinished" }}
  ttlSecondsAfterFinished: {{ $job.ttlSecondsAfterFinished }}
  {{- end }}
  {{- if hasKey $job "backoffLimit" }}
  backoffLimit: {{ $job.backoffLimit }}
  {{- end }}
  {{- with $job.podFailurePolicy }}
  podFailurePolicy:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  template:
    metadata:
      labels:
        app.kubernetes.io/name: {{ include "common.helpers.name" $ }}
        app.kubernetes.io/instance: {{ $.Release.Name }}
        app.kubernetes.io/component: {{ $name }}
      {{- with $job.podAnnotations }}
      annotations:
        {{- range $key, $value := . }}
        {{ $key }}: {{ $value | quote }}
        {{- end }}
      {{- end }}
    spec:
      restartPolicy: {{ $job.restartPolicy | default "OnFailure" }}
      {{- with $job.serviceAccountName }}
      serviceAccountName: {{ . }}
      {{- end }}
      automountServiceAccountToken: false
      enableServiceLinks: {{ $job.enableServiceLinks | default false }}
      {{- if hasKey $job "shareProcessNamespace" }}
      shareProcessNamespace: {{ $job.shareProcessNamespace }}
      {{- end }}
      {{- if hasKey $job "hostNetwork" }}
      hostNetwork: {{ $job.hostNetwork }}
      {{- end }}
      {{- with $job.hostAliases }}
      hostAliases:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $job.dnsPolicy }}
      dnsPolicy: {{ . }}
      {{- end }}
      {{- with $job.dnsConfig }}
      dnsConfig:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $job.schedulerName }}
      schedulerName: {{ . }}
      {{- end }}
      {{- with $job.runtimeClassName }}
      runtimeClassName: {{ . }}
      {{- end }}
      {{- if hasKey $job "terminationGracePeriodSeconds" }}
      terminationGracePeriodSeconds: {{ $job.terminationGracePeriodSeconds }}
      {{- end }}
      {{- with $job.priorityClassName }}
      priorityClassName: {{ . }}
      {{- end }}
      {{- with $job.topologySpreadConstraints }}
      topologySpreadConstraints:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $job.imagePullSecrets }}
      imagePullSecrets:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $job.podSecurityContext }}
      securityContext:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $job.initContainers }}
      initContainers:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      containers:
        {{- range $containerName, $container := $job.containers }}
        {{- include "common.helpers.container" (dict "root" $ "container" $container "containerName" $containerName) | nindent 8 }}
        {{- end }}
      {{- with $job.volumes }}
      volumes:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $job.nodeSelector }}
      nodeSelector:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $job.affinity }}
      affinity:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $job.tolerations }}
      tolerations:
        {{- toYaml . | nindent 8 }}
      {{- end }}
    {{- end }}
  {{- end }}
{{- end -}}
