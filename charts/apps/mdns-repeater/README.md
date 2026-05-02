

# mdns-repeater

mDNS repeater that bridges Multicast DNS traffic between Kubernetes pod networks
and physical host networks. Enables mDNS-based service discovery (Bonjour,
Avahi) across network boundaries in a home lab or small office environment.

---

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square)  ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)  ![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

**Homepage:** <https://github.com/angelnu/mdns-repeater>

## Source Code

* <https://github.com/angelnu/mdns-repeater>
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
helm repo add mdns-repeater https://example.com/helm-charts
helm repo update
```

### Install

```bash
helm install my-mdns-repeater mdns-repeater/mdns-repeater \
  --namespace mdns-repeater \
  --create-namespace
```

### Upgrade

```bash
helm upgrade my-mdns-repeater mdns-repeater/mdns-repeater \
  --namespace mdns-repeater \
  --install
```

### Uninstall

```bash
helm uninstall my-mdns-repeater --namespace mdns-repeater
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
			<td>daemonsets.main.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>daemonsets.main.podSpec.containers.main.args[0]</td>
			<td>string</td>
			<td><pre lang="json">
"eth0"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>daemonsets.main.podSpec.containers.main.args[1]</td>
			<td>string</td>
			<td><pre lang="json">
"eth1"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>daemonsets.main.podSpec.containers.main.image.pullPolicy</td>
			<td>string</td>
			<td><pre lang="json">
"IfNotPresent"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>daemonsets.main.podSpec.containers.main.image.repository</td>
			<td>string</td>
			<td><pre lang="json">
"ghcr.io/angelnu/mdns-repeater"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>daemonsets.main.podSpec.containers.main.image.tag</td>
			<td>string</td>
			<td><pre lang="json">
"latest"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>daemonsets.main.podSpec.containers.main.resources.limits.cpu</td>
			<td>string</td>
			<td><pre lang="json">
"50m"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>daemonsets.main.podSpec.containers.main.resources.limits.memory</td>
			<td>string</td>
			<td><pre lang="json">
"32Mi"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>daemonsets.main.podSpec.containers.main.resources.requests.cpu</td>
			<td>string</td>
			<td><pre lang="json">
"1m"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>daemonsets.main.podSpec.containers.main.resources.requests.memory</td>
			<td>string</td>
			<td><pre lang="json">
"16Mi"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>daemonsets.main.podSpec.containers.main.securityContext.allowPrivilegeEscalation</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>daemonsets.main.podSpec.containers.main.securityContext.capabilities.add[0]</td>
			<td>string</td>
			<td><pre lang="json">
"NET_RAW"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>daemonsets.main.podSpec.containers.main.securityContext.capabilities.drop[0]</td>
			<td>string</td>
			<td><pre lang="json">
"ALL"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>daemonsets.main.podSpec.containers.main.securityContext.readOnlyRootFilesystem</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>daemonsets.main.podSpec.containers.main.securityContext.runAsNonRoot</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>daemonsets.main.podSpec.dnsPolicy</td>
			<td>string</td>
			<td><pre lang="json">
"ClusterFirstWithHostNet"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>daemonsets.main.podSpec.hostNetwork</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>daemonsets.main.podSpec.securityContext.fsGroupChangePolicy</td>
			<td>string</td>
			<td><pre lang="json">
"OnRootMismatch"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>daemonsets.main.podSpec.securityContext.runAsNonRoot</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>daemonsets.main.podSpec.securityContext.runAsUser</td>
			<td>int</td>
			<td><pre lang="json">
0
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>daemonsets.main.updateStrategy.type</td>
			<td>string</td>
			<td><pre lang="json">
"RollingUpdate"
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
