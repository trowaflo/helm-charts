

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
{}
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
{}
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
{}
</pre>
</td>
			<td>Deployments configuration. Define one or more deployments under the 'deployments' key. Each deployment must specify its own containers, replicas, and pod-level settings.</td>
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
{}
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
			<td>Service configuration. Additional services can be added under the 'k8sServices' key.</td>
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
{}
</pre>
</td>
			<td>StatefulSets configuration. Define one or more stateful workloads under the 'statefulsets' key.</td>
		</tr>
	</tbody>
</table>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| trowaflo | <trowa.flo@gmail.com> |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
