

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

## Values

<h3>Containers configuration</h3>
<table>
	<thead>
		<th>Key</th>
		<th>Type</th>
		<th>Default</th>
		<th>Description</th>
	</thead>
	<tbody>
		<tr>
			<td>containers</td>
			<td>object</td>
			<td><pre lang="">
the chart will always construnct the main container. Additional containers can be added under the 'containers' key.
</pre>
</td>
			<td>Containers configuration</td>
		</tr>
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
			<td>containers.main.probes.liveness</td>
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
			<td>Liveness probe configuration</td>
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
			<td>containers.main.probes.readiness</td>
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
			<td>Readiness probe configuration</td>
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
			<td>containers.main.probes.startup</td>
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
			<td>Startup probe configuration</td>
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
	</tbody>
</table>

<h3>Other Values</h3>
<table>
	<thead>
		<th>Key</th>
		<th>Type</th>
		<th>Default</th>
		<th>Description</th>
	</thead>
	<tbody>
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

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| trowaflo | <trowa.flo@gmail.com> |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
