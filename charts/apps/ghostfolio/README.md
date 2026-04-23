# ghostfolio

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

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

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| backup.enabled | bool | `false` |  |
| backup.image.pullPolicy | string | `"IfNotPresent"` |  |
| backup.image.repository | string | `"postgres"` |  |
| backup.image.tag | string | `"16"` |  |
| backup.nfs.path | string | `""` |  |
| backup.nfs.server | string | `""` |  |
| backup.podSecurityContext.fsGroup | int | `999` |  |
| backup.podSecurityContext.runAsGroup | int | `999` |  |
| backup.podSecurityContext.runAsNonRoot | bool | `true` |  |
| backup.podSecurityContext.runAsUser | int | `999` |  |
| backup.resources.limits.cpu | string | `"500m"` |  |
| backup.resources.limits.memory | string | `"512Mi"` |  |
| backup.resources.requests.cpu | string | `"100m"` |  |
| backup.resources.requests.memory | string | `"128Mi"` |  |
| backup.retention | int | `7` |  |
| backup.schedule | string | `"0 2 * * *"` |  |
| backup.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| backup.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| backup.securityContext.readOnlyRootFilesystem | bool | `false` |  |
| ghostfolio.database.secretKey | string | `"DATABASE_URL"` |  |
| ghostfolio.database.secretName | string | `"ghostfolio-db-secret"` |  |
| ghostfolio.image.pullPolicy | string | `"IfNotPresent"` |  |
| ghostfolio.image.repository | string | `"ghostfolio/ghostfolio"` |  |
| ghostfolio.image.tag | string | `"2.167.0"` |  |
| ghostfolio.ingress.annotations | object | `{}` |  |
| ghostfolio.ingress.className | string | `""` |  |
| ghostfolio.ingress.enabled | bool | `false` |  |
| ghostfolio.ingress.hosts[0].host | string | `"ghostfolio.example.com"` |  |
| ghostfolio.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ghostfolio.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| ghostfolio.ingress.tls | list | `[]` |  |
| ghostfolio.livenessProbe.enabled | bool | `true` |  |
| ghostfolio.livenessProbe.failureThreshold | int | `3` |  |
| ghostfolio.livenessProbe.httpGet.path | string | `"/api/v1/health"` |  |
| ghostfolio.livenessProbe.httpGet.port | int | `3333` |  |
| ghostfolio.livenessProbe.initialDelaySeconds | int | `30` |  |
| ghostfolio.livenessProbe.periodSeconds | int | `10` |  |
| ghostfolio.livenessProbe.timeoutSeconds | int | `5` |  |
| ghostfolio.podSecurityContext.fsGroup | int | `1000` |  |
| ghostfolio.podSecurityContext.runAsGroup | int | `1000` |  |
| ghostfolio.podSecurityContext.runAsNonRoot | bool | `true` |  |
| ghostfolio.podSecurityContext.runAsUser | int | `1000` |  |
| ghostfolio.port | int | `3333` |  |
| ghostfolio.readinessProbe.enabled | bool | `true` |  |
| ghostfolio.readinessProbe.failureThreshold | int | `3` |  |
| ghostfolio.readinessProbe.httpGet.path | string | `"/api/v1/health"` |  |
| ghostfolio.readinessProbe.httpGet.port | int | `3333` |  |
| ghostfolio.readinessProbe.initialDelaySeconds | int | `10` |  |
| ghostfolio.readinessProbe.periodSeconds | int | `5` |  |
| ghostfolio.readinessProbe.timeoutSeconds | int | `3` |  |
| ghostfolio.redis.host | string | `""` |  |
| ghostfolio.redis.passwordSecretKey | string | `"REDIS_PASSWORD"` |  |
| ghostfolio.redis.passwordSecretName | string | `"ghostfolio-redis-secret"` |  |
| ghostfolio.redis.port | int | `6379` |  |
| ghostfolio.replicas | int | `1` |  |
| ghostfolio.resources.limits.cpu | string | `"1000m"` |  |
| ghostfolio.resources.limits.memory | string | `"512Mi"` |  |
| ghostfolio.resources.requests.cpu | string | `"100m"` |  |
| ghostfolio.resources.requests.memory | string | `"256Mi"` |  |
| ghostfolio.secretName | string | `"ghostfolio-secrets"` |  |
| ghostfolio.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| ghostfolio.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| ghostfolio.securityContext.readOnlyRootFilesystem | bool | `false` |  |
| ghostfolio.service.annotations | object | `{}` |  |
| ghostfolio.service.port | int | `3333` |  |
| ghostfolio.service.type | string | `"ClusterIP"` |  |
| global.affinity | object | `{}` |  |
| global.imagePullSecrets | list | `[]` |  |
| global.nodeSelector | object | `{}` |  |
| global.tolerations | list | `[]` |  |
| postgresql.cluster.backup.enabled | bool | `false` |  |
| postgresql.cluster.bootstrap.initdb.database | string | `"ghostfolio"` |  |
| postgresql.cluster.bootstrap.initdb.owner | string | `"ghostfolio"` |  |
| postgresql.cluster.bootstrap.initdb.secret.name | string | `"ghostfolio-db-app-secret"` |  |
| postgresql.cluster.imageName | string | `"ghcr.io/cloudnative-pg/postgresql:16.6"` |  |
| postgresql.cluster.instances | int | `1` |  |
| postgresql.cluster.monitoring.enabled | bool | `false` |  |
| postgresql.cluster.monitoring.podMonitorEnabled | bool | `false` |  |
| postgresql.cluster.resources.limits.cpu | string | `"2000m"` |  |
| postgresql.cluster.resources.limits.memory | string | `"1Gi"` |  |
| postgresql.cluster.resources.requests.cpu | string | `"100m"` |  |
| postgresql.cluster.resources.requests.memory | string | `"256Mi"` |  |
| postgresql.cluster.storage.size | string | `"10Gi"` |  |
| postgresql.cluster.storage.storageClass | string | `""` |  |
| postgresql.enabled | bool | `true` |  |
| redis.enabled | bool | `true` |  |
| redis.image.pullPolicy | string | `"IfNotPresent"` |  |
| redis.image.repository | string | `"redis"` |  |
| redis.image.tag | string | `"7.4.2-alpine"` |  |
| redis.persistence.accessMode | string | `"ReadWriteOnce"` |  |
| redis.persistence.enabled | bool | `true` |  |
| redis.persistence.size | string | `"1Gi"` |  |
| redis.persistence.storageClass | string | `""` |  |
| redis.podSecurityContext.fsGroup | int | `999` |  |
| redis.podSecurityContext.runAsGroup | int | `999` |  |
| redis.podSecurityContext.runAsNonRoot | bool | `true` |  |
| redis.podSecurityContext.runAsUser | int | `999` |  |
| redis.resources.limits.cpu | string | `"500m"` |  |
| redis.resources.limits.memory | string | `"256Mi"` |  |
| redis.resources.requests.cpu | string | `"10m"` |  |
| redis.resources.requests.memory | string | `"64Mi"` |  |
| redis.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| redis.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| redis.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| redis.service.port | int | `6379` |  |
| redis.service.type | string | `"ClusterIP"` |  |
| restore.enabled | bool | `false` |  |
| restore.image.pullPolicy | string | `"IfNotPresent"` |  |
| restore.image.repository | string | `"postgres"` |  |
| restore.image.tag | string | `"16"` |  |
| restore.nfs.path | string | `""` |  |
| restore.nfs.server | string | `""` |  |
| restore.podSecurityContext.fsGroup | int | `999` |  |
| restore.podSecurityContext.runAsGroup | int | `999` |  |
| restore.podSecurityContext.runAsNonRoot | bool | `true` |  |
| restore.podSecurityContext.runAsUser | int | `999` |  |
| restore.resources.limits.cpu | string | `"500m"` |  |
| restore.resources.limits.memory | string | `"512Mi"` |  |
| restore.resources.requests.cpu | string | `"100m"` |  |
| restore.resources.requests.memory | string | `"128Mi"` |  |
| restore.restoreFile | string | `""` |  |
| restore.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| restore.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| restore.securityContext.readOnlyRootFilesystem | bool | `false` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
