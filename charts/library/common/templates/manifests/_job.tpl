{{- define "common.manifests.job" -}}
  {{- range $name := keys .Values.jobs | sortAlpha }}
    {{- $job := index $.Values.jobs $name }}
    {{- if $job.enabled }}
      {{- $podSpec := $job.podSpec | default dict -}}
      {{- $_ := required (printf "jobs.%s.podSpec.containers is required and must define at least one container when enabled" $name) $podSpec.containers }}
      {{- $defaultPodSecCtx := dict "runAsNonRoot" true "fsGroupChangePolicy" "OnRootMismatch" -}}
      {{- $podSecCtx := mergeOverwrite (deepCopy $defaultPodSecCtx) ($podSpec.securityContext | default dict) }}
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
      {{- with $podSpec.annotations }}
      annotations:
        {{- range $key, $value := . }}
        {{ $key }}: {{ $value | quote }}
        {{- end }}
      {{- end }}
    spec:
      restartPolicy: {{ $podSpec.restartPolicy | default "OnFailure" }}
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
    {{- end }}
  {{- end }}
{{- end -}}
