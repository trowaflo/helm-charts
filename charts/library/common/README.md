

# common

Common library chart providing reusable Helm templates and default configurations.
Standardizes Kubernetes resource deployment (Deployments, Services, Ingress, ServiceMonitor)
across the chart repository with consistent security, observability, and best practices.

Used by all application charts in this repository for consistency.

---

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square)  ![Type: library](https://img.shields.io/badge/Type-library-informational?style=flat-square) 

**Homepage:** <https://github.com/trowaflo/helm-charts>

## Source Code

* <https://github.com/trowaflo/helm-charts>

## Requirements

- Helm: v3+

## Getting Started

### Add repository

```bash
helm repo add common https://example.com/helm-charts
helm repo update
```

### Install

```bash
helm install my-common common/common \
  --namespace default \
  --create-namespace
```

### Upgrade

```bash
helm upgrade my-common common/common \
  --namespace default \
  --install
```

### Uninstall

```bash
helm uninstall my-common --namespace default
```

<table>
	<thead>
		<th>Key</th>
		<th>Type</th>
		<th>Default</th>
		<th>Description</th>
	</thead>
	<tbody>
		<tr>
			<td>containers.main.args</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>Command-line arguments passed to the container entrypoint. Use this to override or extend the container's startup command</td>
		</tr>
		<tr>
			<td>containers.main.env</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>Environment variables injected into containers. Can reference ConfigMaps or Secrets via valueFrom</td>
		</tr>
		<tr>
			<td>containers.main.image</td>
			<td>object</td>
			<td><pre lang="json">
{
  "pullPolicy": "Always",
  "repository": "traefik/whoami",
  "tag": "v1.10@sha256:1699d99cb4b9acc17f74ca670b3d8d0b7ba27c948b3445f0593b58ebece92f04"
}
</pre>
</td>
			<td>Container image configuration including repository, tag, and pull policy</td>
		</tr>
		<tr>
			<td>containers.main.image.pullPolicy</td>
			<td>string</td>
			<td><pre lang="json">
"Always"
</pre>
</td>
			<td>Image pull policy controlling when the kubelet should pull the image (Always, IfNotPresent, or Never)</td>
		</tr>
		<tr>
			<td>containers.main.image.repository</td>
			<td>string</td>
			<td><pre lang="json">
"traefik/whoami"
</pre>
</td>
			<td>Container image repository URL. Should reference a registry accessible to your cluster</td>
		</tr>
		<tr>
			<td>containers.main.image.tag</td>
			<td>string</td>
			<td><pre lang="json">
"v1.10@sha256:1699d99cb4b9acc17f74ca670b3d8d0b7ba27c948b3445f0593b58ebece92f04"
</pre>
</td>
			<td>Specific image tag or digest (using @sha256: notation for immutable deployments)</td>
		</tr>
		<tr>
			<td>containers.main.imagePullSecrets</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>List of imagePullSecrets for private container registries. Reference pre-created Secrets in the same namespace</td>
		</tr>
		<tr>
			<td>containers.main.probes.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Global toggle to enable/disable all probes for the container</td>
		</tr>
		<tr>
			<td>containers.main.probes.liveness.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Enable the liveness probe to monitor container health and trigger restarts if unhealthy</td>
		</tr>
		<tr>
			<td>containers.main.probes.liveness.failureThreshold</td>
			<td>int</td>
			<td><pre lang="json">
3
</pre>
</td>
			<td>Number of consecutive failures before the container is restarted</td>
		</tr>
		<tr>
			<td>containers.main.probes.liveness.httpGet.path</td>
			<td>string</td>
			<td><pre lang="json">
"/health"
</pre>
</td>
			<td>HTTP GET probe configuration for liveness check</td>
		</tr>
		<tr>
			<td>containers.main.probes.liveness.httpGet.port</td>
			<td>string</td>
			<td><pre lang="json">
"main"
</pre>
</td>
			<td>Port number or name to access on the container for the liveness probe</td>
		</tr>
		<tr>
			<td>containers.main.probes.liveness.httpGet.scheme</td>
			<td>string</td>
			<td><pre lang="json">
"HTTP"
</pre>
</td>
			<td>HTTP scheme (HTTP or HTTPS) used for the liveness probe</td>
		</tr>
		<tr>
			<td>containers.main.probes.liveness.initialDelaySeconds</td>
			<td>int</td>
			<td><pre lang="json">
30
</pre>
</td>
			<td>Delay in seconds before the first liveness probe is executed after container startup</td>
		</tr>
		<tr>
			<td>containers.main.probes.liveness.periodSeconds</td>
			<td>int</td>
			<td><pre lang="json">
10
</pre>
</td>
			<td>Frequency in seconds at which the liveness probe is performed</td>
		</tr>
		<tr>
			<td>containers.main.probes.liveness.successThreshold</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td>Number of consecutive successful probes to mark the container as healthy</td>
		</tr>
		<tr>
			<td>containers.main.probes.liveness.timeoutSeconds</td>
			<td>int</td>
			<td><pre lang="json">
5
</pre>
</td>
			<td>Timeout in seconds for each probe request</td>
		</tr>
		<tr>
			<td>containers.main.probes.readiness.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Enable the readiness probe to signal when the container is ready to accept traffic</td>
		</tr>
		<tr>
			<td>containers.main.probes.readiness.failureThreshold</td>
			<td>int</td>
			<td><pre lang="json">
3
</pre>
</td>
			<td>Number of consecutive failures before the container is marked as not ready</td>
		</tr>
		<tr>
			<td>containers.main.probes.readiness.httpGet.path</td>
			<td>string</td>
			<td><pre lang="json">
"/health"
</pre>
</td>
			<td>HTTP GET probe configuration for readiness check</td>
		</tr>
		<tr>
			<td>containers.main.probes.readiness.httpGet.port</td>
			<td>string</td>
			<td><pre lang="json">
"main"
</pre>
</td>
			<td>Port number or name to access on the container for the readiness probe</td>
		</tr>
		<tr>
			<td>containers.main.probes.readiness.httpGet.scheme</td>
			<td>string</td>
			<td><pre lang="json">
"HTTP"
</pre>
</td>
			<td>HTTP scheme (HTTP or HTTPS) used for the readiness probe</td>
		</tr>
		<tr>
			<td>containers.main.probes.readiness.initialDelaySeconds</td>
			<td>int</td>
			<td><pre lang="json">
30
</pre>
</td>
			<td>Delay in seconds before the first readiness probe is executed after container startup</td>
		</tr>
		<tr>
			<td>containers.main.probes.readiness.periodSeconds</td>
			<td>int</td>
			<td><pre lang="json">
10
</pre>
</td>
			<td>Frequency in seconds at which the readiness probe is performed</td>
		</tr>
		<tr>
			<td>containers.main.probes.readiness.successThreshold</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td>Number of consecutive successful probes to mark the container as ready</td>
		</tr>
		<tr>
			<td>containers.main.probes.readiness.timeoutSeconds</td>
			<td>int</td>
			<td><pre lang="json">
5
</pre>
</td>
			<td>Timeout in seconds for each probe request</td>
		</tr>
		<tr>
			<td>containers.main.probes.startup.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Enable the startup probe to check if the application within the container has started successfully</td>
		</tr>
		<tr>
			<td>containers.main.probes.startup.failureThreshold</td>
			<td>int</td>
			<td><pre lang="json">
3
</pre>
</td>
			<td>Number of consecutive failures before the container is considered failed to start</td>
		</tr>
		<tr>
			<td>containers.main.probes.startup.httpGet.path</td>
			<td>string</td>
			<td><pre lang="json">
"/health"
</pre>
</td>
			<td>HTTP GET probe configuration for startup check</td>
		</tr>
		<tr>
			<td>containers.main.probes.startup.httpGet.port</td>
			<td>string</td>
			<td><pre lang="json">
"main"
</pre>
</td>
			<td>Port number or name to access on the container for the startup probe</td>
		</tr>
		<tr>
			<td>containers.main.probes.startup.httpGet.scheme</td>
			<td>string</td>
			<td><pre lang="json">
"HTTP"
</pre>
</td>
			<td>HTTP scheme (HTTP or HTTPS) used for the startup probe</td>
		</tr>
		<tr>
			<td>containers.main.probes.startup.initialDelaySeconds</td>
			<td>int</td>
			<td><pre lang="json">
60
</pre>
</td>
			<td>Delay in seconds before the first startup probe is executed after container startup</td>
		</tr>
		<tr>
			<td>containers.main.probes.startup.periodSeconds</td>
			<td>int</td>
			<td><pre lang="json">
10
</pre>
</td>
			<td>Frequency in seconds at which the startup probe is performed</td>
		</tr>
		<tr>
			<td>containers.main.probes.startup.successThreshold</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td>Number of consecutive successful probes to mark the container as started</td>
		</tr>
		<tr>
			<td>containers.main.probes.startup.timeoutSeconds</td>
			<td>int</td>
			<td><pre lang="json">
5
</pre>
</td>
			<td>Timeout in seconds for each probe request</td>
		</tr>
		<tr>
			<td>containers.main.resources</td>
			<td>object</td>
			<td><pre lang="json">
{
  "limits": {
    "cpu": 2,
    "memory": "2Gi"
  },
  "requests": {
    "cpu": "1m",
    "memory": "32Mi"
  }
}
</pre>
</td>
			<td>CPU and memory resource allocation for the container</td>
		</tr>
		<tr>
			<td>fullnameOverride</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Fully override the chart name for Kubernetes resource names. Useful when deploying multiple instances with the same chart</td>
		</tr>
		<tr>
			<td>ingress</td>
			<td>object</td>
			<td><pre lang="json">
{
  "main": {
    "enabled": false,
    "hosts": [
      {
        "host": "chart-example.local",
        "paths": [
          {
            "path": "/",
            "pathType": "Prefix"
          },
          {
            "path": "/testpath",
            "pathType": "Prefix"
          }
        ]
      },
      {
        "host": "another-chart-example.local",
        "paths": [
          {
            "path": "/",
            "pathType": "Prefix"
          },
          {
            "path": "/testpath",
            "pathType": "Prefix"
          }
        ]
      }
    ]
  }
}
</pre>
</td>
			<td>Kubernetes Ingress resource configuration for external access to the Service</td>
		</tr>
		<tr>
			<td>nameOverride</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Override the Helm-generated release name. Lower priority than fullnameOverride</td>
		</tr>
		<tr>
			<td>namespaceOverride</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Override the namespace where resources are deployed. Leave empty to use the release namespace</td>
		</tr>
		<tr>
			<td>podSecurityContext</td>
			<td>object</td>
			<td><pre lang="json">
{
  "allowPrivilegeEscalation": false,
  "capabilities": {},
  "readOnlyRootFilesystem": true,
  "runAsNonRoot": true,
  "runAsUser": 65534,
  "seccompProfile": {}
}
</pre>
</td>
			<td>Security context settings applied at the pod level for enhanced security</td>
		</tr>
		<tr>
			<td>podSecurityContext.allowPrivilegeEscalation</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td>Privilege escalation for all containers in the pod</td>
		</tr>
		<tr>
			<td>podSecurityContext.capabilities</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>Capabilities to add or drop for all containers in the pod</td>
		</tr>
		<tr>
			<td>podSecurityContext.readOnlyRootFilesystem</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Mount the root filesystem as read-only for immutability and reduced attack surface</td>
		</tr>
		<tr>
			<td>podSecurityContext.runAsNonRoot</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Require containers to run as non-root user for security hardening</td>
		</tr>
		<tr>
			<td>podSecurityContext.runAsUser</td>
			<td>int</td>
			<td><pre lang="json">
65534
</pre>
</td>
			<td>Default user ID for running containers in the pod</td>
		</tr>
		<tr>
			<td>podSecurityContext.seccompProfile</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>Security profile preventing use of unconfined seccomp or AppArmor</td>
		</tr>
		<tr>
			<td>replicaCount</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td>Number of desired pods (replicas) for the deployment. Modify to scale the application horizontally</td>
		</tr>
		<tr>
			<td>revisionHistoryLimit</td>
			<td>int</td>
			<td><pre lang="json">
3
</pre>
</td>
			<td>Number of revisions to keep for rollback purposes. Set to 3 for balanced history management</td>
		</tr>
		<tr>
			<td>serviceMonitor</td>
			<td>object</td>
			<td><pre lang="json">
{
  "enabled": true,
  "endpoints": [
    {
      "metricRelabelings": [],
      "port": "main"
    }
  ],
  "labels": {
    "release": "prometheus"
  }
}
</pre>
</td>
			<td>Prometheus ServiceMonitor configuration for metrics scraping</td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0]</td>
			<td>object</td>
			<td><pre lang="json">
{
  "metricRelabelings": [],
  "port": "main"
}
</pre>
</td>
			<td>List of endpoints to scrape metrics from</td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>Relabeling rules to modify metric labels before ingestion</td>
		</tr>
		<tr>
			<td>serviceMonitor.labels</td>
			<td>object</td>
			<td><pre lang="json">
{
  "release": "prometheus"
}
</pre>
</td>
			<td>Labels to add to the ServiceMonitor resource for identification and selection</td>
		</tr>
		<tr>
			<td>services</td>
			<td>object</td>
			<td><pre lang="json">
{
  "main": {
    "annotations": {},
    "enabled": true,
    "labels": {},
    "ports": {
      "main": {
        "port": 80,
        "protocol": "TCP"
      }
    },
    "type": "ClusterIP"
  }
}
</pre>
</td>
			<td>Kubernetes Service configuration for exposing the application</td>
		</tr>
		<tr>
			<td>strategyType</td>
			<td>string</td>
			<td><pre lang="json">
"Recreate"
</pre>
</td>
			<td>Deployment update strategy configuration</td>
		</tr>
	</tbody>
</table>

### Examples

- Enable Prometheus scraping via ServiceMonitor
- Configure resource requests/limits for predictable scheduling
- Override container image and tag for air-gapped environments

```yaml
# values.yaml snippet
serviceMonitor:
  enabled: true

resources:
  requests:
    cpu: 100m
    memory: 128Mi
  limits:
    cpu: 500m
    memory: 256Mi
```

## Security

- Follows namespace-scoped, least-privilege defaults
- Configure PodSecurityContext and SecurityContext as needed for your environment

## Troubleshooting

- Check pod logs and events: `kubectl logs -l app.kubernetes.io/name=common`
- Verify CRDs (if any) are installed
- Ensure network policies allow required traffic

## Maintainers

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| trowaflo | <trowa.flo@gmail.com> |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
