

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

<table height="400px" >
	<thead>
		<th>Key</th>
		<th>Type</th>
		<th>Default</th>
		<th>Description</th>
	</thead>
	<tbody>
		<tr>
			<td id="containers"><a href="./values.yaml#L23">containers</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="">
The chart will always construct the main container.
</pre>
</div>
			</td>
			<td>Containers configuration. Additional containers can be added under the 'containers' key.</td>
		</tr>
		<tr>
			<td id="containers--main--args"><a href="./values.yaml#L27">containers.main.args</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[]
</pre>
</div>
			</td>
			<td>Command-line arguments passed to the container entrypoint. Use this to override or extend the container's startup command</td>
		</tr>
		<tr>
			<td id="containers--main--env"><a href="./values.yaml#L31">containers.main.env</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{}
</pre>
</div>
			</td>
			<td>Environment variables injected into containers. Can reference ConfigMaps or Secrets via valueFrom</td>
		</tr>
		<tr>
			<td id="containers--main--image"><a href="./values.yaml#L35">containers.main.image</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "pullPolicy": "Always",
  "repository": "traefik/whoami",
  "tag": "latest"
}
</pre>
</div>
			</td>
			<td>Container image configuration including repository, tag, and pull policy</td>
		</tr>
		<tr>
			<td id="containers--main--imagePullSecrets"><a href="./values.yaml#L42">containers.main.imagePullSecrets</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[]
</pre>
</div>
			</td>
			<td>List of imagePullSecrets for private container registries. Reference pre-created Secrets in the same namespace</td>
		</tr>
		<tr>
			<td id="containers--main--probes--liveness"><a href="./values.yaml#L47">containers.main.probes.liveness</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
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
</div>
			</td>
			<td>Liveness probe configuration</td>
		</tr>
		<tr>
			<td id="containers--main--probes--readiness"><a href="./values.yaml#L61">containers.main.probes.readiness</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
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
</div>
			</td>
			<td>Readiness probe configuration</td>
		</tr>
		<tr>
			<td id="containers--main--probes--startup"><a href="./values.yaml#L75">containers.main.probes.startup</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
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
</div>
			</td>
			<td>Startup probe configuration</td>
		</tr>
		<tr>
			<td id="containers--main--resources"><a href="./values.yaml#L89">containers.main.resources</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
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
</div>
			</td>
			<td>CPU and memory resource allocation for the container</td>
		</tr>
		<tr>
			<td id="fullnameOverride"><a href="./values.yaml#L15">fullnameOverride</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
""
</pre>
</div>
			</td>
			<td>Fully override the chart name for Kubernetes resource names. Useful when deploying multiple instances with the same chart</td>
		</tr>
		<tr>
			<td id="ingress"><a href="./values.yaml#L124">ingress</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
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
      }
    ]
  }
}
</pre>
</div>
			</td>
			<td>Ingress configuration. Additional ingress resources can be added under the 'ingress' key.</td>
		</tr>
		<tr>
			<td id="nameOverride"><a href="./values.yaml#L12">nameOverride</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
""
</pre>
</div>
			</td>
			<td>Override the Helm-generated release name. Lower priority than fullnameOverride</td>
		</tr>
		<tr>
			<td id="namespaceOverride"><a href="./values.yaml#L18">namespaceOverride</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
""
</pre>
</div>
			</td>
			<td>Override the namespace where resources are deployed. Leave empty to use the release namespace</td>
		</tr>
		<tr>
			<td id="podSecurityContext"><a href="./values.yaml#L99">podSecurityContext</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
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
</div>
			</td>
			<td>Security context settings applied at the pod level for enhanced security</td>
		</tr>
		<tr>
			<td id="replicaCount"><a href="./values.yaml#L4">replicaCount</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
1
</pre>
</div>
			</td>
			<td>Number of desired pods (replicas) for the deployment. Modify to scale the application horizontally</td>
		</tr>
		<tr>
			<td id="revisionHistoryLimit"><a href="./values.yaml#L8">revisionHistoryLimit</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
3
</pre>
</div>
			</td>
			<td>Number of revisions to keep for rollback purposes. Set to 3 for balanced history management</td>
		</tr>
		<tr>
			<td id="serviceMonitor"><a href="./values.yaml#L144">serviceMonitor</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": true,
  "endpoints": [
    {
      "metricRelabelings": [
        {
          "action": "replace",
          "regex": "olstring_(.*)",
          "replacement": "newstring_$1",
          "sourceLabels": [
            "__name__"
          ],
          "targetLabel": "__name__"
        }
      ],
      "port": "main"
    }
  ],
  "labels": {
    "release": "prometheus"
  }
}
</pre>
</div>
			</td>
			<td>Monitoring configuration. Additional monitoring resources can be added under the 'serviceMonitor' key.</td>
		</tr>
		<tr>
			<td id="services"><a href="./values.yaml#L111">services</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
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
</div>
			</td>
			<td>Service configuration. Additional services can be added under the 'services' key.</td>
		</tr>
		<tr>
			<td id="strategyType"><a href="./values.yaml#L158">strategyType</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"Recreate"
</pre>
</div>
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
