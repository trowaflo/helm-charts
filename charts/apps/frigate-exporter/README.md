

# frigate-exporter

Prometheus exporter for Frigate NVR (Network Video Recorder) system.
Exports metrics from Frigate cameras, detections, and recording statistics
in Prometheus-compatible format for integration with monitoring stacks.

---

![Version: 0.0.14](https://img.shields.io/badge/Version-0.0.14-informational?style=flat-square)  ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) 

**Homepage:** <https://github.com/bairhys/prometheus-frigate-exporter>

## Source Code

* <https://github.com/bairhys/prometheus-frigate-exporter>
* <https://github.com/trowaflo/helm-charts>

## Requirements

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../library/common | common | 0.1.0 |

- Helm: v3+

## Getting Started

### Add repository

```bash
helm repo add frigate-exporter https://example.com/helm-charts
helm repo update
```

### Install

```bash
helm install my-frigate-exporter frigate-exporter/frigate-exporter \
  --namespace default \
  --create-namespace
```

### Upgrade

```bash
helm upgrade my-frigate-exporter frigate-exporter/frigate-exporter \
  --namespace default \
  --install
```

### Uninstall

```bash
helm uninstall my-frigate-exporter --namespace default
```

## Values

<table height="400px" >
	<thead>
		<th>Key</th>
		<th>Type</th>
		<th>Default</th>
		<th>Description</th>
	</thead>
	<tbody>
		<tr>
			<td id="containers--main--env"><a href="./values.yaml#L33">containers.main.env</a></td>
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
			<td></td>
		</tr>
		<tr>
			<td id="containers--main--image--pullPolicy"><a href="./values.yaml#L5">containers.main.image.pullPolicy</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"IfNotPresent"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers--main--image--repository"><a href="./values.yaml#L6">containers.main.image.repository</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"rhysbailey/prometheus-frigate-exporter"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers--main--image--tag"><a href="./values.yaml#L7">containers.main.image.tag</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"0.1.1@sha256:6df30ca30c5a69df4f3b21c06a93043a52baf523f808de56f4a40982393b8aff"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers--main--probes--enabled"><a href="./values.yaml#L10">containers.main.probes.enabled</a></td>
			<td>
bool
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
true
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers--main--probes--liveness--httpGet--path"><a href="./values.yaml#L14">containers.main.probes.liveness.httpGet.path</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/metrics"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers--main--probes--readiness--httpGet--path"><a href="./values.yaml#L18">containers.main.probes.readiness.httpGet.path</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/metrics"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers--main--probes--startup--httpGet--path"><a href="./values.yaml#L22">containers.main.probes.startup.httpGet.path</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/metrics"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers--main--resources--limits--cpu"><a href="./values.yaml#L26">containers.main.resources.limits.cpu</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"100m"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers--main--resources--limits--memory"><a href="./values.yaml#L27">containers.main.resources.limits.memory</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"64Mi"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers--main--resources--requests--cpu"><a href="./values.yaml#L30">containers.main.resources.requests.cpu</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"1m"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers--main--resources--requests--memory"><a href="./values.yaml#L31">containers.main.resources.requests.memory</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"32Mi"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="podSecurityContext--runAsUser"><a href="./values.yaml#L36">podSecurityContext.runAsUser</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
1000
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--enabled"><a href="./values.yaml#L49">serviceMonitor.enabled</a></td>
			<td>
bool
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
true
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--port"><a href="./values.yaml#L51">serviceMonitor.endpoints[0].port</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"main"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="services--main--annotations"><a href="./values.yaml#L41">services.main.annotations</a></td>
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
			<td></td>
		</tr>
		<tr>
			<td id="services--main--enabled"><a href="./values.yaml#L40">services.main.enabled</a></td>
			<td>
bool
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
true
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="services--main--labels"><a href="./values.yaml#L42">services.main.labels</a></td>
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
			<td></td>
		</tr>
		<tr>
			<td id="services--main--ports--main--port"><a href="./values.yaml#L46">services.main.ports.main.port</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
9100
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="services--main--ports--main--protocol"><a href="./values.yaml#L45">services.main.ports.main.protocol</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"TCP"
</pre>
</div>
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
