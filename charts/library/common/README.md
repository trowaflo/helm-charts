

# common

Common library chart providing reusable Helm templates and default configurations.
Standardizes Kubernetes resource deployment (Deployments, StatefulSets, CronJobs, Jobs,
Services, Ingress, ServiceMonitor, PersistentVolumes, PersistentVolumeClaims, CNPG Clusters)
across the chart repository with consistent security, observability, and best practices.

Used by all application charts in this repository for consistency.

---

![Version: 3.0.0](https://img.shields.io/badge/Version-3.0.0-informational?style=flat-square)  ![Type: library](https://img.shields.io/badge/Type-library-informational?style=flat-square) 

## Requirements

- Helm: v3+

## Values

<h3>CNPG Clusters configuration</h3>
<table>
	<thead>
		<th>Key</th>
		<th>Type</th>
		<th>Default</th>
		<th>Description</th>
	</thead>
	<tbody>
		<tr>
			<td>cnpgClusters</td>
			<td>object</td>
			<td><pre lang="json">
{
  "main": {
    "bootstrap": {
      "initdb": {
        "database": "app",
        "owner": "app"
      }
    },
    "enabled": false,
    "imageName": "",
    "instances": 1,
    "monitoring": {
      "enabled": false,
      "podMonitorEnabled": false
    },
    "storage": {
      "size": ""
    }
  }
}
</pre>
</td>
			<td>CloudNativePG Clusters configuration. Define one or more clusters under the 'cnpgClusters' key.</td>
		</tr>
	</tbody>
</table>
<h3>CronJobs configuration</h3>
<table>
	<thead>
		<th>Key</th>
		<th>Type</th>
		<th>Default</th>
		<th>Description</th>
	</thead>
	<tbody>
		<tr>
			<td>cronjobs</td>
			<td>object</td>
			<td><pre lang="json">
{
  "main": {
    "concurrencyPolicy": "Forbid",
    "enabled": false,
    "failedJobsHistoryLimit": 3,
    "schedule": "0 * * * *",
    "successfulJobsHistoryLimit": 3
  }
}
</pre>
</td>
			<td>CronJobs configuration. Define one or more scheduled jobs under the 'cronjobs' key.</td>
		</tr>
	</tbody>
</table>
<h3>Deployments configuration</h3>
<table>
	<thead>
		<th>Key</th>
		<th>Type</th>
		<th>Default</th>
		<th>Description</th>
	</thead>
	<tbody>
		<tr>
			<td>deployments</td>
			<td>object</td>
			<td><pre lang="json">
{
  "main": {
    "enabled": false,
    "replicas": 1,
    "revisionHistoryLimit": 3,
    "strategy": {
      "type": "RollingUpdate"
    }
  }
}
</pre>
</td>
			<td>Deployments configuration. Define one or more deployments under the 'deployments' key. Each deployment must specify its own containers, replicas, and pod-level settings. Per-container `env` accepts two shapes:   1. List form (legacy): `env: [{name, value|valueFrom}, ...]` emitted verbatim.   2. Map form: `env: {NAME: "value"}` or `env: {NAME: {secretKeyRef|configMapKeyRef|fieldRef: {...}}}`.      Map values and nested valueFrom fields pass through `tpl` with root context, so      templated references expand (e.g. `'{{ include "common.helpers.fullname" . }}-redis'`).      Nil values fail fast. Keys are emitted in sorted order.</td>
		</tr>
	</tbody>
</table>
<h3>Global settings</h3>
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
	</tbody>
</table>
<h3>Ingress configuration</h3>
<table>
	<thead>
		<th>Key</th>
		<th>Type</th>
		<th>Default</th>
		<th>Description</th>
	</thead>
	<tbody>
		<tr>
			<td>ingresses</td>
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
      }
    ]
  }
}
</pre>
</td>
			<td>Ingress configuration. Additional ingress resources can be added under the 'ingresses' key.</td>
		</tr>
	</tbody>
</table>
<h3>Jobs configuration</h3>
<table>
	<thead>
		<th>Key</th>
		<th>Type</th>
		<th>Default</th>
		<th>Description</th>
	</thead>
	<tbody>
		<tr>
			<td>jobs</td>
			<td>object</td>
			<td><pre lang="json">
{
  "main": {
    "enabled": false
  }
}
</pre>
</td>
			<td>Jobs configuration. Define one or more one-shot jobs under the 'jobs' key.</td>
		</tr>
	</tbody>
</table>
<h3>Services configuration</h3>
<table>
	<thead>
		<th>Key</th>
		<th>Type</th>
		<th>Default</th>
		<th>Description</th>
	</thead>
	<tbody>
		<tr>
			<td>k8sServices</td>
			<td>object</td>
			<td><pre lang="json">
{
  "main": {
    "annotations": {},
    "enabled": false,
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
			<td>Service configuration. Additional services can be added under the 'k8sServices' key.</td>
		</tr>
	</tbody>
</table>
<h3>Secrets configuration</h3>
<table>
	<thead>
		<th>Key</th>
		<th>Type</th>
		<th>Default</th>
		<th>Description</th>
	</thead>
	<tbody>
		<tr>
			<td>secrets</td>
			<td>object</td>
			<td><pre lang="json">
{
  "main": {
    "data": {
      "MY_SECRET_KEY": ""
    },
    "enabled": false,
    "existingSecret": "",
    "type": "Opaque"
  }
}
</pre>
</td>
			<td>Secrets configuration. Define secrets to auto-generate under the 'secrets' key. Each entry auto-creates a Secret with pre-install hook and resource-policy: keep. Set existingSecret to opt out and reference an external Secret instead. Empty data values generate a random 32-char alphanumeric string, preserved across upgrades via lookup. Non-empty data values are used as the initial seed (also preserved on upgrade).</td>
		</tr>
	</tbody>
</table>
<h3>Monitoring configuration</h3>
<table>
	<thead>
		<th>Key</th>
		<th>Type</th>
		<th>Default</th>
		<th>Description</th>
	</thead>
	<tbody>
		<tr>
			<td>serviceMonitors</td>
			<td>object</td>
			<td><pre lang="json">
{
  "main": {
    "enabled": false,
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
}
</pre>
</td>
			<td>Monitoring configuration. Additional monitoring resources can be added under the 'serviceMonitors' key.</td>
		</tr>
	</tbody>
</table>
<h3>StatefulSets configuration</h3>
<table>
	<thead>
		<th>Key</th>
		<th>Type</th>
		<th>Default</th>
		<th>Description</th>
	</thead>
	<tbody>
		<tr>
			<td>statefulsets</td>
			<td>object</td>
			<td><pre lang="json">
{
  "main": {
    "enabled": false,
    "replicas": 1,
    "revisionHistoryLimit": 3,
    "updateStrategy": {
      "type": "RollingUpdate"
    },
    "volumeClaimTemplates": []
  }
}
</pre>
</td>
			<td>StatefulSets configuration. Define one or more stateful workloads under the 'statefulsets' key.</td>
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
		<td>cnpgClusters.main.enabled</td>
		<td>bool</td>
		<td><pre lang="json">
false
</pre>
</td>
		<td>Enable or disable this CNPG Cluster</td>
	</tr>
	<tr>
		<td>cnpgClusters.main.imageName</td>
		<td>string</td>
		<td><pre lang="json">
""
</pre>
</td>
		<td>PostgreSQL image to use. Required when enabled. e.g. ghcr.io/cloudnative-pg/postgresql:16</td>
	</tr>
	<tr>
		<td>cnpgClusters.main.storage.size</td>
		<td>string</td>
		<td><pre lang="json">
""
</pre>
</td>
		<td>Storage size for the cluster. Required when enabled. e.g. 10Gi</td>
	</tr>
	<tr>
		<td>cronjobs.main.enabled</td>
		<td>bool</td>
		<td><pre lang="json">
false
</pre>
</td>
		<td>Enable or disable this CronJob</td>
	</tr>
	<tr>
		<td>cronjobs.main.schedule</td>
		<td>string</td>
		<td><pre lang="json">
"0 * * * *"
</pre>
</td>
		<td>Cron schedule expression</td>
	</tr>
	<tr>
		<td>deployments.main.enabled</td>
		<td>bool</td>
		<td><pre lang="json">
false
</pre>
</td>
		<td>Enable or disable this deployment</td>
	</tr>
	<tr>
		<td>deployments.main.strategy</td>
		<td>object</td>
		<td><pre lang="json">
{
  "type": "RollingUpdate"
}
</pre>
</td>
		<td>Deployment strategy. Defaults to RollingUpdate; set type: Recreate for stateful apps</td>
	</tr>
	<tr>
		<td>jobs.main.enabled</td>
		<td>bool</td>
		<td><pre lang="json">
false
</pre>
</td>
		<td>Enable or disable this Job</td>
	</tr>
	<tr>
		<td>secrets.main.data</td>
		<td>object</td>
		<td><pre lang="json">
{
  "MY_SECRET_KEY": ""
}
</pre>
</td>
		<td>Data keys to generate. Empty string → random 32-char value, preserved across upgrades. Non-empty string → used as initial seed (also preserved via lookup on upgrade).</td>
	</tr>
	<tr>
		<td>secrets.main.enabled</td>
		<td>bool</td>
		<td><pre lang="json">
false
</pre>
</td>
		<td>Enable or disable this secret</td>
	</tr>
	<tr>
		<td>secrets.main.existingSecret</td>
		<td>string</td>
		<td><pre lang="json">
""
</pre>
</td>
		<td>If set, skip generation and use this existing Secret instead</td>
	</tr>
	<tr>
		<td>secrets.main.type</td>
		<td>string</td>
		<td><pre lang="json">
"Opaque"
</pre>
</td>
		<td>Secret type. Defaults to Opaque. Use kubernetes.io/basic-auth for username/password pairs</td>
	</tr>
	<tr>
		<td>statefulsets.main.enabled</td>
		<td>bool</td>
		<td><pre lang="json">
false
</pre>
</td>
		<td>Enable or disable this StatefulSet</td>
	</tr>
	<tr>
		<td>statefulsets.main.updateStrategy</td>
		<td>object</td>
		<td><pre lang="json">
{
  "type": "RollingUpdate"
}
</pre>
</td>
		<td>StatefulSet update strategy. Defaults to RollingUpdate</td>
	</tr>
	<tr>
		<td>statefulsets.main.volumeClaimTemplates</td>
		<td>list</td>
		<td><pre lang="json">
[]
</pre>
</td>
		<td>VolumeClaimTemplates for persistent storage. Each entry requires metadata.name and spec.resources.requests.storage</td>
	</tr>
	</tbody>
</table>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| trowaflo | <trowa.flo@gmail.com> |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
