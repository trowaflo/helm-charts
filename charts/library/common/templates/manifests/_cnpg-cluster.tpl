{{- define "common.manifests.cnpgCluster" -}}
  {{- range $name, $cluster := .Values.cnpgClusters }}
    {{- if $cluster.enabled }}
---
apiVersion: postgresql.cnpg.io/v1
kind: Cluster
metadata:
  name: {{ include "common.helpers.fullname" $ }}-{{ $name }}
  namespace: {{ include "common.helpers.namespace" $ }}
  labels:
    {{- include "common.helpers.labels" $ | nindent 4 }}
    app.kubernetes.io/component: {{ $name }}
spec:
  {{- if hasKey $cluster "instances" }}
  instances: {{ $cluster.instances }}
  {{- else }}
  instances: 1
  {{- end }}

  imageName: {{ required (printf "cnpgClusters.%s.imageName is required when enabled" $name) $cluster.imageName }}

  # Storage configuration
  {{- $storage := required (printf "cnpgClusters.%s.storage is required when enabled" $name) $cluster.storage }}
  storage:
    {{- with $storage.storageClass }}
    storageClass: {{ . }}
    {{- end }}
    size: {{ required (printf "cnpgClusters.%s.storage.size is required when enabled" $name) $storage.size }}

  {{- if and $cluster.bootstrap (or $cluster.bootstrap.initdb $cluster.bootstrap.recovery) }}
  # Bootstrap configuration
  bootstrap:
    {{- if $cluster.bootstrap.initdb }}
    initdb:
      {{- with $cluster.bootstrap.initdb.database }}
      database: {{ . }}
      {{- end }}
      {{- with $cluster.bootstrap.initdb.owner }}
      owner: {{ . }}
      {{- end }}
      {{- with $cluster.bootstrap.initdb.secret }}
      secret:
        name: {{ .name }}
      {{- end }}
    {{- end }}
    {{- with $cluster.bootstrap.recovery }}
    recovery:
      {{- toYaml . | nindent 6 }}
    {{- end }}
  {{- end }}

  {{- if and $cluster.postgresql (or $cluster.postgresql.parameters $cluster.postgresql.pg_hba) }}
  # PostgreSQL configuration
  postgresql:
    {{- with $cluster.postgresql.parameters }}
    parameters:
      {{- toYaml . | nindent 6 }}
    {{- end }}
    {{- with $cluster.postgresql.pg_hba }}
    pg_hba:
      {{- toYaml . | nindent 6 }}
    {{- end }}
  {{- end }}

  {{- if $cluster.resources }}
  # Resources
  resources:
    {{- toYaml $cluster.resources | nindent 4 }}
  {{- end }}

  {{- if and $cluster.monitoring $cluster.monitoring.enabled }}
  # Monitoring (enabled only when monitoring.enabled is true)
  monitoring:
    enablePodMonitor: {{ $cluster.monitoring.podMonitorEnabled | default false }}
    {{- with $cluster.monitoring.customQueriesConfigMap }}
    customQueriesConfigMap:
      {{- toYaml . | nindent 6 }}
    {{- end }}
  {{- end }}

  {{- if and $cluster.backup (or $cluster.backup.barmanObjectStore $cluster.backup.retentionPolicy $cluster.backup.volumeSnapshot) }}
  # Backup configuration
  backup:
    {{- with $cluster.backup.barmanObjectStore }}
    barmanObjectStore:
      {{- toYaml . | nindent 6 }}
    {{- end }}
    {{- with $cluster.backup.retentionPolicy }}
    retentionPolicy: {{ . | quote }}
    {{- end }}
    {{- with $cluster.backup.volumeSnapshot }}
    volumeSnapshot:
      {{- toYaml . | nindent 6 }}
    {{- end }}
  {{- end }}

  {{- if $cluster.affinity }}
  # Affinity
  affinity:
    {{- toYaml $cluster.affinity | nindent 4 }}
  {{- end }}

  {{- if $cluster.nodeSelector }}
  # Node selector
  nodeSelector:
    {{- toYaml $cluster.nodeSelector | nindent 4 }}
  {{- end }}

  {{- if $cluster.tolerations }}
  # Tolerations
  tolerations:
    {{- toYaml $cluster.tolerations | nindent 4 }}
  {{- end }}

  {{- if $cluster.replicationSlots }}
  # Replication slots
  replicationSlots:
    {{- toYaml $cluster.replicationSlots | nindent 4 }}
  {{- end }}

  {{- if $cluster.externalClusters }}
  # External clusters
  externalClusters:
    {{- toYaml $cluster.externalClusters | nindent 4 }}
  {{- end }}
    {{- end }}
  {{- end }}
{{- end -}}
