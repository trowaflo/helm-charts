

# scrypted

Scrypted is a real-time home video integration and automation platform.
Bridges cameras and smart home devices across HomeKit, Google Home, Alexa,
and other ecosystems with low-latency streaming.

---

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square)  ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)  ![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

**Homepage:** <https://www.scrypted.app>

## Source Code

* <https://github.com/koush/scrypted>
* <https://github.com/trowaflo/helm-charts>

## Requirements

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../library/common | common | 3.0.0 |

- Helm: v3+

## Getting Started

### Add repository

```bash
helm repo add scrypted https://example.com/helm-charts
helm repo update
```

### Install

```bash
helm install my-scrypted scrypted/scrypted \
  --namespace scrypted \
  --create-namespace
```

### Upgrade

```bash
helm upgrade my-scrypted scrypted/scrypted \
  --namespace scrypted \
  --install
```

### Uninstall

```bash
helm uninstall my-scrypted --namespace scrypted
```

## Values

<table>
	<thead>
		<th>Key</th>
		<th>Type</th>
		<th>Default</th>
		<th>Description</th>
	</thead>
	<tbody>
		<tr>
			<td>ingresses.main.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingresses.main.hosts[0].host</td>
			<td>string</td>
			<td><pre lang="json">
"scrypted.example.com"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingresses.main.hosts[0].paths[0].path</td>
			<td>string</td>
			<td><pre lang="json">
"/"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingresses.main.hosts[0].paths[0].pathType</td>
			<td>string</td>
			<td><pre lang="json">
"Prefix"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>k8sServices.main.annotations</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>k8sServices.main.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>k8sServices.main.labels</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>k8sServices.main.ports.http.port</td>
			<td>int</td>
			<td><pre lang="json">
11080
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>k8sServices.main.ports.http.protocol</td>
			<td>string</td>
			<td><pre lang="json">
"TCP"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>k8sServices.main.ports.https.port</td>
			<td>int</td>
			<td><pre lang="json">
10443
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>k8sServices.main.ports.https.protocol</td>
			<td>string</td>
			<td><pre lang="json">
"TCP"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>k8sServices.main.ports.main</td>
			<td>string</td>
			<td><pre lang="json">
null
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>k8sServices.main.type</td>
			<td>string</td>
			<td><pre lang="json">
"ClusterIP"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>statefulsets.main.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>statefulsets.main.podSpec.containers.main.image.pullPolicy</td>
			<td>string</td>
			<td><pre lang="json">
"IfNotPresent"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>statefulsets.main.podSpec.containers.main.image.repository</td>
			<td>string</td>
			<td><pre lang="json">
"ghcr.io/koush/scrypted"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>statefulsets.main.podSpec.containers.main.image.tag</td>
			<td>string</td>
			<td><pre lang="json">
"latest"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>statefulsets.main.podSpec.containers.main.livenessProbe.failureThreshold</td>
			<td>int</td>
			<td><pre lang="json">
5
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>statefulsets.main.podSpec.containers.main.livenessProbe.httpGet.path</td>
			<td>string</td>
			<td><pre lang="json">
"/"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>statefulsets.main.podSpec.containers.main.livenessProbe.httpGet.port</td>
			<td>int</td>
			<td><pre lang="json">
11080
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>statefulsets.main.podSpec.containers.main.livenessProbe.initialDelaySeconds</td>
			<td>int</td>
			<td><pre lang="json">
30
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>statefulsets.main.podSpec.containers.main.livenessProbe.periodSeconds</td>
			<td>int</td>
			<td><pre lang="json">
30
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>statefulsets.main.podSpec.containers.main.ports.http.containerPort</td>
			<td>int</td>
			<td><pre lang="json">
11080
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>statefulsets.main.podSpec.containers.main.ports.https.containerPort</td>
			<td>int</td>
			<td><pre lang="json">
10443
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>statefulsets.main.podSpec.containers.main.readinessProbe.httpGet.path</td>
			<td>string</td>
			<td><pre lang="json">
"/"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>statefulsets.main.podSpec.containers.main.readinessProbe.httpGet.port</td>
			<td>int</td>
			<td><pre lang="json">
11080
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>statefulsets.main.podSpec.containers.main.readinessProbe.initialDelaySeconds</td>
			<td>int</td>
			<td><pre lang="json">
15
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>statefulsets.main.podSpec.containers.main.readinessProbe.periodSeconds</td>
			<td>int</td>
			<td><pre lang="json">
10
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>statefulsets.main.podSpec.containers.main.resources.limits.cpu</td>
			<td>string</td>
			<td><pre lang="json">
"2000m"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>statefulsets.main.podSpec.containers.main.resources.limits.memory</td>
			<td>string</td>
			<td><pre lang="json">
"1Gi"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>statefulsets.main.podSpec.containers.main.resources.requests.cpu</td>
			<td>string</td>
			<td><pre lang="json">
"100m"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>statefulsets.main.podSpec.containers.main.resources.requests.memory</td>
			<td>string</td>
			<td><pre lang="json">
"256Mi"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>statefulsets.main.podSpec.containers.main.securityContext.allowPrivilegeEscalation</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>statefulsets.main.podSpec.containers.main.securityContext.capabilities.drop[0]</td>
			<td>string</td>
			<td><pre lang="json">
"ALL"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>statefulsets.main.podSpec.containers.main.securityContext.readOnlyRootFilesystem</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>statefulsets.main.podSpec.containers.main.securityContext.runAsNonRoot</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>statefulsets.main.podSpec.containers.main.volumeMounts[0].mountPath</td>
			<td>string</td>
			<td><pre lang="json">
"/server/volume"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>statefulsets.main.podSpec.containers.main.volumeMounts[0].name</td>
			<td>string</td>
			<td><pre lang="json">
"config"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>statefulsets.main.podSpec.securityContext.fsGroup</td>
			<td>int</td>
			<td><pre lang="json">
0
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>statefulsets.main.podSpec.securityContext.fsGroupChangePolicy</td>
			<td>string</td>
			<td><pre lang="json">
"OnRootMismatch"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>statefulsets.main.podSpec.securityContext.runAsNonRoot</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>statefulsets.main.podSpec.securityContext.runAsUser</td>
			<td>int</td>
			<td><pre lang="json">
0
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>statefulsets.main.volumeClaimTemplates[0].metadata.name</td>
			<td>string</td>
			<td><pre lang="json">
"config"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>statefulsets.main.volumeClaimTemplates[0].spec.accessModes[0]</td>
			<td>string</td>
			<td><pre lang="json">
"ReadWriteOnce"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>statefulsets.main.volumeClaimTemplates[0].spec.resources.requests.storage</td>
			<td>string</td>
			<td><pre lang="json">
"10Gi"
</pre>
</td>
			<td></td>
		</tr>
	</tbody>
</table>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| trowaflo | <trowa.flo@gmail.com> |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
