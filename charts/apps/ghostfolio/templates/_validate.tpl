{{/*
Fail fast if the chart is configured in an internally inconsistent way.

Current checks:
  - Main deployment references REDIS_PASSWORD via secrets.redis and cannot
    start without a Redis. If `statefulsets.redis.enabled=false`, the caller
    must provide an external Redis secret via `secrets.redis.existingSecret`
    or disable the main deployment.
  - Same for CNPG: `DATABASE_URL` env resolves through the CNPG-generated
    `<release>-postgresql-app` secret. Disabling the cluster requires either
    overriding deployments.main.containers.main.env.DATABASE_URL or disabling
    the main deployment.
*/}}
{{- define "ghostfolio.validate" -}}
  {{- $redisExisting := (.Values.secrets.redis | default dict).existingSecret -}}
  {{- if and .Values.deployments.main.enabled (not .Values.statefulsets.redis.enabled) (not $redisExisting) -}}
    {{- fail "ghostfolio: main deployment requires Redis. Enable statefulsets.redis OR set secrets.redis.existingSecret to an external Redis secret OR disable deployments.main." -}}
  {{- end -}}
  {{- if and .Values.deployments.main.enabled (not .Values.cnpgClusters.postgresql.enabled) -}}
    {{- fail "ghostfolio: main deployment requires PostgreSQL. Enable cnpgClusters.postgresql OR override deployments.main.containers.main.env.DATABASE_URL to point at an external database OR disable deployments.main." -}}
  {{- end -}}
  {{- if .Values.cronjobs.backup.enabled -}}
    {{- $vols := ((.Values.cronjobs.backup.podSpec | default dict).volumes) | default list -}}
    {{- $nfs := dict -}}
    {{- range $v := $vols -}}
      {{- if and (eq (get $v "name") "backup") $v.nfs -}}
        {{- $nfs = $v.nfs -}}
      {{- end -}}
    {{- end -}}
    {{- if or (not $nfs.server) (not $nfs.path) -}}
      {{- fail "ghostfolio: backup CronJob requires cronjobs.backup.podSpec.volumes[name=backup].nfs.server AND .nfs.path. Either set both, or disable cronjobs.backup." -}}
    {{- end -}}
  {{- end -}}
  {{- if .Values.jobs.restore.enabled -}}
    {{- $vols := ((.Values.jobs.restore.podSpec | default dict).volumes) | default list -}}
    {{- $nfs := dict -}}
    {{- range $v := $vols -}}
      {{- if and (eq (get $v "name") "backup") $v.nfs -}}
        {{- $nfs = $v.nfs -}}
      {{- end -}}
    {{- end -}}
    {{- if or (not $nfs.server) (not $nfs.path) -}}
      {{- fail "ghostfolio: restore Job requires jobs.restore.podSpec.volumes[name=backup].nfs.server AND .nfs.path. Either set both, or disable jobs.restore." -}}
    {{- end -}}
    {{- if not .Values.restore.restoreFile -}}
      {{- fail "ghostfolio: restore Job requires restore.restoreFile to be set (filename under the NFS backup mount)." -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
