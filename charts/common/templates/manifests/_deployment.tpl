{{- define "common.manifests.deployment" -}}
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ include "common.helpers.fullname" . }}
  namespace: {{ include "common.helpers.namespace" . }}
  labels:
    {{- include "common.helpers.labels" . | nindent 4 }}
spec:
  replicas: {{ .Values.replicaCount }}
  revisionHistoryLimit: {{ .Values.revisionHistoryLimit }}
  strategy:
    type: {{ .Values.strategyType }}
  selector:
    matchLabels:
      app.kubernetes.io/name: {{ include "common.helpers.name" . }}
      app.kubernetes.io/instance: {{ .Release.Name }}
  template:
    metadata:
      labels:
        app.kubernetes.io/name: {{ include "common.helpers.name" . }}
        app.kubernetes.io/instance: {{ .Release.Name }}
      annotations:
      {{- if .Values.podAnnotations }}
        {{- range $key, $value := .Values.podAnnotations }}
        {{ $key }}: {{ $value | quote }}
        {{- end }}
      {{- end }}
    spec:
      automountServiceAccountToken: false
    {{- with .Values.imagePullSecrets }}
      imagePullSecrets:
        {{- toYaml . | nindent 8 }}
    {{- end }}
    {{- if .Values.securityContext }}
      securityContext:
        {{- toYaml .Values.securityContext | nindent 8 }}
    {{- end }}
      containers:
        - name: {{ .Chart.Name }}
          image: "{{ .Values.image.repository }}:{{ include "common.helpers.imageTag" . }}"
          imagePullPolicy: {{ .Values.image.pullPolicy }}
          ports:
          {{- range .Values.services.ports }}
            - name: {{ .name }}
              containerPort: {{ .port }}
              protocol: {{ include "common.helpers.protocol" .protocol }}
          {{- end }}
          {{- if .Values.probes.liveness.enabled }}
          livenessProbe:
            httpGet:
              path: {{ .Values.probes.liveness.httpGet.path }}
              port: {{ .Values.probes.liveness.httpGet.port }}
              scheme: {{ .Values.probes.liveness.httpGet.scheme }}
            initialDelaySeconds: {{ .Values.probes.liveness.initialDelaySeconds }}
            failureThreshold: {{ .Values.probes.liveness.failureThreshold }}
            successThreshold: {{ .Values.probes.liveness.successThreshold }}
            periodSeconds: {{ .Values.probes.liveness.periodSeconds }}
            timeoutSeconds: {{ .Values.probes.liveness.timeoutSeconds }}
          {{- end }}
          {{- if .Values.probes.readiness.enabled }}
          readinessProbe:
            httpGet:
              path: {{ .Values.probes.liveness.httpGet.path }}
              port: {{ .Values.probes.liveness.httpGet.port }}
              scheme: {{ .Values.probes.liveness.httpGet.scheme }}
            initialDelaySeconds: {{ .Values.probes.liveness.initialDelaySeconds }}
            failureThreshold: {{ .Values.probes.liveness.failureThreshold }}
            successThreshold: {{ .Values.probes.liveness.successThreshold }}
            periodSeconds: {{ .Values.probes.liveness.periodSeconds }}
            timeoutSeconds: {{ .Values.probes.liveness.timeoutSeconds }}
          {{- end }}
          {{- if .Values.probes.startup.enabled }}
          startupProbe:
            httpGet:
              path: {{ .Values.probes.startup.httpGet.path }}
              port: {{ .Values.probes.startup.httpGet.port }}
              scheme: {{ .Values.probes.startup.httpGet.scheme }}
            initialDelaySeconds: {{ .Values.probes.startup.initialDelaySeconds }}
            failureThreshold: {{ .Values.probes.startup.failureThreshold }}
            successThreshold: {{ .Values.probes.startup.successThreshold }}
            periodSeconds: {{ .Values.probes.startup.periodSeconds }}
            timeoutSeconds: {{ .Values.probes.startup.timeoutSeconds }}
          {{- end }}
          env:
            {{- toYaml .Values.env | nindent 12 }}
          resources:
            {{- include "common.helpers.resources" . | nindent 12 }}
        {{- if .Values.podSecurityContext }}
          securityContext:
            {{- toYaml .Values.podSecurityContext | nindent 12 }}
        {{- end }}
      {{- with .Values.nodeSelector }}
      nodeSelector:
        {{- toYaml . | nindent 8 }}
      {{- end }}
    {{- with .Values.affinity }}
      affinity:
        {{- toYaml . | nindent 8 }}
    {{- end }}
    {{- with .Values.tolerations }}
      tolerations:
        {{- toYaml . | nindent 8 }}
    {{- end }}
...
{{- end -}}
