# ghostfolio

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

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
| file://../../library/common | common | 2.2.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| backup.retention | int | `7` |  |
| cnpgClusters.postgresql.backup.enabled | bool | `false` |  |
| cnpgClusters.postgresql.backup.retentionPolicy | string | `"30d"` |  |
| cnpgClusters.postgresql.bootstrap.initdb.database | string | `"ghostfolio"` |  |
| cnpgClusters.postgresql.bootstrap.initdb.owner | string | `"ghostfolio"` |  |
| cnpgClusters.postgresql.bootstrap.initdb.secret.name | string | `"ghostfolio-db-app-secret"` |  |
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
| cronjobs.backup.concurrencyPolicy | string | `"Forbid"` |  |
| cronjobs.backup.containers.backup.command[0] | string | `"/bin/bash"` |  |
| cronjobs.backup.containers.backup.command[1] | string | `"-c"` |  |
| cronjobs.backup.containers.backup.command[2] | string | `"set -e\nBACKUP_FILE=\"/backup/ghostfolio-$(date +%Y-%m-%d-%H%M%S).dump\"\necho \"Starting backup to $BACKUP_FILE\"\npg_dump -Fc -v -f \"$BACKUP_FILE\" \"$DATABASE_URL\"\necho \"Backup completed: $BACKUP_FILE\"\necho \"Verifying backup integrity...\"\npg_restore --list \"$BACKUP_FILE\" > /dev/null\necho \"Backup verification successful\"\necho \"Cleaning up old backups (keeping last {{ .Values.backup.retention | default 7 }})\"\ncd /backup\nls -t ghostfolio-*.dump | tail -n +{{ add1 (.Values.backup.retention | default 7) }} | xargs -r rm -f\necho \"Backup process completed successfully\"\n"` |  |
| cronjobs.backup.containers.backup.env[0].name | string | `"DATABASE_URL"` |  |
| cronjobs.backup.containers.backup.env[0].valueFrom.secretKeyRef.key | string | `"DATABASE_URL"` |  |
| cronjobs.backup.containers.backup.env[0].valueFrom.secretKeyRef.name | string | `"ghostfolio-db-secret"` |  |
| cronjobs.backup.containers.backup.image.pullPolicy | string | `"IfNotPresent"` |  |
| cronjobs.backup.containers.backup.image.repository | string | `"postgres"` |  |
| cronjobs.backup.containers.backup.image.tag | string | `"16"` |  |
| cronjobs.backup.containers.backup.resources.limits.cpu | string | `"500m"` |  |
| cronjobs.backup.containers.backup.resources.limits.memory | string | `"512Mi"` |  |
| cronjobs.backup.containers.backup.resources.requests.cpu | string | `"100m"` |  |
| cronjobs.backup.containers.backup.resources.requests.memory | string | `"128Mi"` |  |
| cronjobs.backup.containers.backup.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| cronjobs.backup.containers.backup.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| cronjobs.backup.containers.backup.securityContext.readOnlyRootFilesystem | bool | `false` |  |
| cronjobs.backup.containers.backup.volumeMounts[0].mountPath | string | `"/backup"` |  |
| cronjobs.backup.containers.backup.volumeMounts[0].name | string | `"backup"` |  |
| cronjobs.backup.enabled | bool | `false` |  |
| cronjobs.backup.failedJobsHistoryLimit | int | `3` |  |
| cronjobs.backup.podSecurityContext.fsGroup | int | `999` |  |
| cronjobs.backup.podSecurityContext.runAsGroup | int | `999` |  |
| cronjobs.backup.podSecurityContext.runAsNonRoot | bool | `true` |  |
| cronjobs.backup.podSecurityContext.runAsUser | int | `999` |  |
| cronjobs.backup.schedule | string | `"0 2 * * *"` |  |
| cronjobs.backup.successfulJobsHistoryLimit | int | `3` |  |
| cronjobs.backup.volumes[0].name | string | `"backup"` |  |
| cronjobs.backup.volumes[0].nfs.path | string | `""` |  |
| cronjobs.backup.volumes[0].nfs.server | string | `""` |  |
| deployment.containers.main.env[0].name | string | `"DATABASE_URL"` |  |
| deployment.containers.main.env[0].valueFrom.secretKeyRef.key | string | `"DATABASE_URL"` |  |
| deployment.containers.main.env[0].valueFrom.secretKeyRef.name | string | `"ghostfolio-db-secret"` |  |
| deployment.containers.main.env[1].name | string | `"REDIS_HOST"` |  |
| deployment.containers.main.env[1].value | string | `"{{ include \"common.helpers.fullname\" . }}-redis"` |  |
| deployment.containers.main.env[2].name | string | `"REDIS_PORT"` |  |
| deployment.containers.main.env[2].value | string | `"6379"` |  |
| deployment.containers.main.env[3].name | string | `"REDIS_PASSWORD"` |  |
| deployment.containers.main.env[3].valueFrom.secretKeyRef.key | string | `"REDIS_PASSWORD"` |  |
| deployment.containers.main.env[3].valueFrom.secretKeyRef.name | string | `"ghostfolio-redis-secret"` |  |
| deployment.containers.main.env[4].name | string | `"ACCESS_TOKEN_SALT"` |  |
| deployment.containers.main.env[4].valueFrom.secretKeyRef.key | string | `"ACCESS_TOKEN_SALT"` |  |
| deployment.containers.main.env[4].valueFrom.secretKeyRef.name | string | `"ghostfolio-secrets"` |  |
| deployment.containers.main.env[5].name | string | `"JWT_SECRET_KEY"` |  |
| deployment.containers.main.env[5].valueFrom.secretKeyRef.key | string | `"JWT_SECRET_KEY"` |  |
| deployment.containers.main.env[5].valueFrom.secretKeyRef.name | string | `"ghostfolio-secrets"` |  |
| deployment.containers.main.env[6].name | string | `"NODE_ENV"` |  |
| deployment.containers.main.env[6].value | string | `"production"` |  |
| deployment.containers.main.image.pullPolicy | string | `"IfNotPresent"` |  |
| deployment.containers.main.image.repository | string | `"ghostfolio/ghostfolio"` |  |
| deployment.containers.main.image.tag | string | `"2.167.0"` |  |
| deployment.containers.main.livenessProbe.failureThreshold | int | `3` |  |
| deployment.containers.main.livenessProbe.httpGet.path | string | `"/api/v1/health"` |  |
| deployment.containers.main.livenessProbe.httpGet.port | string | `"http"` |  |
| deployment.containers.main.livenessProbe.httpGet.scheme | string | `"HTTP"` |  |
| deployment.containers.main.livenessProbe.initialDelaySeconds | int | `30` |  |
| deployment.containers.main.livenessProbe.periodSeconds | int | `10` |  |
| deployment.containers.main.livenessProbe.successThreshold | int | `1` |  |
| deployment.containers.main.livenessProbe.timeoutSeconds | int | `5` |  |
| deployment.containers.main.ports.http.containerPort | int | `3333` |  |
| deployment.containers.main.ports.http.protocol | string | `"TCP"` |  |
| deployment.containers.main.readinessProbe.failureThreshold | int | `3` |  |
| deployment.containers.main.readinessProbe.httpGet.path | string | `"/api/v1/health"` |  |
| deployment.containers.main.readinessProbe.httpGet.port | string | `"http"` |  |
| deployment.containers.main.readinessProbe.httpGet.scheme | string | `"HTTP"` |  |
| deployment.containers.main.readinessProbe.initialDelaySeconds | int | `10` |  |
| deployment.containers.main.readinessProbe.periodSeconds | int | `5` |  |
| deployment.containers.main.readinessProbe.successThreshold | int | `1` |  |
| deployment.containers.main.readinessProbe.timeoutSeconds | int | `3` |  |
| deployment.containers.main.resources.limits.cpu | string | `"1000m"` |  |
| deployment.containers.main.resources.limits.memory | string | `"512Mi"` |  |
| deployment.containers.main.resources.requests.cpu | string | `"100m"` |  |
| deployment.containers.main.resources.requests.memory | string | `"256Mi"` |  |
| deployment.containers.main.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| deployment.containers.main.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| deployment.containers.main.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| deployment.enabled | bool | `true` |  |
| deployment.podSecurityContext.fsGroup | int | `1000` |  |
| deployment.podSecurityContext.runAsGroup | int | `1000` |  |
| deployment.podSecurityContext.runAsNonRoot | bool | `true` |  |
| deployment.podSecurityContext.runAsUser | int | `1000` |  |
| deployment.replicas | int | `1` |  |
| deployment.revisionHistoryLimit | int | `3` |  |
| deployment.strategyType | string | `"Recreate"` |  |
| ghostfolio.database.secretKey | string | `"DATABASE_URL"` |  |
| ghostfolio.database.secretName | string | `"ghostfolio-db-secret"` |  |
| ghostfolio.redis.host | string | `""` |  |
| ghostfolio.redis.passwordSecretKey | string | `"REDIS_PASSWORD"` |  |
| ghostfolio.redis.passwordSecretName | string | `"ghostfolio-redis-secret"` |  |
| ghostfolio.redis.port | int | `6379` |  |
| ghostfolio.secretName | string | `"ghostfolio-secrets"` |  |
| global.affinity | object | `{}` |  |
| global.imagePullSecrets | list | `[]` |  |
| global.nodeSelector | object | `{}` |  |
| global.tolerations | list | `[]` |  |
| ingresses.main.annotations | object | `{}` |  |
| ingresses.main.className | string | `""` |  |
| ingresses.main.enabled | bool | `false` |  |
| ingresses.main.hosts[0].host | string | `"ghostfolio.example.com"` |  |
| ingresses.main.hosts[0].paths[0].path | string | `"/"` |  |
| ingresses.main.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| ingresses.main.hosts[0].paths[0].port | string | `"http"` |  |
| ingresses.main.hosts[0].paths[0].service | string | `"main"` |  |
| ingresses.main.tls | list | `[]` |  |
| jobs.restore.containers.restore.command[0] | string | `"/bin/bash"` |  |
| jobs.restore.containers.restore.command[1] | string | `"-c"` |  |
| jobs.restore.containers.restore.command[2] | string | `"set -e\nRESTORE_FILE=\"/backup/{{ .Values.restore.restoreFile }}\"\nif [ ! -f \"$RESTORE_FILE\" ]; then\n  echo \"ERROR: Restore file not found: $RESTORE_FILE\"\n  exit 1\nfi\necho \"Starting restore from $RESTORE_FILE\"\necho \"Verifying backup file integrity...\"\npg_restore --list \"$RESTORE_FILE\" > /dev/null\necho \"Backup file verification successful\"\necho \"Restoring database...\"\npg_restore -v --clean --if-exists -d \"$DATABASE_URL\" \"$RESTORE_FILE\" || true\necho \"Restore process completed\"\n"` |  |
| jobs.restore.containers.restore.env[0].name | string | `"DATABASE_URL"` |  |
| jobs.restore.containers.restore.env[0].valueFrom.secretKeyRef.key | string | `"DATABASE_URL"` |  |
| jobs.restore.containers.restore.env[0].valueFrom.secretKeyRef.name | string | `"ghostfolio-db-secret"` |  |
| jobs.restore.containers.restore.image.pullPolicy | string | `"IfNotPresent"` |  |
| jobs.restore.containers.restore.image.repository | string | `"postgres"` |  |
| jobs.restore.containers.restore.image.tag | string | `"16"` |  |
| jobs.restore.containers.restore.resources.limits.cpu | string | `"500m"` |  |
| jobs.restore.containers.restore.resources.limits.memory | string | `"512Mi"` |  |
| jobs.restore.containers.restore.resources.requests.cpu | string | `"100m"` |  |
| jobs.restore.containers.restore.resources.requests.memory | string | `"128Mi"` |  |
| jobs.restore.containers.restore.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| jobs.restore.containers.restore.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| jobs.restore.containers.restore.securityContext.readOnlyRootFilesystem | bool | `false` |  |
| jobs.restore.containers.restore.volumeMounts[0].mountPath | string | `"/backup"` |  |
| jobs.restore.containers.restore.volumeMounts[0].name | string | `"backup"` |  |
| jobs.restore.containers.restore.volumeMounts[0].readOnly | bool | `true` |  |
| jobs.restore.enabled | bool | `false` |  |
| jobs.restore.podSecurityContext.fsGroup | int | `999` |  |
| jobs.restore.podSecurityContext.runAsGroup | int | `999` |  |
| jobs.restore.podSecurityContext.runAsNonRoot | bool | `true` |  |
| jobs.restore.podSecurityContext.runAsUser | int | `999` |  |
| jobs.restore.restartPolicy | string | `"OnFailure"` |  |
| jobs.restore.ttlSecondsAfterFinished | int | `86400` |  |
| jobs.restore.volumes[0].name | string | `"backup"` |  |
| jobs.restore.volumes[0].nfs.path | string | `""` |  |
| jobs.restore.volumes[0].nfs.server | string | `""` |  |
| restore.restoreFile | string | `""` |  |
| services.main.annotations | object | `{}` |  |
| services.main.enabled | bool | `true` |  |
| services.main.labels | object | `{}` |  |
| services.main.ports.http.port | int | `3333` |  |
| services.main.ports.http.protocol | string | `"TCP"` |  |
| services.main.type | string | `"ClusterIP"` |  |
| services.redis.annotations | object | `{}` |  |
| services.redis.enabled | bool | `true` |  |
| services.redis.labels | object | `{}` |  |
| services.redis.ports.redis.port | int | `6379` |  |
| services.redis.ports.redis.protocol | string | `"TCP"` |  |
| services.redis.type | string | `"ClusterIP"` |  |
| statefulsets.redis.containers.redis.command[0] | string | `"redis-server"` |  |
| statefulsets.redis.containers.redis.command[1] | string | `"--requirepass"` |  |
| statefulsets.redis.containers.redis.command[2] | string | `"$(REDIS_PASSWORD)"` |  |
| statefulsets.redis.containers.redis.command[3] | string | `"--appendonly"` |  |
| statefulsets.redis.containers.redis.command[4] | string | `"yes"` |  |
| statefulsets.redis.containers.redis.command[5] | string | `"--dir"` |  |
| statefulsets.redis.containers.redis.command[6] | string | `"/data"` |  |
| statefulsets.redis.containers.redis.env[0].name | string | `"REDIS_PASSWORD"` |  |
| statefulsets.redis.containers.redis.env[0].valueFrom.secretKeyRef.key | string | `"REDIS_PASSWORD"` |  |
| statefulsets.redis.containers.redis.env[0].valueFrom.secretKeyRef.name | string | `"ghostfolio-redis-secret"` |  |
| statefulsets.redis.containers.redis.image.pullPolicy | string | `"IfNotPresent"` |  |
| statefulsets.redis.containers.redis.image.repository | string | `"redis"` |  |
| statefulsets.redis.containers.redis.image.tag | string | `"7.4.2-alpine"` |  |
| statefulsets.redis.containers.redis.livenessProbe.exec.command[0] | string | `"sh"` |  |
| statefulsets.redis.containers.redis.livenessProbe.exec.command[1] | string | `"-c"` |  |
| statefulsets.redis.containers.redis.livenessProbe.exec.command[2] | string | `"redis-cli -a \"$REDIS_PASSWORD\" ping | grep PONG"` |  |
| statefulsets.redis.containers.redis.livenessProbe.failureThreshold | int | `3` |  |
| statefulsets.redis.containers.redis.livenessProbe.initialDelaySeconds | int | `30` |  |
| statefulsets.redis.containers.redis.livenessProbe.periodSeconds | int | `10` |  |
| statefulsets.redis.containers.redis.livenessProbe.timeoutSeconds | int | `5` |  |
| statefulsets.redis.containers.redis.ports.redis.containerPort | int | `6379` |  |
| statefulsets.redis.containers.redis.ports.redis.protocol | string | `"TCP"` |  |
| statefulsets.redis.containers.redis.readinessProbe.exec.command[0] | string | `"sh"` |  |
| statefulsets.redis.containers.redis.readinessProbe.exec.command[1] | string | `"-c"` |  |
| statefulsets.redis.containers.redis.readinessProbe.exec.command[2] | string | `"redis-cli -a \"$REDIS_PASSWORD\" ping | grep PONG"` |  |
| statefulsets.redis.containers.redis.readinessProbe.failureThreshold | int | `3` |  |
| statefulsets.redis.containers.redis.readinessProbe.initialDelaySeconds | int | `5` |  |
| statefulsets.redis.containers.redis.readinessProbe.periodSeconds | int | `5` |  |
| statefulsets.redis.containers.redis.readinessProbe.timeoutSeconds | int | `3` |  |
| statefulsets.redis.containers.redis.resources.limits.cpu | string | `"500m"` |  |
| statefulsets.redis.containers.redis.resources.limits.memory | string | `"256Mi"` |  |
| statefulsets.redis.containers.redis.resources.requests.cpu | string | `"10m"` |  |
| statefulsets.redis.containers.redis.resources.requests.memory | string | `"64Mi"` |  |
| statefulsets.redis.containers.redis.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| statefulsets.redis.containers.redis.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| statefulsets.redis.containers.redis.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| statefulsets.redis.containers.redis.volumeMounts[0].mountPath | string | `"/data"` |  |
| statefulsets.redis.containers.redis.volumeMounts[0].name | string | `"data"` |  |
| statefulsets.redis.containers.redis.volumeMounts[1].mountPath | string | `"/tmp"` |  |
| statefulsets.redis.containers.redis.volumeMounts[1].name | string | `"tmp"` |  |
| statefulsets.redis.enabled | bool | `true` |  |
| statefulsets.redis.podSecurityContext.fsGroup | int | `999` |  |
| statefulsets.redis.podSecurityContext.runAsGroup | int | `999` |  |
| statefulsets.redis.podSecurityContext.runAsNonRoot | bool | `true` |  |
| statefulsets.redis.podSecurityContext.runAsUser | int | `999` |  |
| statefulsets.redis.replicas | int | `1` |  |
| statefulsets.redis.revisionHistoryLimit | int | `3` |  |
| statefulsets.redis.volumeClaimTemplates[0].metadata.name | string | `"data"` |  |
| statefulsets.redis.volumeClaimTemplates[0].spec.accessModes[0] | string | `"ReadWriteOnce"` |  |
| statefulsets.redis.volumeClaimTemplates[0].spec.resources.requests.storage | string | `"1Gi"` |  |
| statefulsets.redis.volumes[0].emptyDir | object | `{}` |  |
| statefulsets.redis.volumes[0].name | string | `"tmp"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
