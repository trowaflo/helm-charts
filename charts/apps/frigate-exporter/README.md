# frigate-exporter

![Version: 0.0.14](https://img.shields.io/badge/Version-0.0.14-informational?style=flat-square)

Chart for prometheus frigate exporter

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| trowaflo | <trowa.flo@gmail.com> |  |

## Source Code

* <https://github.com/bairhys/prometheus-frigate-exporter>
* <https://github.com/trowaflo/helm-charts/charts/frigate-exporter>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../library/common | common | 0.1.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | list | Empty list (no extra environment variables) | Environment variables passed to the exporter process for runtime configuration and integration setup Example usage: ```yaml env:   - name: FRIGATE_URL     value: http://frigate.monitoring.svc.cluster.local:5000   - name: FRIGATE_API_KEY     valueFrom:       secretKeyRef:         name: frigate-credentials         key: api-key ``` |
| image | object | `{"pullPolicy":"IfNotPresent","repository":"rhysbailey/prometheus-frigate-exporter","tag":"0.1.1@sha256:6df30ca30c5a69df4f3b21c06a93043a52baf523f808de56f4a40982393b8aff"}` | Container image configuration including repository, tag, and pull policy for Prometheus Frigate Exporter |
| image.pullPolicy | string | `"IfNotPresent"` | Kubelet image pull policy when accessing the registry (IfNotPresent pulls only if image not already on node, Always re-pulls on every container restart) |
| image.repository | string | `"rhysbailey/prometheus-frigate-exporter"` | OCI image registry URL containing the application container image (use container registries like quay.io, ghcr.io, or docker.io) |
| image.tag | string | `"0.1.1@sha256:6df30ca30c5a69df4f3b21c06a93043a52baf523f808de56f4a40982393b8aff"` | Image tag or digest identifier (supports semantic versioning or immutable @sha256: digests for reproducible deployments) |
| podSecurityContext | object | `{"runAsUser":1000}` | Pod-level security context enforcing least-privilege container execution and hardening the security posture |
| podSecurityContext.runAsUser | int | `1000` | Run exporter process as non-root user (UID 1000) to mitigate privilege escalation risks |
| probes | object | `{"enabled":true,"liveness":{"httpGet":{"path":"/metrics"}},"readiness":{"httpGet":{"path":"/metrics"}},"startup":{"httpGet":{"path":"/metrics"}}}` | Kubernetes liveness, readiness, and startup probe configurations for monitoring container health and automatic recovery |
| probes.enabled | bool | `true` | Enable all health checks (liveness, readiness, startup) globally. Disable to skip health monitoring entirely |
| probes.liveness | object | `{"httpGet":{"path":"/metrics"}}` | Liveness probe configuration detects containers in deadlock/unresponsive state and triggers restarts. Essential for production resilience |
| probes.liveness.httpGet | object | `{"path":"/metrics"}` | HTTP GET probe targeting the /metrics endpoint where the exporter exposes Prometheus metrics in text format |
| probes.liveness.httpGet.path | string | `"/metrics"` | Metrics endpoint path (standard Prometheus exporter convention) |
| probes.readiness | object | `{"httpGet":{"path":"/metrics"}}` | Readiness probe ensures the exporter is fully operational and ready to accept scrape requests from Prometheus |
| probes.readiness.httpGet | object | `{"path":"/metrics"}` | Verify metrics endpoint accessibility and exporter readiness status before receiving traffic |
| probes.startup | object | `{"httpGet":{"path":"/metrics"}}` | Startup probe grants additional initialization time during container launch, preventing premature liveness/readiness failures |
| probes.startup.httpGet | object | `{"path":"/metrics"}` | Check metrics endpoint availability during the startup phase with extended timeouts |
| resources | object | `{"limits":{"cpu":"100m","memory":"64Mi"},"requests":{"cpu":"1m","memory":"32Mi"}}` | CPU and memory resource constraints for the exporter container ensuring predictable cluster resource allocation |
| resources.limits | object | `{"cpu":"100m","memory":"64Mi"}` | Hard resource limits preventing container runaway and protecting cluster stability |
| resources.limits.cpu | string | `"100m"` | Maximum CPU allocation in millicores (100m = 0.1 core). Frigate exporter is lightweight |
| resources.limits.memory | string | `"64Mi"` | Maximum memory allocation preventing OOM kills on memory-constrained nodes |
| resources.requests | object | `{"cpu":"1m","memory":"32Mi"}` | Minimum guaranteed resources reserved on the worker node for the exporter pod |
| resources.requests.cpu | string | `"1m"` | Guaranteed minimum CPU allocation for predictable scheduling and cluster planning |
| resources.requests.memory | string | `"32Mi"` | Guaranteed minimum memory to ensure container has minimal memory footprint |
| serviceMonitor | object | `{"enabled":true,"endpoints":[{"port":"main"}]}` | Prometheus Operator ServiceMonitor custom resource for automated metrics scraping by Prometheus |
| serviceMonitor.enabled | bool | `true` | Enable ServiceMonitor resource creation for automatic Prometheus discovery and scraping. Requires prometheus-operator to be installed |
| serviceMonitor.endpoints | list | `[{"port":"main"}]` | Scrape endpoint configuration specifying which Service ports and metrics paths to monitor |
| serviceMonitor.endpoints[0] | object | `{"port":"main"}` | Endpoint targeting the 'main' service port for Prometheus metrics collection at /metrics |
| services | object | `{"main":{"annotations":{},"enabled":true,"labels":{},"ports":{"main":{"port":9100,"protocol":"TCP"}}}}` | Kubernetes Service resources exposing the exporter metrics endpoint for Prometheus scraping |
| services.main.annotations | object | `{}` | Metadata annotations for cloud provider integrations, load balancer configuration, or cert management |
| services.main.enabled | bool | `true` | Create the primary Service resource for metrics exposure |
| services.main.labels | object | `{}` | Custom labels for service discovery, organization, and filtering in dashboards |
| services.main.ports | object | `{"main":{"port":9100,"protocol":"TCP"}}` | Port definitions mapping container ports to external Service endpoints |
| services.main.ports.main.port | int | `9100` | Service port number (9100 is the standard port for Prometheus exporters following convention) |
| services.main.ports.main.protocol | string | `"TCP"` | Network protocol (TCP for Prometheus metrics, UDP for other protocols) |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
