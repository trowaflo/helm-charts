

# graphite-exporter

Prometheus exporter for converting Graphite plaintext protocol metrics to Prometheus format.
Enables Prometheus to scrape metrics from legacy Graphite systems and sources
(e.g., TrueNAS, custom monitoring systems) that emit Graphite-formatted metrics.

---

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square)  ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) 

**Homepage:** <https://github.com/prometheus/graphite_exporter>

## Source Code

* <https://github.com/prometheus/graphite_exporter>
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
helm repo add graphite-exporter https://example.com/helm-charts
helm repo update
```

### Install

```bash
helm install my-graphite-exporter graphite-exporter/graphite-exporter \
  --namespace default \
  --create-namespace
```

### Upgrade

```bash
helm upgrade my-graphite-exporter graphite-exporter/graphite-exporter \
  --namespace default \
  --install
```

### Uninstall

```bash
helm uninstall my-graphite-exporter --namespace default
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
			<td id="containers--main--args[0]"><a href="./values.yaml#L23">containers.main.args[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"--graphite.listen-address=:9109"
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
"prom/graphite-exporter"
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
"v0.16.0@sha256:e54bca6645ea8a9e8c52312a8540de98ad08819d38476c021d77a0eae75bc797"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers--main--probes--liveness--httpGet--path"><a href="./values.yaml#L12">containers.main.probes.liveness.httpGet.path</a></td>
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
			<td id="containers--main--probes--readiness--httpGet--path"><a href="./values.yaml#L16">containers.main.probes.readiness.httpGet.path</a></td>
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
			<td id="containers--main--probes--startup--httpGet--path"><a href="./values.yaml#L20">containers.main.probes.startup.httpGet.path</a></td>
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
			<td id="ingress--main--enabled"><a href="./values.yaml#L50">ingress.main.enabled</a></td>
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
			<td id="ingress--main--hosts[0]--host"><a href="./values.yaml#L52">ingress.main.hosts[0].host</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"graphite-exporter.fqdn.example.com"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="ingress--main--hosts[0]--paths[0]--path"><a href="./values.yaml#L54">ingress.main.hosts[0].paths[0].path</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="ingress--main--hosts[0]--paths[0]--pathType"><a href="./values.yaml#L55">ingress.main.hosts[0].paths[0].pathType</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"Prefix"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--enabled"><a href="./values.yaml#L58">serviceMonitor.enabled</a></td>
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
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[0]--action"><a href="./values.yaml#L64">serviceMonitor.endpoints[0].metricRelabelings[0].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"keep"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[0]--regex"><a href="./values.yaml#L63">serviceMonitor.endpoints[0].metricRelabelings[0].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"^(scale_.*)"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[0]--sourceLabels[0]"><a href="./values.yaml#L62">serviceMonitor.endpoints[0].metricRelabelings[0].sourceLabels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__name__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[10]--action"><a href="./values.yaml#L124">serviceMonitor.endpoints[0].metricRelabelings[10].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"replace"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[10]--regex"><a href="./values.yaml#L121">serviceMonitor.endpoints[0].metricRelabelings[10].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"^(.*)_(cpu)_cpu([0-9]+)?"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[10]--replacement"><a href="./values.yaml#L123">serviceMonitor.endpoints[0].metricRelabelings[10].replacement</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"${1}_${2}${3}"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[10]--sourceLabels[0]"><a href="./values.yaml#L120">serviceMonitor.endpoints[0].metricRelabelings[10].sourceLabels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__name__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[10]--targetLabel"><a href="./values.yaml#L122">serviceMonitor.endpoints[0].metricRelabelings[10].targetLabel</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__name__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[11]--action"><a href="./values.yaml#L130">serviceMonitor.endpoints[0].metricRelabelings[11].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"replace"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[11]--regex"><a href="./values.yaml#L127">serviceMonitor.endpoints[0].metricRelabelings[11].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"^(.*)_(total)_total"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[11]--replacement"><a href="./values.yaml#L129">serviceMonitor.endpoints[0].metricRelabelings[11].replacement</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"${1}_${2}"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[11]--sourceLabels[0]"><a href="./values.yaml#L126">serviceMonitor.endpoints[0].metricRelabelings[11].sourceLabels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__name__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[11]--targetLabel"><a href="./values.yaml#L128">serviceMonitor.endpoints[0].metricRelabelings[11].targetLabel</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__name__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[12]--action"><a href="./values.yaml#L136">serviceMonitor.endpoints[0].metricRelabelings[12].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"replace"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[12]--regex"><a href="./values.yaml#L133">serviceMonitor.endpoints[0].metricRelabelings[12].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"^(.*)_(available)_available"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[12]--replacement"><a href="./values.yaml#L135">serviceMonitor.endpoints[0].metricRelabelings[12].replacement</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"${1}_${2}"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[12]--sourceLabels[0]"><a href="./values.yaml#L132">serviceMonitor.endpoints[0].metricRelabelings[12].sourceLabels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__name__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[12]--targetLabel"><a href="./values.yaml#L134">serviceMonitor.endpoints[0].metricRelabelings[12].targetLabel</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__name__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[13]--action"><a href="./values.yaml#L142">serviceMonitor.endpoints[0].metricRelabelings[13].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"replace"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[13]--regex"><a href="./values.yaml#L139">serviceMonitor.endpoints[0].metricRelabelings[13].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"^(.*)_(size)_size"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[13]--replacement"><a href="./values.yaml#L141">serviceMonitor.endpoints[0].metricRelabelings[13].replacement</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"${1}_${2}"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[13]--sourceLabels[0]"><a href="./values.yaml#L138">serviceMonitor.endpoints[0].metricRelabelings[13].sourceLabels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__name__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[13]--targetLabel"><a href="./values.yaml#L140">serviceMonitor.endpoints[0].metricRelabelings[13].targetLabel</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__name__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[14]--action"><a href="./values.yaml#L148">serviceMonitor.endpoints[0].metricRelabelings[14].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"replace"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[14]--regex"><a href="./values.yaml#L145">serviceMonitor.endpoints[0].metricRelabelings[14].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"^(.*)_(avail)_avail"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[14]--replacement"><a href="./values.yaml#L147">serviceMonitor.endpoints[0].metricRelabelings[14].replacement</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"${1}_${2}"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[14]--sourceLabels[0]"><a href="./values.yaml#L144">serviceMonitor.endpoints[0].metricRelabelings[14].sourceLabels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__name__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[14]--targetLabel"><a href="./values.yaml#L146">serviceMonitor.endpoints[0].metricRelabelings[14].targetLabel</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__name__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[15]--action"><a href="./values.yaml#L154">serviceMonitor.endpoints[0].metricRelabelings[15].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"replace"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[15]--regex"><a href="./values.yaml#L151">serviceMonitor.endpoints[0].metricRelabelings[15].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"^(.*)_(free)_free"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[15]--replacement"><a href="./values.yaml#L153">serviceMonitor.endpoints[0].metricRelabelings[15].replacement</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"${1}_${2}"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[15]--sourceLabels[0]"><a href="./values.yaml#L150">serviceMonitor.endpoints[0].metricRelabelings[15].sourceLabels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__name__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[15]--targetLabel"><a href="./values.yaml#L152">serviceMonitor.endpoints[0].metricRelabelings[15].targetLabel</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__name__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[16]--action"><a href="./values.yaml#L160">serviceMonitor.endpoints[0].metricRelabelings[16].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"replace"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[16]--regex"><a href="./values.yaml#L157">serviceMonitor.endpoints[0].metricRelabelings[16].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"^(.*)_(l2bytes)_l2bytes"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[16]--replacement"><a href="./values.yaml#L159">serviceMonitor.endpoints[0].metricRelabelings[16].replacement</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"${1}_${2}"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[16]--sourceLabels[0]"><a href="./values.yaml#L156">serviceMonitor.endpoints[0].metricRelabelings[16].sourceLabels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__name__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[16]--targetLabel"><a href="./values.yaml#L158">serviceMonitor.endpoints[0].metricRelabelings[16].targetLabel</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__name__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[17]--action"><a href="./values.yaml#L166">serviceMonitor.endpoints[0].metricRelabelings[17].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"replace"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[17]--regex"><a href="./values.yaml#L163">serviceMonitor.endpoints[0].metricRelabelings[17].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"^(.*)_(l2hits)_l2hits"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[17]--replacement"><a href="./values.yaml#L165">serviceMonitor.endpoints[0].metricRelabelings[17].replacement</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"${1}_${2}"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[17]--sourceLabels[0]"><a href="./values.yaml#L162">serviceMonitor.endpoints[0].metricRelabelings[17].sourceLabels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__name__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[17]--targetLabel"><a href="./values.yaml#L164">serviceMonitor.endpoints[0].metricRelabelings[17].targetLabel</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__name__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[18]--action"><a href="./values.yaml#L172">serviceMonitor.endpoints[0].metricRelabelings[18].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"replace"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[18]--regex"><a href="./values.yaml#L169">serviceMonitor.endpoints[0].metricRelabelings[18].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"^(.*)_(l2miss)_l2miss"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[18]--replacement"><a href="./values.yaml#L171">serviceMonitor.endpoints[0].metricRelabelings[18].replacement</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"${1}_${2}"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[18]--sourceLabels[0]"><a href="./values.yaml#L168">serviceMonitor.endpoints[0].metricRelabelings[18].sourceLabels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__name__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[18]--targetLabel"><a href="./values.yaml#L170">serviceMonitor.endpoints[0].metricRelabelings[18].targetLabel</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__name__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[19]--action"><a href="./values.yaml#L178">serviceMonitor.endpoints[0].metricRelabelings[19].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"replace"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[19]--regex"><a href="./values.yaml#L175">serviceMonitor.endpoints[0].metricRelabelings[19].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"^(.*)_(load)_load(1|5|15)"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[19]--replacement"><a href="./values.yaml#L177">serviceMonitor.endpoints[0].metricRelabelings[19].replacement</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"${1}_${2}${3}"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[19]--sourceLabels[0]"><a href="./values.yaml#L174">serviceMonitor.endpoints[0].metricRelabelings[19].sourceLabels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__name__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[19]--targetLabel"><a href="./values.yaml#L176">serviceMonitor.endpoints[0].metricRelabelings[19].targetLabel</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__name__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[1]--action"><a href="./values.yaml#L70">serviceMonitor.endpoints[0].metricRelabelings[1].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"replace"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[1]--regex"><a href="./values.yaml#L67">serviceMonitor.endpoints[0].metricRelabelings[1].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"^scale_([^_]+)_.*"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[1]--replacement"><a href="./values.yaml#L69">serviceMonitor.endpoints[0].metricRelabelings[1].replacement</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"${1}"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[1]--sourceLabels[0]"><a href="./values.yaml#L66">serviceMonitor.endpoints[0].metricRelabelings[1].sourceLabels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__name__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[1]--targetLabel"><a href="./values.yaml#L68">serviceMonitor.endpoints[0].metricRelabelings[1].targetLabel</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"hostname"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[20]--action"><a href="./values.yaml#L182">serviceMonitor.endpoints[0].metricRelabelings[20].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"keep"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[20]--regex"><a href="./values.yaml#L181">serviceMonitor.endpoints[0].metricRelabelings[20].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"truenas_(system_uptime.*|cpu_usage.*|cputemp.*|system_load.*|meminfo.*|arcstats.*|net_.*(speed|received|sent).*|disk_stats_busy__serial_lunid.*)"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[20]--sourceLabels[0]"><a href="./values.yaml#L180">serviceMonitor.endpoints[0].metricRelabelings[20].sourceLabels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__name__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[2]--action"><a href="./values.yaml#L76">serviceMonitor.endpoints[0].metricRelabelings[2].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"replace"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[2]--regex"><a href="./values.yaml#L73">serviceMonitor.endpoints[0].metricRelabelings[2].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"^scale_[^_]+_([^_]+)_.*"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[2]--replacement"><a href="./values.yaml#L75">serviceMonitor.endpoints[0].metricRelabelings[2].replacement</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"${1}"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[2]--sourceLabels[0]"><a href="./values.yaml#L72">serviceMonitor.endpoints[0].metricRelabelings[2].sourceLabels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__name__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[2]--targetLabel"><a href="./values.yaml#L74">serviceMonitor.endpoints[0].metricRelabelings[2].targetLabel</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"service"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[3]--action"><a href="./values.yaml#L82">serviceMonitor.endpoints[0].metricRelabelings[3].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"replace"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[3]--regex"><a href="./values.yaml#L79">serviceMonitor.endpoints[0].metricRelabelings[3].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"^.*_cpu_cpu([0-9]+)"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[3]--replacement"><a href="./values.yaml#L81">serviceMonitor.endpoints[0].metricRelabelings[3].replacement</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"cpu${1}"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[3]--sourceLabels[0]"><a href="./values.yaml#L78">serviceMonitor.endpoints[0].metricRelabelings[3].sourceLabels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__name__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[3]--targetLabel"><a href="./values.yaml#L80">serviceMonitor.endpoints[0].metricRelabelings[3].targetLabel</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"cpu"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[4]--action"><a href="./values.yaml#L88">serviceMonitor.endpoints[0].metricRelabelings[4].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"replace"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[4]--regex"><a href="./values.yaml#L85">serviceMonitor.endpoints[0].metricRelabelings[4].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"^.*_cputemp_temperatures_cpu([0-9]+)"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[4]--replacement"><a href="./values.yaml#L87">serviceMonitor.endpoints[0].metricRelabelings[4].replacement</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"cpu${1}"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[4]--sourceLabels[0]"><a href="./values.yaml#L84">serviceMonitor.endpoints[0].metricRelabelings[4].sourceLabels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__name__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[4]--targetLabel"><a href="./values.yaml#L86">serviceMonitor.endpoints[0].metricRelabelings[4].targetLabel</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"cpu"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[5]--action"><a href="./values.yaml#L94">serviceMonitor.endpoints[0].metricRelabelings[5].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"replace"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[5]--regex"><a href="./values.yaml#L91">serviceMonitor.endpoints[0].metricRelabelings[5].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"^.*_net_speed_([^_]+)_[^_\\n]+"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[5]--replacement"><a href="./values.yaml#L93">serviceMonitor.endpoints[0].metricRelabelings[5].replacement</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"${1}"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[5]--sourceLabels[0]"><a href="./values.yaml#L90">serviceMonitor.endpoints[0].metricRelabelings[5].sourceLabels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__name__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[5]--targetLabel"><a href="./values.yaml#L92">serviceMonitor.endpoints[0].metricRelabelings[5].targetLabel</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"interface"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[6]--action"><a href="./values.yaml#L100">serviceMonitor.endpoints[0].metricRelabelings[6].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"replace"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[6]--regex"><a href="./values.yaml#L97">serviceMonitor.endpoints[0].metricRelabelings[6].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"^(.*_net_speed).*"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[6]--replacement"><a href="./values.yaml#L99">serviceMonitor.endpoints[0].metricRelabelings[6].replacement</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"${1}"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[6]--sourceLabels[0]"><a href="./values.yaml#L96">serviceMonitor.endpoints[0].metricRelabelings[6].sourceLabels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__name__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[6]--targetLabel"><a href="./values.yaml#L98">serviceMonitor.endpoints[0].metricRelabelings[6].targetLabel</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__name__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[7]--action"><a href="./values.yaml#L106">serviceMonitor.endpoints[0].metricRelabelings[7].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"replace"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[7]--regex"><a href="./values.yaml#L103">serviceMonitor.endpoints[0].metricRelabelings[7].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"^(scale_truenas)_truenas_(.*)$"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[7]--replacement"><a href="./values.yaml#L105">serviceMonitor.endpoints[0].metricRelabelings[7].replacement</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"${1}_${2}"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[7]--sourceLabels[0]"><a href="./values.yaml#L102">serviceMonitor.endpoints[0].metricRelabelings[7].sourceLabels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__name__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[7]--targetLabel"><a href="./values.yaml#L104">serviceMonitor.endpoints[0].metricRelabelings[7].targetLabel</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__name__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[8]--action"><a href="./values.yaml#L112">serviceMonitor.endpoints[0].metricRelabelings[8].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"replace"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[8]--regex"><a href="./values.yaml#L109">serviceMonitor.endpoints[0].metricRelabelings[8].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"^scale_[^_]+_(.*)"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[8]--replacement"><a href="./values.yaml#L111">serviceMonitor.endpoints[0].metricRelabelings[8].replacement</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"truenas_${1}"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[8]--sourceLabels[0]"><a href="./values.yaml#L108">serviceMonitor.endpoints[0].metricRelabelings[8].sourceLabels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__name__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[8]--targetLabel"><a href="./values.yaml#L110">serviceMonitor.endpoints[0].metricRelabelings[8].targetLabel</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__name__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[9]--action"><a href="./values.yaml#L118">serviceMonitor.endpoints[0].metricRelabelings[9].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"replace"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[9]--regex"><a href="./values.yaml#L115">serviceMonitor.endpoints[0].metricRelabelings[9].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"^(.*)_(uptime)_uptime"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[9]--replacement"><a href="./values.yaml#L117">serviceMonitor.endpoints[0].metricRelabelings[9].replacement</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"${1}_${2}"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[9]--sourceLabels[0]"><a href="./values.yaml#L114">serviceMonitor.endpoints[0].metricRelabelings[9].sourceLabels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__name__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--metricRelabelings[9]--targetLabel"><a href="./values.yaml#L116">serviceMonitor.endpoints[0].metricRelabelings[9].targetLabel</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__name__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="serviceMonitor--endpoints[0]--port"><a href="./values.yaml#L60">serviceMonitor.endpoints[0].port</a></td>
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
			<td id="services--graphite--annotations"><a href="./values.yaml#L38">services.graphite.annotations</a></td>
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
			<td id="services--graphite--enabled"><a href="./values.yaml#L36">services.graphite.enabled</a></td>
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
			<td id="services--graphite--labels"><a href="./values.yaml#L39">services.graphite.labels</a></td>
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
			<td id="services--graphite--ports--graphite-tcp--port"><a href="./values.yaml#L46">services.graphite.ports.graphite-tcp.port</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
9109
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="services--graphite--ports--graphite-tcp--protocol"><a href="./values.yaml#L45">services.graphite.ports.graphite-tcp.protocol</a></td>
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
		<tr>
			<td id="services--graphite--ports--graphite-udp--port"><a href="./values.yaml#L43">services.graphite.ports.graphite-udp.port</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
9109
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="services--graphite--ports--graphite-udp--protocol"><a href="./values.yaml#L42">services.graphite.ports.graphite-udp.protocol</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"UDP"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="services--graphite--type"><a href="./values.yaml#L37">services.graphite.type</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"LoadBalancer"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="services--main--annotations"><a href="./values.yaml#L28">services.main.annotations</a></td>
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
			<td id="services--main--enabled"><a href="./values.yaml#L27">services.main.enabled</a></td>
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
			<td id="services--main--labels"><a href="./values.yaml#L29">services.main.labels</a></td>
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
			<td id="services--main--ports--main--port"><a href="./values.yaml#L33">services.main.ports.main.port</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
9108
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="services--main--ports--main--protocol"><a href="./values.yaml#L32">services.main.ports.main.protocol</a></td>
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
