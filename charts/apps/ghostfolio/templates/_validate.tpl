{{/*
Fail fast if the chart is configured in an internally inconsistent way.

Current checks:
  - Main deployment references REDIS_PASSWORD via `ghostfolio.secretName.redis`
    and cannot start without a Redis. If `statefulsets.redis.enabled=false`,
    the caller must provide an external Redis URL/secret: either set
    `ghostfolio.redis.auth.existingSecret` pointing to a pre-existing Secret,
    or disable the main deployment.
  - Same for CNPG: `DATABASE_URL` env resolves through the CNPG-generated
    `<release>-postgresql-app` secret. Disabling the cluster requires either
    an external DB secret (via `ghostfolio.database.bootstrap.existingSecret`
    won't cover DATABASE_URL, so this case requires a values override on the
    env block itself) or disabling the main deployment.
*/}}
{{- define "ghostfolio.validate" -}}
  {{- if and .Values.deployments.main.enabled (not .Values.statefulsets.redis.enabled) (not .Values.ghostfolio.redis.auth.existingSecret) -}}
    {{- fail "ghostfolio: main deployment requires Redis. Enable statefulsets.redis OR set ghostfolio.redis.auth.existingSecret to an external Redis secret OR disable deployments.main." -}}
  {{- end -}}
  {{- if and .Values.deployments.main.enabled (not .Values.cnpgClusters.postgresql.enabled) -}}
    {{- fail "ghostfolio: main deployment requires PostgreSQL. Enable cnpgClusters.postgresql OR override deployments.main.containers.main.env.DATABASE_URL to point at an external database OR disable deployments.main." -}}
  {{- end -}}
  {{- if .Values.cronjobs.backup.enabled -}}
    {{- $vols := .Values.cronjobs.backup.volumes | default list -}}
    {{- $nfs := dict -}}
    {{- range $v := $vols -}}
      {{- if and (eq (get $v "name") "backup") $v.nfs -}}
        {{- $nfs = $v.nfs -}}
      {{- end -}}
    {{- end -}}
    {{- if or (not $nfs.server) (not $nfs.path) -}}
      {{- fail "ghostfolio: backup CronJob requires cronjobs.backup.volumes[name=backup].nfs.server AND .nfs.path. Either set both, or disable cronjobs.backup." -}}
    {{- end -}}
  {{- end -}}
  {{- if .Values.jobs.restore.enabled -}}
    {{- $vols := .Values.jobs.restore.volumes | default list -}}
    {{- $nfs := dict -}}
    {{- range $v := $vols -}}
      {{- if and (eq (get $v "name") "backup") $v.nfs -}}
        {{- $nfs = $v.nfs -}}
      {{- end -}}
    {{- end -}}
    {{- if or (not $nfs.server) (not $nfs.path) -}}
      {{- fail "ghostfolio: restore Job requires jobs.restore.volumes[name=backup].nfs.server AND .nfs.path. Either set both, or disable jobs.restore." -}}
    {{- end -}}
    {{- if not .Values.restore.restoreFile -}}
      {{- fail "ghostfolio: restore Job requires restore.restoreFile to be set (filename under the NFS backup mount)." -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
