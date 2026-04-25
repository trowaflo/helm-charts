# ghostfolio

![Version: 9.0.0](https://img.shields.io/badge/Version-9.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Privacy-first open source portfolio tracker with PostgreSQL (CNPG) and Redis support.
ArgoCD-compatible chart with no drift from lookup or randAlphaNum - all secrets externally managed.
Includes automated backup to NFS and manual restore capabilities.

**Homepage:** <https://ghostfol.io>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| trowaflo | <trowa.flo@gmail.com> |  |

## Source Code

* <https://github.com/ghostfolio/ghostfolio>
* <https://github.com/trowaflo/helm-charts>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../library/common | common | 4.0.0 |
| oci://oci.trueforge.org/truecharts | valkey | 2.1.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| backup.retention | int | `7` |  |
| cnpgClusters.postgresql.backup.enabled | bool | `false` |  |
| cnpgClusters.postgresql.backup.retentionPolicy | string | `"30d"` |  |
| cnpgClusters.postgresql.bootstrap.initdb.database | string | `"ghostfolio"` |  |
| cnpgClusters.postgresql.bootstrap.initdb.owner | string | `"ghostfolio"` |  |
| cnpgClusters.postgresql.bootstrap.initdb.secret.name | string | `"{{ include \"common.helpers.secretName\" (dict \"root\" . \"name\" \"db-bootstrap\") }}"` |  |
| cnpgClusters.postgresql.enabled | bool | `true` |  |
| cnpgClusters.postgresql.imageName | string | `"ghcr.io/cloudnative-pg/postgresql:16.6"` |  |
| cnpgClusters.postgresql.instances | int | `1` |  |
| cnpgClusters.postgresql.monitoring.enabled | bool | `false` |  |
| cnpgClusters.postgresql.monitoring.podMonitorEnabled | bool | `false` |  |
| cnpgClusters.postgresql.postgresql.parameters.checkpoint_completion_target | string | `"0.9"` |  |
| cnpgClusters.postgresql.postgresql.parameters.default_statistics_target | string | `"100"` |  |
| cnpgClusters.postgresql.postgresql.parameters.effective_cache_size | string | `"1GB"` |  |
| cnpgClusters.postgresql.postgresql.parameters.effective_io_concurrency | string | `"200"` |  |
| cnpgClusters.postgresql.postgresql.parameters.maintenance_work_mem | string | `"64MB"` |  |
| cnpgClusters.postgresql.postgresql.parameters.max_connections | string | `"200"` |  |
| cnpgClusters.postgresql.postgresql.parameters.max_wal_size | string | `"4GB"` |  |
| cnpgClusters.postgresql.postgresql.parameters.min_wal_size | string | `"1GB"` |  |
| cnpgClusters.postgresql.postgresql.parameters.random_page_cost | string | `"1.1"` |  |
| cnpgClusters.postgresql.postgresql.parameters.shared_buffers | string | `"256MB"` |  |
| cnpgClusters.postgresql.postgresql.parameters.wal_buffers | string | `"16MB"` |  |
| cnpgClusters.postgresql.postgresql.parameters.work_mem | string | `"2621kB"` |  |
| cnpgClusters.postgresql.resources.limits.cpu | string | `"2000m"` |  |
| cnpgClusters.postgresql.resources.limits.memory | string | `"1Gi"` |  |
| cnpgClusters.postgresql.resources.requests.cpu | string | `"100m"` |  |
| cnpgClusters.postgresql.resources.requests.memory | string | `"256Mi"` |  |
| cnpgClusters.postgresql.storage.size | string | `"10Gi"` |  |
| cnpgClusters.postgresql.storage.storageClass | string | `""` |  |
| cronjobs.backup.enabled | bool | `false` |  |
| cronjobs.backup.podSpec.containers.backup.command[0] | string | `"/bin/bash"` |  |
| cronjobs.backup.podSpec.containers.backup.command[1] | string | `"-c"` |  |
| cronjobs.backup.podSpec.containers.backup.command[2] | string | `"set -e\nBACKUP_FILE=\"/backup/ghostfolio-$(date +%Y-%m-%d-%H%M%S).dump\"\necho \"Starting backup to $BACKUP_FILE\"\npg_dump -Fc -v -f \"$BACKUP_FILE\" \"$DATABASE_URL\"\necho \"Backup completed: $BACKUP_FILE\"\necho \"Verifying backup integrity...\"\npg_restore --list \"$BACKUP_FILE\" > /dev/null\necho \"Backup verification successful\"\necho \"Cleaning up old backups (keeping last {{ .Values.backup.retention | default 7 }})\"\ncd /backup\nls -t ghostfolio-*.dump | tail -n +{{ add1 (.Values.backup.retention | default 7) }} | xargs -r rm -f\necho \"Backup process completed successfully\"\n"` |  |
| cronjobs.backup.podSpec.containers.backup.env.DATABASE_URL.secretKeyRef.key | string | `"uri"` |  |
| cronjobs.backup.podSpec.containers.backup.env.DATABASE_URL.secretKeyRef.name | string | `"{{ include \"common.helpers.cnpgAppSecret\" (dict \"root\" . \"name\" \"postgresql\") }}"` |  |
| cronjobs.backup.podSpec.containers.backup.imageSelector | string | `"postgresImage"` |  |
| cronjobs.backup.podSpec.containers.backup.resources.limits.cpu | string | `"500m"` |  |
| cronjobs.backup.podSpec.containers.backup.resources.limits.memory | string | `"512Mi"` |  |
| cronjobs.backup.podSpec.containers.backup.resources.requests.cpu | string | `"100m"` |  |
| cronjobs.backup.podSpec.containers.backup.resources.requests.memory | string | `"128Mi"` |  |
| cronjobs.backup.podSpec.containers.backup.securityContext.readOnlyRootFilesystem | bool | `false` |  |
| cronjobs.backup.podSpec.containers.backup.volumeMounts[0].mountPath | string | `"/backup"` |  |
| cronjobs.backup.podSpec.containers.backup.volumeMounts[0].name | string | `"backup"` |  |
| cronjobs.backup.podSpec.securityContext.fsGroup | int | `999` |  |
| cronjobs.backup.podSpec.securityContext.runAsGroup | int | `999` |  |
| cronjobs.backup.podSpec.securityContext.runAsNonRoot | bool | `true` |  |
| cronjobs.backup.podSpec.securityContext.runAsUser | int | `999` |  |
| cronjobs.backup.podSpec.volumes[0].name | string | `"backup"` |  |
| cronjobs.backup.podSpec.volumes[0].nfs.path | string | `""` |  |
| cronjobs.backup.podSpec.volumes[0].nfs.server | string | `""` |  |
| cronjobs.backup.schedule | string | `"0 2 * * *"` |  |
| deployments.main.enabled | bool | `true` |  |
| deployments.main.podSpec.containers.main.env.ACCESS_TOKEN_SALT.secretKeyRef.key | string | `"ACCESS_TOKEN_SALT"` |  |
| deployments.main.podSpec.containers.main.env.ACCESS_TOKEN_SALT.secretKeyRef.name | string | `"ghostfolio-secrets"` |  |
| deployments.main.podSpec.containers.main.env.DATABASE_URL.secretKeyRef.key | string | `"DATABASE_URL"` |  |
| deployments.main.podSpec.containers.main.env.DATABASE_URL.secretKeyRef.name | string | `"ghostfolio-secrets"` |  |
| deployments.main.podSpec.containers.main.env.JWT_SECRET_KEY.secretKeyRef.key | string | `"JWT_SECRET_KEY"` |  |
| deployments.main.podSpec.containers.main.env.JWT_SECRET_KEY.secretKeyRef.name | string | `"ghostfolio-secrets"` |  |
| deployments.main.podSpec.containers.main.env.NODE_ENV | string | `"production"` |  |
| deployments.main.podSpec.containers.main.env.REDIS_HOST | string | `"{{ include \"common.helpers.fullname\" . }}-redis"` |  |
| deployments.main.podSpec.containers.main.env.REDIS_PASSWORD.secretKeyRef.key | string | `"REDIS_PASSWORD"` |  |
| deployments.main.podSpec.containers.main.env.REDIS_PASSWORD.secretKeyRef.name | string | `"{{ include \"common.helpers.secretName\" (dict \"root\" . \"name\" \"redis\") }}"` |  |
| deployments.main.podSpec.containers.main.env.REDIS_PORT | string | `"6379"` |  |
| deployments.main.podSpec.containers.main.imageSelector | string | `"image"` |  |
| deployments.main.podSpec.containers.main.livenessProbe.httpGet.path | string | `"/api/v1/health"` |  |
| deployments.main.podSpec.containers.main.livenessProbe.httpGet.port | string | `"http"` |  |
| deployments.main.podSpec.containers.main.livenessProbe.httpGet.scheme | string | `"HTTP"` |  |
| deployments.main.podSpec.containers.main.livenessProbe.initialDelaySeconds | int | `30` |  |
| deployments.main.podSpec.containers.main.ports.http.containerPort | int | `3333` |  |
| deployments.main.podSpec.containers.main.ports.http.protocol | string | `"TCP"` |  |
| deployments.main.podSpec.containers.main.readinessProbe.httpGet.path | string | `"/api/v1/health"` |  |
| deployments.main.podSpec.containers.main.readinessProbe.httpGet.port | string | `"http"` |  |
| deployments.main.podSpec.containers.main.readinessProbe.httpGet.scheme | string | `"HTTP"` |  |
| deployments.main.podSpec.containers.main.readinessProbe.initialDelaySeconds | int | `10` |  |
| deployments.main.podSpec.containers.main.readinessProbe.periodSeconds | int | `5` |  |
| deployments.main.podSpec.containers.main.readinessProbe.timeoutSeconds | int | `3` |  |
| deployments.main.podSpec.containers.main.resources.limits.cpu | string | `"1000m"` |  |
| deployments.main.podSpec.containers.main.resources.limits.memory | string | `"512Mi"` |  |
| deployments.main.podSpec.containers.main.resources.requests.cpu | string | `"100m"` |  |
| deployments.main.podSpec.containers.main.resources.requests.memory | string | `"256Mi"` |  |
| deployments.main.podSpec.securityContext.fsGroup | int | `1000` |  |
| deployments.main.podSpec.securityContext.runAsGroup | int | `1000` |  |
| deployments.main.podSpec.securityContext.runAsNonRoot | bool | `true` |  |
| deployments.main.podSpec.securityContext.runAsUser | int | `1000` |  |
| deployments.main.strategy.type | string | `"Recreate"` |  |
| global.affinity | object | `{}` |  |
| global.imagePullSecrets | list | `[]` |  |
| global.nodeSelector | object | `{}` |  |
| global.tolerations | list | `[]` |  |
| image.repository | string | `"ghostfolio/ghostfolio"` |  |
| image.tag | string | `"2.255.0@sha256:d3ed46a9a5c82db4457ff919be07f02add26e9f5f116be86793ced9aa422e6d3"` |  |
| ingresses.main.enabled | bool | `false` |  |
| ingresses.main.hosts[0].host | string | `"ghostfolio.example.com"` |  |
| ingresses.main.hosts[0].paths[0].path | string | `"/"` |  |
| ingresses.main.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| ingresses.main.hosts[0].paths[0].port | string | `"http"` |  |
| ingresses.main.hosts[0].paths[0].service | string | `"main"` |  |
| ingresses.main.tls | list | `[]` |  |
| jobs.restore.enabled | bool | `false` |  |
| jobs.restore.podSpec.containers.restore.command[0] | string | `"/bin/bash"` |  |
| jobs.restore.podSpec.containers.restore.command[1] | string | `"-c"` |  |
| jobs.restore.podSpec.containers.restore.command[2] | string | `"set -e\nRESTORE_FILE=\"/backup/{{ .Values.restore.restoreFile }}\"\nif [ ! -f \"$RESTORE_FILE\" ]; then\n  echo \"ERROR: Restore file not found: $RESTORE_FILE\"\n  exit 1\nfi\necho \"Starting restore from $RESTORE_FILE\"\necho \"Verifying backup file integrity...\"\npg_restore --list \"$RESTORE_FILE\" > /dev/null\necho \"Backup file verification successful\"\necho \"Restoring database...\"\npg_restore -v --clean --if-exists -d \"$DATABASE_URL\" \"$RESTORE_FILE\" || true\necho \"Restore process completed\"\n"` |  |
| jobs.restore.podSpec.containers.restore.env.DATABASE_URL.secretKeyRef.key | string | `"uri"` |  |
| jobs.restore.podSpec.containers.restore.env.DATABASE_URL.secretKeyRef.name | string | `"{{ include \"common.helpers.cnpgAppSecret\" (dict \"root\" . \"name\" \"postgresql\") }}"` |  |
| jobs.restore.podSpec.containers.restore.imageSelector | string | `"postgresImage"` |  |
| jobs.restore.podSpec.containers.restore.resources.limits.cpu | string | `"500m"` |  |
| jobs.restore.podSpec.containers.restore.resources.limits.memory | string | `"512Mi"` |  |
| jobs.restore.podSpec.containers.restore.resources.requests.cpu | string | `"100m"` |  |
| jobs.restore.podSpec.containers.restore.resources.requests.memory | string | `"128Mi"` |  |
| jobs.restore.podSpec.containers.restore.securityContext.readOnlyRootFilesystem | bool | `false` |  |
| jobs.restore.podSpec.containers.restore.volumeMounts[0].mountPath | string | `"/backup"` |  |
| jobs.restore.podSpec.containers.restore.volumeMounts[0].name | string | `"backup"` |  |
| jobs.restore.podSpec.containers.restore.volumeMounts[0].readOnly | bool | `true` |  |
| jobs.restore.podSpec.securityContext.fsGroup | int | `999` |  |
| jobs.restore.podSpec.securityContext.runAsGroup | int | `999` |  |
| jobs.restore.podSpec.securityContext.runAsNonRoot | bool | `true` |  |
| jobs.restore.podSpec.securityContext.runAsUser | int | `999` |  |
| jobs.restore.podSpec.volumes[0].name | string | `"backup"` |  |
| jobs.restore.podSpec.volumes[0].nfs.path | string | `""` |  |
| jobs.restore.podSpec.volumes[0].nfs.server | string | `""` |  |
| jobs.restore.ttlSecondsAfterFinished | int | `86400` |  |
| k8sServices.main.enabled | bool | `true` |  |
| k8sServices.main.ports.http.port | int | `3333` |  |
| k8sServices.main.ports.http.protocol | string | `"TCP"` |  |
| k8sServices.main.type | string | `"ClusterIP"` |  |
| postgresImage.repository | string | `"postgres"` |  |
| postgresImage.tag | string | `"16@sha256:71e27bf60b70bded003791b5573f8b808365613f341df20ffcf0c1ed7bc13ddf"` |  |
| redisImage.repository | string | `"redis"` |  |
| redisImage.tag | string | `"8.4.2-alpine@sha256:94dc16bdd00af588f596f01a4e44c1092c31d032e4d00a7537f1269eb0a2aa8e"` |  |
| restore.restoreFile | string | `""` |  |
| secrets.ghostfolio-secrets.data.ACCESS_TOKEN_SALT | string | `""` |  |
| secrets.ghostfolio-secrets.data.DATABASE_URL | string | `""` |  |
| secrets.ghostfolio-secrets.data.JWT_SECRET_KEY | string | `""` |  |
| secrets.ghostfolio-secrets.enabled | bool | `true` |  |
| secrets.ghostfolio-secrets.existingSecret | string | `""` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
