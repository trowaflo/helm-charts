{{- define "common.manifests.cronjob" -}}
  {{- range $name, $cronjob := .Values.cronjobs }}
    {{- if $cronjob.enabled }}
      {{- $_ := required (printf "cronjobs.%s.containers is required and must define at least one container when enabled" $name) $cronjob.containers }}
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
          {{- with $cronjob.podAnnotations }}
          annotations:
            {{- range $key, $value := . }}
            {{ $key }}: {{ $value | quote }}
            {{- end }}
          {{- end }}
        spec:
          restartPolicy: {{ $cronjob.restartPolicy | default "OnFailure" }}
          {{- with $cronjob.serviceAccountName }}
          serviceAccountName: {{ . }}
          {{- end }}
          automountServiceAccountToken: false
          enableServiceLinks: {{ $cronjob.enableServiceLinks | default false }}
          {{- if hasKey $cronjob "shareProcessNamespace" }}
          shareProcessNamespace: {{ $cronjob.shareProcessNamespace }}
          {{- end }}
          {{- if hasKey $cronjob "hostNetwork" }}
          hostNetwork: {{ $cronjob.hostNetwork }}
          {{- end }}
          {{- with $cronjob.hostAliases }}
          hostAliases:
            {{- toYaml . | nindent 12 }}
          {{- end }}
          {{- with $cronjob.dnsPolicy }}
          dnsPolicy: {{ . }}
          {{- end }}
          {{- with $cronjob.dnsConfig }}
          dnsConfig:
            {{- toYaml . | nindent 12 }}
          {{- end }}
          {{- with $cronjob.schedulerName }}
          schedulerName: {{ . }}
          {{- end }}
          {{- with $cronjob.runtimeClassName }}
          runtimeClassName: {{ . }}
          {{- end }}
          {{- if hasKey $cronjob "terminationGracePeriodSeconds" }}
          terminationGracePeriodSeconds: {{ $cronjob.terminationGracePeriodSeconds }}
          {{- end }}
          {{- with $cronjob.priorityClassName }}
          priorityClassName: {{ . }}
          {{- end }}
          {{- with $cronjob.topologySpreadConstraints }}
          topologySpreadConstraints:
            {{- toYaml . | nindent 12 }}
          {{- end }}
          {{- with $cronjob.imagePullSecrets }}
          imagePullSecrets:
            {{- toYaml . | nindent 12 }}
          {{- end }}
          {{- with $cronjob.podSecurityContext }}
          securityContext:
            {{- toYaml . | nindent 12 }}
          {{- end }}
          {{- with $cronjob.initContainers }}
          initContainers:
            {{- toYaml . | nindent 12 }}
          {{- end }}
          containers:
            {{- range $containerName, $container := $cronjob.containers }}
            {{- include "common.helpers.container" (dict "root" $ "container" $container "containerName" $containerName) | nindent 12 }}
            {{- end }}
          {{- with $cronjob.volumes }}
          volumes:
            {{- toYaml . | nindent 12 }}
          {{- end }}
          {{- with $cronjob.nodeSelector }}
          nodeSelector:
            {{- toYaml . | nindent 12 }}
          {{- end }}
          {{- with $cronjob.affinity }}
          affinity:
            {{- toYaml . | nindent 12 }}
          {{- end }}
          {{- with $cronjob.tolerations }}
          tolerations:
            {{- toYaml . | nindent 12 }}
          {{- end }}
    {{- end }}
  {{- end }}
{{- end -}}
