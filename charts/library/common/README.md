

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
			<td>args</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>Command-line arguments passed to the container entrypoint. Use this to override or extend the container's startup command</td>
		</tr>
		<tr>
			<td>containers</td>
			<td>list</td>
			<td><pre lang="json">
[
  {
    "name": "main-container"
  }
]
</pre>
</td>
			<td>List of container specifications. Each entry defines a container to run in the pod</td>
		</tr>
		<tr>
			<td>env</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>Environment variables injected into containers. Can reference ConfigMaps or Secrets via valueFrom</td>
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
			<td>image</td>
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
			<td>image.pullPolicy</td>
			<td>string</td>
			<td><pre lang="json">
"Always"
</pre>
</td>
			<td>Image pull policy controlling when the kubelet should pull the image (Always, IfNotPresent, or Never)</td>
		</tr>
		<tr>
			<td>image.repository</td>
			<td>string</td>
			<td><pre lang="json">
"traefik/whoami"
</pre>
</td>
			<td>Container image repository URL. Should reference a registry accessible to your cluster</td>
		</tr>
		<tr>
			<td>image.tag</td>
			<td>string</td>
			<td><pre lang="json">
"v1.10@sha256:1699d99cb4b9acc17f74ca670b3d8d0b7ba27c948b3445f0593b58ebece92f04"
</pre>
</td>
			<td>Specific image tag or digest (using @sha256: notation for immutable deployments)</td>
		</tr>
		<tr>
			<td>imagePullSecrets</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>List of imagePullSecrets for private container registries. Reference pre-created Secrets in the same namespace</td>
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
			<td>Kubernetes Ingress configuration for HTTP(S) routing and external access @schema type: object format: yaml</td>
		</tr>
		<tr>
			<td>ingress.main.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td>Enable Ingress resource creation for external traffic routing</td>
		</tr>
		<tr>
			<td>ingress.main.hosts</td>
			<td>list</td>
			<td><pre lang="json">
[
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
</pre>
</td>
			<td>List of hostnames and paths for routing traffic to the Service</td>
		</tr>
		<tr>
			<td>ingress.main.hosts[0].paths[0]</td>
			<td>object</td>
			<td><pre lang="json">
{
  "path": "/",
  "pathType": "Prefix"
}
</pre>
</td>
			<td>Request path pattern (e.g., /app) matched by the ingress controller</td>
		</tr>
		<tr>
			<td>ingress.main.hosts[0].paths[0].pathType</td>
			<td>string</td>
			<td><pre lang="json">
"Prefix"
</pre>
</td>
			<td>Path matching type: Prefix (starts with), Exact (exact match), or ImplementationSpecific</td>
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
  "capabilities": {
    "drop": [
      "ALL"
    ]
  },
  "readOnlyRootFilesystem": true,
  "runAsNonRoot": true,
  "runAsUser": 65534,
  "seccompProfile": {
    "type": "RuntimeDefault"
  }
}
</pre>
</td>
			<td>Security context at the pod level, applied to all containers unless overridden. Enforces least-privilege principles</td>
		</tr>
		<tr>
			<td>podSecurityContext.allowPrivilegeEscalation</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td>Prevent containers from gaining additional privileges through setuid/setgid binaries</td>
		</tr>
		<tr>
			<td>podSecurityContext.capabilities</td>
			<td>object</td>
			<td><pre lang="json">
{
  "drop": [
    "ALL"
  ]
}
</pre>
</td>
			<td>Drop all Linux kernel capabilities, then selectively add only necessary ones</td>
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
			<td>UID for the user running container processes (65534 is the 'nobody' user in most Linux images)</td>
		</tr>
		<tr>
			<td>podSecurityContext.seccompProfile</td>
			<td>object</td>
			<td><pre lang="json">
{
  "type": "RuntimeDefault"
}
</pre>
</td>
			<td>Security profile preventing use of unconfined seccomp or AppArmor</td>
		</tr>
		<tr>
			<td>podSecurityContext.seccompProfile.type</td>
			<td>string</td>
			<td><pre lang="json">
"RuntimeDefault"
</pre>
</td>
			<td>Restrict syscalls to the default seccomp filter (blocks dangerous operations)</td>
		</tr>
		<tr>
			<td>probes</td>
			<td>object</td>
			<td><pre lang="json">
{
  "enabled": true,
  "liveness": {
    "enabled": true,
    "failureThreshold": 3,
    "httpGet": {
      "path": "/health",
      "port": "main",
      "scheme": "HTTP"
    },
    "initialDelaySeconds": 30,
    "periodSeconds": 10,
    "successThreshold": 1,
    "timeoutSeconds": 5
  },
  "readiness": {
    "enabled": true,
    "failureThreshold": 3,
    "httpGet": {
      "path": "/health",
      "port": "main",
      "scheme": "HTTP"
    },
    "initialDelaySeconds": 30,
    "periodSeconds": 10,
    "successThreshold": 1,
    "timeoutSeconds": 5
  },
  "startup": {
    "enabled": true,
    "failureThreshold": 3,
    "httpGet": {
      "path": "/health",
      "port": "main",
      "scheme": "HTTP"
    },
    "initialDelaySeconds": 60,
    "periodSeconds": 10,
    "successThreshold": 1,
    "timeoutSeconds": 5
  }
}
</pre>
</td>
			<td>Kubernetes probes configuration for liveness, readiness, and startup health checks</td>
		</tr>
		<tr>
			<td>probes.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Enable or disable all probes globally</td>
		</tr>
		<tr>
			<td>probes.liveness</td>
			<td>object</td>
			<td><pre lang="json">
{
  "enabled": true,
  "failureThreshold": 3,
  "httpGet": {
    "path": "/health",
    "port": "main",
    "scheme": "HTTP"
  },
  "initialDelaySeconds": 30,
  "periodSeconds": 10,
  "successThreshold": 1,
  "timeoutSeconds": 5
}
</pre>
</td>
			<td>Liveness probe detects and restarts containers that have deadlocked or are unresponsive. Critical for production stability</td>
		</tr>
		<tr>
			<td>probes.liveness.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Enable the liveness probe</td>
		</tr>
		<tr>
			<td>probes.liveness.failureThreshold</td>
			<td>int</td>
			<td><pre lang="json">
3
</pre>
</td>
			<td>Number of consecutive failures before the container is restarted</td>
		</tr>
		<tr>
			<td>probes.liveness.httpGet</td>
			<td>object</td>
			<td><pre lang="json">
{
  "path": "/health",
  "port": "main",
  "scheme": "HTTP"
}
</pre>
</td>
			<td>HTTP GET probe configuration pointing to a health check endpoint</td>
		</tr>
		<tr>
			<td>probes.liveness.httpGet.path</td>
			<td>string</td>
			<td><pre lang="json">
"/health"
</pre>
</td>
			<td>Request path for the health check endpoint</td>
		</tr>
		<tr>
			<td>probes.liveness.httpGet.port</td>
			<td>string</td>
			<td><pre lang="json">
"main"
</pre>
</td>
			<td>Container port name or number (must match a port in the container spec)</td>
		</tr>
		<tr>
			<td>probes.liveness.httpGet.scheme</td>
			<td>string</td>
			<td><pre lang="json">
"HTTP"
</pre>
</td>
			<td>HTTP scheme (HTTP or HTTPS)</td>
		</tr>
		<tr>
			<td>probes.liveness.initialDelaySeconds</td>
			<td>int</td>
			<td><pre lang="json">
30
</pre>
</td>
			<td>Delay in seconds before the first liveness probe is executed after container startup</td>
		</tr>
		<tr>
			<td>probes.liveness.periodSeconds</td>
			<td>int</td>
			<td><pre lang="json">
10
</pre>
</td>
			<td>Frequency in seconds at which the liveness probe is performed</td>
		</tr>
		<tr>
			<td>probes.liveness.successThreshold</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td>Number of consecutive successful probes to mark the container as healthy</td>
		</tr>
		<tr>
			<td>probes.liveness.timeoutSeconds</td>
			<td>int</td>
			<td><pre lang="json">
5
</pre>
</td>
			<td>Timeout in seconds for each probe request</td>
		</tr>
		<tr>
			<td>probes.readiness</td>
			<td>object</td>
			<td><pre lang="json">
{
  "enabled": true,
  "failureThreshold": 3,
  "httpGet": {
    "path": "/health",
    "port": "main",
    "scheme": "HTTP"
  },
  "initialDelaySeconds": 30,
  "periodSeconds": 10,
  "successThreshold": 1,
  "timeoutSeconds": 5
}
</pre>
</td>
			<td>Readiness probe determines if the container is prepared to serve traffic. Used for load balancer targeting</td>
		</tr>
		<tr>
			<td>probes.readiness.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Enable the readiness probe</td>
		</tr>
		<tr>
			<td>probes.readiness.failureThreshold</td>
			<td>int</td>
			<td><pre lang="json">
3
</pre>
</td>
			<td>Number of consecutive failures before the container is marked as not ready</td>
		</tr>
		<tr>
			<td>probes.readiness.httpGet</td>
			<td>object</td>
			<td><pre lang="json">
{
  "path": "/health",
  "port": "main",
  "scheme": "HTTP"
}
</pre>
</td>
			<td>HTTP GET probe configuration for readiness check</td>
		</tr>
		<tr>
			<td>probes.readiness.initialDelaySeconds</td>
			<td>int</td>
			<td><pre lang="json">
30
</pre>
</td>
			<td>Delay in seconds before the first readiness probe is executed</td>
		</tr>
		<tr>
			<td>probes.readiness.periodSeconds</td>
			<td>int</td>
			<td><pre lang="json">
10
</pre>
</td>
			<td>Frequency in seconds at which the readiness probe is performed</td>
		</tr>
		<tr>
			<td>probes.readiness.successThreshold</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td>Number of consecutive successful probes to mark the container as ready</td>
		</tr>
		<tr>
			<td>probes.readiness.timeoutSeconds</td>
			<td>int</td>
			<td><pre lang="json">
5
</pre>
</td>
			<td>Timeout in seconds for the readiness probe request</td>
		</tr>
		<tr>
			<td>probes.startup</td>
			<td>object</td>
			<td><pre lang="json">
{
  "enabled": true,
  "failureThreshold": 3,
  "httpGet": {
    "path": "/health",
    "port": "main",
    "scheme": "HTTP"
  },
  "initialDelaySeconds": 60,
  "periodSeconds": 10,
  "successThreshold": 1,
  "timeoutSeconds": 5
}
</pre>
</td>
			<td>Startup probe gives containers additional time to initialize on first launch, preventing false liveness failures</td>
		</tr>
		<tr>
			<td>probes.startup.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Enable the startup probe</td>
		</tr>
		<tr>
			<td>probes.startup.failureThreshold</td>
			<td>int</td>
			<td><pre lang="json">
3
</pre>
</td>
			<td>Number of consecutive failures before the container startup fails</td>
		</tr>
		<tr>
			<td>probes.startup.httpGet</td>
			<td>object</td>
			<td><pre lang="json">
{
  "path": "/health",
  "port": "main",
  "scheme": "HTTP"
}
</pre>
</td>
			<td>HTTP GET probe configuration for startup check</td>
		</tr>
		<tr>
			<td>probes.startup.initialDelaySeconds</td>
			<td>int</td>
			<td><pre lang="json">
60
</pre>
</td>
			<td>Delay in seconds before the first startup probe is executed</td>
		</tr>
		<tr>
			<td>probes.startup.periodSeconds</td>
			<td>int</td>
			<td><pre lang="json">
10
</pre>
</td>
			<td>Frequency in seconds at which the startup probe is performed</td>
		</tr>
		<tr>
			<td>probes.startup.successThreshold</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td>Number of consecutive successful probes to mark the container as started</td>
		</tr>
		<tr>
			<td>probes.startup.timeoutSeconds</td>
			<td>int</td>
			<td><pre lang="json">
5
</pre>
</td>
			<td>Timeout in seconds for the startup probe request</td>
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
			<td>resources</td>
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
			<td>resources.limits</td>
			<td>object</td>
			<td><pre lang="json">
{
  "cpu": 2,
  "memory": "2Gi"
}
</pre>
</td>
			<td>Hard resource limits preventing the container from exceeding these thresholds</td>
		</tr>
		<tr>
			<td>resources.limits.cpu</td>
			<td>int</td>
			<td><pre lang="json">
2
</pre>
</td>
			<td>Maximum CPU allowed for the container (in millicores: 1000m = 1 CPU core)</td>
		</tr>
		<tr>
			<td>resources.limits.memory</td>
			<td>string</td>
			<td><pre lang="json">
"2Gi"
</pre>
</td>
			<td>Maximum memory allowed for the container (in binary units: Gi, Mi, Ki)</td>
		</tr>
		<tr>
			<td>resources.requests</td>
			<td>object</td>
			<td><pre lang="json">
{
  "cpu": "1m",
  "memory": "32Mi"
}
</pre>
</td>
			<td>Minimum resource guarantees reserved for the container on the node</td>
		</tr>
		<tr>
			<td>resources.requests.cpu</td>
			<td>string</td>
			<td><pre lang="json">
"1m"
</pre>
</td>
			<td>Guaranteed minimum CPU allocation (in millicores)</td>
		</tr>
		<tr>
			<td>resources.requests.memory</td>
			<td>string</td>
			<td><pre lang="json">
"32Mi"
</pre>
</td>
			<td>Guaranteed minimum memory allocation</td>
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
			<td>Prometheus Operator ServiceMonitor for metrics scraping and monitoring integration</td>
		</tr>
		<tr>
			<td>serviceMonitor.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Enable automatic metrics discovery and scraping by Prometheus</td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints</td>
			<td>list</td>
			<td><pre lang="json">
[
  {
    "metricRelabelings": [],
    "port": "main"
  }
]
</pre>
</td>
			<td>Scrape endpoints configuration specifying how Prometheus collects metrics</td>
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
			<td>Endpoint details for metrics collection</td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>optional scrape settings path: /metrics scheme: http interval: 30s scrapeTimeout: 10s</td>
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
			<td>Labels matching Prometheus instance selectors (e.g., release: prometheus tells Prometheus to scrape this)</td>
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
			<td>Kubernetes Service definitions exposing the application on the network</td>
		</tr>
		<tr>
			<td>services.main.annotations</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>Annotations for cloud provider integration (e.g., load balancer configuration, cert provisioning)</td>
		</tr>
		<tr>
			<td>services.main.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Create the default Service resource</td>
		</tr>
		<tr>
			<td>services.main.labels</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>Additional labels applied to the Service for selection and organization</td>
		</tr>
		<tr>
			<td>services.main.ports</td>
			<td>object</td>
			<td><pre lang="json">
{
  "main": {
    "port": 80,
    "protocol": "TCP"
  }
}
</pre>
</td>
			<td>Port definitions mapping container ports to Service endpoints</td>
		</tr>
		<tr>
			<td>services.main.ports.main.port</td>
			<td>int</td>
			<td><pre lang="json">
80
</pre>
</td>
			<td>Port number exposed by the Service to clients</td>
		</tr>
		<tr>
			<td>services.main.ports.main.protocol</td>
			<td>string</td>
			<td><pre lang="json">
"TCP"
</pre>
</td>
			<td>Protocol used by the Service port (TCP, UDP)</td>
		</tr>
		<tr>
			<td>services.main.type</td>
			<td>string</td>
			<td><pre lang="json">
"ClusterIP"
</pre>
</td>
			<td>Service type determining how traffic is routed (ClusterIP, NodePort, LoadBalancer)</td>
		</tr>
		<tr>
			<td>strategyType</td>
			<td>string</td>
			<td><pre lang="json">
"Recreate"
</pre>
</td>
			<td></td>
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
