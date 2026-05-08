{{- define "common.manifests.cronjob" -}}
  {{- range $name := keys .Values.cronjobs | sortAlpha }}
    {{- $cronjob := index $.Values.cronjobs $name }}
    {{- if $cronjob.enabled }}
      {{- $podSpec := $cronjob.podSpec | default dict -}}
      {{- $_ := required (printf "cronjobs.%s.podSpec.containers is required and must define at least one container when enabled" $name) $podSpec.containers }}
      {{- $defaultPodSecCtx := dict "runAsNonRoot" true "fsGroupChangePolicy" "OnRootMismatch" -}}
      {{- $podSecCtx := mergeOverwrite (deepCopy $defaultPodSecCtx) ($podSpec.securityContext | default dict) }}
---
apiVersion: batch/v1
kind: CronJob
metadata:
  name: {{ include "common.helpers.fullname" $ }}-{{ $name }}
  namespace: {{ include "common.helpers.namespace" $ }}
  labels:
    {{- include "common.helpers.labels" $ | nindent 4 }}
    app.kubernetes.io/component: {{ $name }}
spec:
  schedule: {{ $cronjob.schedule | quote }}
  {{- with $cronjob.timeZone }}
  timeZone: {{ . | quote }}
  {{- end }}
  {{- if hasKey $cronjob "suspend" }}
  suspend: {{ $cronjob.suspend }}
  {{- end }}
  {{- if hasKey $cronjob "successfulJobsHistoryLimit" }}
  successfulJobsHistoryLimit: {{ $cronjob.successfulJobsHistoryLimit }}
  {{- else }}
  successfulJobsHistoryLimit: 3
  {{- end }}
  {{- if hasKey $cronjob "failedJobsHistoryLimit" }}
  failedJobsHistoryLimit: {{ $cronjob.failedJobsHistoryLimit }}
  {{- else }}
  failedJobsHistoryLimit: 3
  {{- end }}
  concurrencyPolicy: {{ $cronjob.concurrencyPolicy | default "Forbid" }}
  {{- if hasKey $cronjob "startingDeadlineSeconds" }}
  startingDeadlineSeconds: {{ $cronjob.startingDeadlineSeconds }}
  {{- end }}
  jobTemplate:
    spec:
      {{- if hasKey $cronjob "ttlSecondsAfterFinished" }}
      ttlSecondsAfterFinished: {{ $cronjob.ttlSecondsAfterFinished }}
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
            {{- toYaml . | nindent 12 }}
          {{- end }}
          {{- with $podSpec.dnsPolicy }}
          dnsPolicy: {{ . }}
          {{- end }}
          {{- with $podSpec.dnsConfig }}
          dnsConfig:
            {{- toYaml . | nindent 12 }}
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
            {{- toYaml . | nindent 12 }}
          {{- end }}
          {{- with $podSpec.imagePullSecrets }}
          imagePullSecrets:
            {{- toYaml . | nindent 12 }}
          {{- end }}
          securityContext:
            {{- toYaml $podSecCtx | nindent 12 }}
          {{- with $podSpec.initContainers }}
          initContainers:
            {{- toYaml . | nindent 12 }}
          {{- end }}
          containers:
            {{- range $containerName, $container := $podSpec.containers }}
            {{- include "common.helpers.container" (dict "root" $ "container" $container "containerName" $containerName) | nindent 12 }}
            {{- end }}
          {{- with $podSpec.volumes }}
          volumes:
            {{- toYaml . | nindent 12 }}
          {{- end }}
          {{- with $podSpec.nodeSelector }}
          nodeSelector:
            {{- toYaml . | nindent 12 }}
          {{- end }}
          {{- with $podSpec.affinity }}
          affinity:
            {{- toYaml . | nindent 12 }}
          {{- end }}
          {{- with $podSpec.tolerations }}
          tolerations:
            {{- toYaml . | nindent 12 }}
          {{- end }}
    {{- end }}
  {{- end }}
{{- end -}}
