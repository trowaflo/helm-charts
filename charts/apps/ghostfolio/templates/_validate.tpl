{{/*
Fail fast if the chart is configured in an internally inconsistent way.

Current checks:
  - Main deployment requires PostgreSQL (CNPG). Disabling the cluster
    requires overriding deployments.main.containers.main.env.DATABASE_URL
    or disabling the main deployment.
  - Backup CronJob and restore Job require NFS volume configuration.
  - Restore Job requires restore.restoreFile to be set.
*/}}
{{- define "ghostfolio.validate" -}}
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
