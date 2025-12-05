# common

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: library](https://img.shields.io/badge/Type-library-informational?style=flat-square)

Common library chart providing reusable Helm templates and default configurations.
Standardizes Kubernetes resource deployment (Deployments, Services, Ingress, ServiceMonitor)
across the chart repository with consistent security, observability, and best practices.

Used by all application charts in this repository for consistency.

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| trowaflo | <trowa.flo@gmail.com> |  |

## Source Code

* <https://github.com/trowaflo/helm-charts>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| args | list | `[]` | Command-line arguments passed to the container entrypoint. Use this to override or extend the container's startup command |
| containers | list | `[{"name":"main-container"}]` | List of container specifications. Each entry defines a container to run in the pod |
| env | object | `{}` | Environment variables injected into containers. Can reference ConfigMaps or Secrets via valueFrom |
| fullnameOverride | string | `""` | Fully override the chart name for Kubernetes resource names. Useful when deploying multiple instances with the same chart |
| image | object | `{"pullPolicy":"Always","repository":"traefik/whoami","tag":"v1.10@sha256:1699d99cb4b9acc17f74ca670b3d8d0b7ba27c948b3445f0593b58ebece92f04"}` | Container image configuration including repository, tag, and pull policy |
| image.pullPolicy | string | `"Always"` | Image pull policy controlling when the kubelet should pull the image (Always, IfNotPresent, or Never) |
| image.repository | string | `"traefik/whoami"` | Container image repository URL. Should reference a registry accessible to your cluster |
| image.tag | string | `"v1.10@sha256:1699d99cb4b9acc17f74ca670b3d8d0b7ba27c948b3445f0593b58ebece92f04"` | Specific image tag or digest (using @sha256: notation for immutable deployments) |
| imagePullSecrets | list | `[]` | List of imagePullSecrets for private container registries. Reference pre-created Secrets in the same namespace |
| ingress | object | `{"main":{"enabled":false,"hosts":[{"host":"chart-example.local","paths":[{"path":"/","pathType":"Prefix"},{"path":"/testpath","pathType":"Prefix"}]},{"host":"another-chart-example.local","paths":[{"path":"/","pathType":"Prefix"},{"path":"/testpath","pathType":"Prefix"}]}]}}` | Kubernetes Ingress configuration for HTTP(S) routing and external access |
| ingress.main.enabled | bool | `false` | Enable Ingress resource creation for external traffic routing |
| ingress.main.hosts | list | `[{"host":"chart-example.local","paths":[{"path":"/","pathType":"Prefix"},{"path":"/testpath","pathType":"Prefix"}]},{"host":"another-chart-example.local","paths":[{"path":"/","pathType":"Prefix"},{"path":"/testpath","pathType":"Prefix"}]}]` | List of hostnames and paths for routing traffic to the Service |
| ingress.main.hosts[0].paths[0] | object | `{"path":"/","pathType":"Prefix"}` | Request path pattern (e.g., /app) matched by the ingress controller |
| ingress.main.hosts[0].paths[0].pathType | string | `"Prefix"` | Path matching type: Prefix (starts with), Exact (exact match), or ImplementationSpecific |
| nameOverride | string | `""` | Override the Helm-generated release name. Lower priority than fullnameOverride |
| namespaceOverride | string | `""` | Override the namespace where resources are deployed. Leave empty to use the release namespace |
| podSecurityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsNonRoot":true,"runAsUser":65534,"seccompProfile":{"type":"RuntimeDefault"}}` | Security context at the pod level, applied to all containers unless overridden. Enforces least-privilege principles |
| podSecurityContext.allowPrivilegeEscalation | bool | `false` | Prevent containers from gaining additional privileges through setuid/setgid binaries |
| podSecurityContext.capabilities | object | `{"drop":["ALL"]}` | Drop all Linux kernel capabilities, then selectively add only necessary ones |
| podSecurityContext.readOnlyRootFilesystem | bool | `true` | Mount the root filesystem as read-only for immutability and reduced attack surface |
| podSecurityContext.runAsNonRoot | bool | `true` | Require containers to run as non-root user for security hardening |
| podSecurityContext.runAsUser | int | `65534` | UID for the user running container processes (65534 is the 'nobody' user in most Linux images) |
| podSecurityContext.seccompProfile | object | `{"type":"RuntimeDefault"}` | Security profile preventing use of unconfined seccomp or AppArmor |
| podSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` | Restrict syscalls to the default seccomp filter (blocks dangerous operations) |
| probes | object | `{"enabled":true,"liveness":{"enabled":true,"failureThreshold":3,"httpGet":{"path":"/health","port":"main","scheme":"HTTP"},"initialDelaySeconds":30,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":5},"readiness":{"enabled":true,"failureThreshold":3,"httpGet":{"path":"/health","port":"main","scheme":"HTTP"},"initialDelaySeconds":30,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":5},"startup":{"enabled":true,"failureThreshold":3,"httpGet":{"path":"/health","port":"main","scheme":"HTTP"},"initialDelaySeconds":60,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":5}}` | Kubernetes probes configuration for liveness, readiness, and startup health checks |
| probes.enabled | bool | `true` | Enable or disable all probes globally |
| probes.liveness | object | `{"enabled":true,"failureThreshold":3,"httpGet":{"path":"/health","port":"main","scheme":"HTTP"},"initialDelaySeconds":30,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":5}` | Liveness probe detects and restarts containers that have deadlocked or are unresponsive. Critical for production stability |
| probes.liveness.enabled | bool | `true` | Enable the liveness probe |
| probes.liveness.failureThreshold | int | `3` | Number of consecutive failures before the container is restarted |
| probes.liveness.httpGet | object | `{"path":"/health","port":"main","scheme":"HTTP"}` | HTTP GET probe configuration pointing to a health check endpoint |
| probes.liveness.httpGet.path | string | `"/health"` | Request path for the health check endpoint |
| probes.liveness.httpGet.port | string | `"main"` | Container port name or number (must match a port in the container spec) |
| probes.liveness.httpGet.scheme | string | `"HTTP"` | HTTP scheme (HTTP or HTTPS) |
| probes.liveness.initialDelaySeconds | int | `30` | Delay in seconds before the first liveness probe is executed after container startup |
| probes.liveness.periodSeconds | int | `10` | Frequency in seconds at which the liveness probe is performed |
| probes.liveness.successThreshold | int | `1` | Number of consecutive successful probes to mark the container as healthy |
| probes.liveness.timeoutSeconds | int | `5` | Timeout in seconds for each probe request |
| probes.readiness | object | `{"enabled":true,"failureThreshold":3,"httpGet":{"path":"/health","port":"main","scheme":"HTTP"},"initialDelaySeconds":30,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":5}` | Readiness probe determines if the container is prepared to serve traffic. Used for load balancer targeting |
| probes.readiness.enabled | bool | `true` | Enable the readiness probe |
| probes.readiness.failureThreshold | int | `3` | Number of consecutive failures before the container is marked as not ready |
| probes.readiness.httpGet | object | `{"path":"/health","port":"main","scheme":"HTTP"}` | HTTP GET probe configuration for readiness check |
| probes.readiness.initialDelaySeconds | int | `30` | Delay in seconds before the first readiness probe is executed |
| probes.readiness.periodSeconds | int | `10` | Frequency in seconds at which the readiness probe is performed |
| probes.readiness.successThreshold | int | `1` | Number of consecutive successful probes to mark the container as ready |
| probes.readiness.timeoutSeconds | int | `5` | Timeout in seconds for the readiness probe request |
| probes.startup | object | `{"enabled":true,"failureThreshold":3,"httpGet":{"path":"/health","port":"main","scheme":"HTTP"},"initialDelaySeconds":60,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":5}` | Startup probe gives containers additional time to initialize on first launch, preventing false liveness failures |
| probes.startup.enabled | bool | `true` | Enable the startup probe |
| probes.startup.failureThreshold | int | `3` | Number of consecutive failures before the container startup fails |
| probes.startup.httpGet | object | `{"path":"/health","port":"main","scheme":"HTTP"}` | HTTP GET probe configuration for startup check |
| probes.startup.initialDelaySeconds | int | `60` | Delay in seconds before the first startup probe is executed |
| probes.startup.periodSeconds | int | `10` | Frequency in seconds at which the startup probe is performed |
| probes.startup.successThreshold | int | `1` | Number of consecutive successful probes to mark the container as started |
| probes.startup.timeoutSeconds | int | `5` | Timeout in seconds for the startup probe request |
| replicaCount | int | `1` | Number of desired pods (replicas) for the deployment. Modify to scale the application horizontally |
| resources | object | `{"limits":{"cpu":2,"memory":"2Gi"},"requests":{"cpu":"1m","memory":"32Mi"}}` | CPU and memory resource allocation for the container |
| resources.limits | object | `{"cpu":2,"memory":"2Gi"}` | Hard resource limits preventing the container from exceeding these thresholds |
| resources.limits.cpu | int | `2` | Maximum CPU allowed for the container (in millicores: 1000m = 1 CPU core) |
| resources.limits.memory | string | `"2Gi"` | Maximum memory allowed for the container (in binary units: Gi, Mi, Ki) |
| resources.requests | object | `{"cpu":"1m","memory":"32Mi"}` | Minimum resource guarantees reserved for the container on the node |
| resources.requests.cpu | string | `"1m"` | Guaranteed minimum CPU allocation (in millicores) |
| resources.requests.memory | string | `"32Mi"` | Guaranteed minimum memory allocation |
| revisionHistoryLimit | int | `3` | Number of revisions to keep for rollback purposes. Set to 3 for balanced history management |
| serviceMonitor | object | `{"enabled":true,"endpoints":[{"metricRelabelings":[],"port":"main"}],"labels":{"release":"prometheus"}}` | Prometheus Operator ServiceMonitor for metrics scraping and monitoring integration |
| serviceMonitor.enabled | bool | `true` | Enable automatic metrics discovery and scraping by Prometheus |
| serviceMonitor.endpoints | list | `[{"metricRelabelings":[],"port":"main"}]` | Scrape endpoints configuration specifying how Prometheus collects metrics |
| serviceMonitor.endpoints[0] | object | `{"metricRelabelings":[],"port":"main"}` | Endpoint details for metrics collection |
| serviceMonitor.endpoints[0].metricRelabelings | list | `[]` | optional scrape settings path: /metrics scheme: http interval: 30s scrapeTimeout: 10s |
| serviceMonitor.labels | object | `{"release":"prometheus"}` | Labels matching Prometheus instance selectors (e.g., release: prometheus tells Prometheus to scrape this) |
| services | object | `{"main":{"annotations":{},"enabled":true,"labels":{},"ports":{"main":{"port":80,"protocol":"TCP"}},"type":"ClusterIP"}}` | Kubernetes Service definitions exposing the application on the network |
| services.main.annotations | object | `{}` | Annotations for cloud provider integration (e.g., load balancer configuration, cert provisioning) |
| services.main.enabled | bool | `true` | Create the default Service resource |
| services.main.labels | object | `{}` | Additional labels applied to the Service for selection and organization |
| services.main.ports | object | `{"main":{"port":80,"protocol":"TCP"}}` | Port definitions mapping container ports to Service endpoints |
| services.main.ports.main.port | int | `80` | Port number exposed by the Service to clients |
| services.main.ports.main.protocol | string | `"TCP"` | Protocol used by the Service port (TCP, UDP) |
| services.main.type | string | `"ClusterIP"` | Service type determining how traffic is routed (ClusterIP, NodePort, LoadBalancer) |
| strategyType | string | `"Recreate"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
