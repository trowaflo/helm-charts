{{/*
Default PostgreSQL parameters for the CNPG cluster.
Overridable via .Values.cnpgClusters.postgresql.postgresql.parameters.
*/}}
{{- define "ghostfolio.postgresqlDefaults" -}}
max_connections: "200"
shared_buffers: "256MB"
effective_cache_size: "1GB"
maintenance_work_mem: "64MB"
checkpoint_completion_target: "0.9"
wal_buffers: "16MB"
default_statistics_target: "100"
random_page_cost: "1.1"
effective_io_concurrency: "200"
work_mem: "2621kB"
min_wal_size: "1GB"
max_wal_size: "4GB"
{{- end -}}

{{/*
Default liveness probe for the main Ghostfolio container.
*/}}
{{- define "ghostfolio.livenessProbe" -}}
httpGet:
  path: /api/v1/health
  port: http
  scheme: HTTP
initialDelaySeconds: 30
periodSeconds: 10
timeoutSeconds: 5
failureThreshold: 3
successThreshold: 1
{{- end -}}

{{/*
Default readiness probe for the main Ghostfolio container.
*/}}
{{- define "ghostfolio.readinessProbe" -}}
httpGet:
  path: /api/v1/health
  port: http
  scheme: HTTP
initialDelaySeconds: 10
periodSeconds: 5
timeoutSeconds: 3
failureThreshold: 3
successThreshold: 1
{{- end -}}

{{/*
Default Redis exec probe (ping).
Requires $REDIS_PASSWORD env var in the container.
*/}}
{{- define "ghostfolio.redisProbe" -}}
exec:
  command:
    - sh
    - -c
    - redis-cli -a "$REDIS_PASSWORD" ping | grep PONG
{{- end -}}
