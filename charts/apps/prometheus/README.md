

# prometheus

Wraps the official kube-prometheus-stack Helm chart providing production-ready monitoring
stack including Prometheus, Grafana, Alertmanager, and node exporters.

---

![Version: 2.4.5](https://img.shields.io/badge/Version-2.4.5-informational?style=flat-square)  ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) 

**Homepage:** <https://prometheus.io>

## Source Code

* <https://github.com/prometheus/prometheus>
* <https://github.com/prometheus-operator/prometheus-operator>
* <https://github.com/trowaflo/helm-charts>

## Requirements

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://prometheus-community.github.io/helm-charts | prometheus | 27.8.0 |

- Helm: v3+

## Getting Started

### Add repository

```bash
helm repo add prometheus https://example.com/helm-charts
helm repo update
```

### Install

```bash
helm install my-prometheus prometheus/prometheus \
  --namespace default \
  --create-namespace
```

### Upgrade

```bash
helm upgrade my-prometheus prometheus/prometheus \
  --namespace default \
  --install
```

### Uninstall

```bash
helm uninstall my-prometheus --namespace default
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
			<td id="prometheus--alertmanager--enabled"><a href="./values.yaml#L35">prometheus.alertmanager.enabled</a></td>
			<td>
bool
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
false
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--kube-state-metrics--enabled"><a href="./values.yaml#L38">prometheus.kube-state-metrics.enabled</a></td>
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
			<td id="prometheus--networkPolicy--enabled"><a href="./values.yaml#L31">prometheus.networkPolicy.enabled</a></td>
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
			<td id="prometheus--prometheus-node-exporter--containerSecurityContext--allowPrivilegeEscalation"><a href="./values.yaml#L47">prometheus.prometheus-node-exporter.containerSecurityContext.allowPrivilegeEscalation</a></td>
			<td>
bool
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
false
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--prometheus-node-exporter--enabled"><a href="./values.yaml#L41">prometheus.prometheus-node-exporter.enabled</a></td>
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
			<td id="prometheus--prometheus-node-exporter--rbac--pspEnabled"><a href="./values.yaml#L44">prometheus.prometheus-node-exporter.rbac.pspEnabled</a></td>
			<td>
bool
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
false
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--prometheus-pushgateway--enabled"><a href="./values.yaml#L50">prometheus.prometheus-pushgateway.enabled</a></td>
			<td>
bool
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
false
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[0]--job_name"><a href="./values.yaml#L53">prometheus.scrape_configs[0].job_name</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"prometheus"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[0]--static_configs[0]--targets[0]"><a href="./values.yaml#L56">prometheus.scrape_configs[0].static_configs[0].targets[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"localhost:9090"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[1]--bearer_token_file"><a href="./values.yaml#L69">prometheus.scrape_configs[1].bearer_token_file</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/var/run/secrets/kubernetes.io/serviceaccount/token"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[1]--job_name"><a href="./values.yaml#L59">prometheus.scrape_configs[1].job_name</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"kubernetes-apiservers"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[1]--kubernetes_sd_configs[0]--role"><a href="./values.yaml#L62">prometheus.scrape_configs[1].kubernetes_sd_configs[0].role</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"endpoints"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[1]--relabel_configs[0]--action"><a href="./values.yaml#L73">prometheus.scrape_configs[1].relabel_configs[0].action</a></td>
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
			<td id="prometheus--scrape_configs[1]--relabel_configs[0]--regex"><a href="./values.yaml#L74">prometheus.scrape_configs[1].relabel_configs[0].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"default;kubernetes;https"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[1]--relabel_configs[0]--source_labels[0]"><a href="./values.yaml#L72">prometheus.scrape_configs[1].relabel_configs[0].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_namespace"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[1]--relabel_configs[0]--source_labels[1]"><a href="./values.yaml#L72">prometheus.scrape_configs[1].relabel_configs[0].source_labels[1]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_service_name"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[1]--relabel_configs[0]--source_labels[2]"><a href="./values.yaml#L72">prometheus.scrape_configs[1].relabel_configs[0].source_labels[2]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_endpoint_port_name"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[1]--scheme"><a href="./values.yaml#L64">prometheus.scrape_configs[1].scheme</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"https"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[1]--tls_config--ca_file"><a href="./values.yaml#L67">prometheus.scrape_configs[1].tls_config.ca_file</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/var/run/secrets/kubernetes.io/serviceaccount/ca.crt"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[1]--tls_config--insecure_skip_verify"><a href="./values.yaml#L68">prometheus.scrape_configs[1].tls_config.insecure_skip_verify</a></td>
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
			<td id="prometheus--scrape_configs[2]--bearer_token_file"><a href="./values.yaml#L83">prometheus.scrape_configs[2].bearer_token_file</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/var/run/secrets/kubernetes.io/serviceaccount/token"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[2]--job_name"><a href="./values.yaml#L76">prometheus.scrape_configs[2].job_name</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"kubernetes-nodes"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[2]--kubernetes_sd_configs[0]--role"><a href="./values.yaml#L86">prometheus.scrape_configs[2].kubernetes_sd_configs[0].role</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"node"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[2]--relabel_configs[0]--action"><a href="./values.yaml#L89">prometheus.scrape_configs[2].relabel_configs[0].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"labelmap"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[2]--relabel_configs[0]--regex"><a href="./values.yaml#L90">prometheus.scrape_configs[2].relabel_configs[0].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_node_label_(.+)"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[2]--relabel_configs[1]--replacement"><a href="./values.yaml#L92">prometheus.scrape_configs[2].relabel_configs[1].replacement</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"kubernetes.default.svc:443"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[2]--relabel_configs[1]--target_label"><a href="./values.yaml#L91">prometheus.scrape_configs[2].relabel_configs[1].target_label</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__address__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[2]--relabel_configs[2]--regex"><a href="./values.yaml#L94">prometheus.scrape_configs[2].relabel_configs[2].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"(.+)"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[2]--relabel_configs[2]--replacement"><a href="./values.yaml#L96">prometheus.scrape_configs[2].relabel_configs[2].replacement</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/api/v1/nodes/$1/proxy/metrics"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[2]--relabel_configs[2]--source_labels[0]"><a href="./values.yaml#L93">prometheus.scrape_configs[2].relabel_configs[2].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_node_name"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[2]--relabel_configs[2]--target_label"><a href="./values.yaml#L95">prometheus.scrape_configs[2].relabel_configs[2].target_label</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__metrics_path__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[2]--scheme"><a href="./values.yaml#L78">prometheus.scrape_configs[2].scheme</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"https"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[2]--tls_config--ca_file"><a href="./values.yaml#L81">prometheus.scrape_configs[2].tls_config.ca_file</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/var/run/secrets/kubernetes.io/serviceaccount/ca.crt"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[2]--tls_config--insecure_skip_verify"><a href="./values.yaml#L82">prometheus.scrape_configs[2].tls_config.insecure_skip_verify</a></td>
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
			<td id="prometheus--scrape_configs[3]--bearer_token_file"><a href="./values.yaml#L106">prometheus.scrape_configs[3].bearer_token_file</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/var/run/secrets/kubernetes.io/serviceaccount/token"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[3]--job_name"><a href="./values.yaml#L99">prometheus.scrape_configs[3].job_name</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"kubernetes-nodes-cadvisor"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[3]--kubernetes_sd_configs[0]--role"><a href="./values.yaml#L109">prometheus.scrape_configs[3].kubernetes_sd_configs[0].role</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"node"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[3]--relabel_configs[0]--action"><a href="./values.yaml#L112">prometheus.scrape_configs[3].relabel_configs[0].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"labelmap"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[3]--relabel_configs[0]--regex"><a href="./values.yaml#L113">prometheus.scrape_configs[3].relabel_configs[0].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_node_label_(.+)"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[3]--relabel_configs[1]--replacement"><a href="./values.yaml#L115">prometheus.scrape_configs[3].relabel_configs[1].replacement</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"kubernetes.default.svc:443"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[3]--relabel_configs[1]--target_label"><a href="./values.yaml#L114">prometheus.scrape_configs[3].relabel_configs[1].target_label</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__address__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[3]--relabel_configs[2]--regex"><a href="./values.yaml#L117">prometheus.scrape_configs[3].relabel_configs[2].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"(.+)"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[3]--relabel_configs[2]--replacement"><a href="./values.yaml#L119">prometheus.scrape_configs[3].relabel_configs[2].replacement</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/api/v1/nodes/$1/proxy/metrics/cadvisor"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[3]--relabel_configs[2]--source_labels[0]"><a href="./values.yaml#L116">prometheus.scrape_configs[3].relabel_configs[2].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_node_name"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[3]--relabel_configs[2]--target_label"><a href="./values.yaml#L118">prometheus.scrape_configs[3].relabel_configs[2].target_label</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__metrics_path__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[3]--scheme"><a href="./values.yaml#L101">prometheus.scrape_configs[3].scheme</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"https"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[3]--tls_config--ca_file"><a href="./values.yaml#L104">prometheus.scrape_configs[3].tls_config.ca_file</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/var/run/secrets/kubernetes.io/serviceaccount/ca.crt"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[3]--tls_config--insecure_skip_verify"><a href="./values.yaml#L105">prometheus.scrape_configs[3].tls_config.insecure_skip_verify</a></td>
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
			<td id="prometheus--scrape_configs[4]--honor_labels"><a href="./values.yaml#L123">prometheus.scrape_configs[4].honor_labels</a></td>
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
			<td id="prometheus--scrape_configs[4]--job_name"><a href="./values.yaml#L122">prometheus.scrape_configs[4].job_name</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"kubernetes-service-endpoints"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[4]--kubernetes_sd_configs[0]--role"><a href="./values.yaml#L126">prometheus.scrape_configs[4].kubernetes_sd_configs[0].role</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"endpoints"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[4]--relabel_configs[0]--action"><a href="./values.yaml#L130">prometheus.scrape_configs[4].relabel_configs[0].action</a></td>
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
			<td id="prometheus--scrape_configs[4]--relabel_configs[0]--regex"><a href="./values.yaml#L131">prometheus.scrape_configs[4].relabel_configs[0].regex</a></td>
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
			<td id="prometheus--scrape_configs[4]--relabel_configs[0]--source_labels[0]"><a href="./values.yaml#L129">prometheus.scrape_configs[4].relabel_configs[0].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_service_annotation_prometheus_io_scrape"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[4]--relabel_configs[1]--action"><a href="./values.yaml#L133">prometheus.scrape_configs[4].relabel_configs[1].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"drop"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[4]--relabel_configs[1]--regex"><a href="./values.yaml#L134">prometheus.scrape_configs[4].relabel_configs[1].regex</a></td>
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
			<td id="prometheus--scrape_configs[4]--relabel_configs[1]--source_labels[0]"><a href="./values.yaml#L132">prometheus.scrape_configs[4].relabel_configs[1].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_service_annotation_prometheus_io_scrape_slow"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[4]--relabel_configs[2]--action"><a href="./values.yaml#L136">prometheus.scrape_configs[4].relabel_configs[2].action</a></td>
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
			<td id="prometheus--scrape_configs[4]--relabel_configs[2]--regex"><a href="./values.yaml#L138">prometheus.scrape_configs[4].relabel_configs[2].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"(https?)"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[4]--relabel_configs[2]--source_labels[0]"><a href="./values.yaml#L135">prometheus.scrape_configs[4].relabel_configs[2].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_service_annotation_prometheus_io_scheme"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[4]--relabel_configs[2]--target_label"><a href="./values.yaml#L137">prometheus.scrape_configs[4].relabel_configs[2].target_label</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__scheme__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[4]--relabel_configs[3]--action"><a href="./values.yaml#L140">prometheus.scrape_configs[4].relabel_configs[3].action</a></td>
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
			<td id="prometheus--scrape_configs[4]--relabel_configs[3]--regex"><a href="./values.yaml#L142">prometheus.scrape_configs[4].relabel_configs[3].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"(.+)"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[4]--relabel_configs[3]--source_labels[0]"><a href="./values.yaml#L139">prometheus.scrape_configs[4].relabel_configs[3].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_service_annotation_prometheus_io_path"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[4]--relabel_configs[3]--target_label"><a href="./values.yaml#L141">prometheus.scrape_configs[4].relabel_configs[3].target_label</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__metrics_path__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[4]--relabel_configs[4]--action"><a href="./values.yaml#L144">prometheus.scrape_configs[4].relabel_configs[4].action</a></td>
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
			<td id="prometheus--scrape_configs[4]--relabel_configs[4]--regex"><a href="./values.yaml#L146">prometheus.scrape_configs[4].relabel_configs[4].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"(.+?)(?::\\d+)?;(\\d+)"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[4]--relabel_configs[4]--replacement"><a href="./values.yaml#L147">prometheus.scrape_configs[4].relabel_configs[4].replacement</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"$1:$2"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[4]--relabel_configs[4]--source_labels[0]"><a href="./values.yaml#L143">prometheus.scrape_configs[4].relabel_configs[4].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__address__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[4]--relabel_configs[4]--source_labels[1]"><a href="./values.yaml#L143">prometheus.scrape_configs[4].relabel_configs[4].source_labels[1]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_service_annotation_prometheus_io_port"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[4]--relabel_configs[4]--target_label"><a href="./values.yaml#L145">prometheus.scrape_configs[4].relabel_configs[4].target_label</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__address__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[4]--relabel_configs[5]--action"><a href="./values.yaml#L148">prometheus.scrape_configs[4].relabel_configs[5].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"labelmap"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[4]--relabel_configs[5]--regex"><a href="./values.yaml#L149">prometheus.scrape_configs[4].relabel_configs[5].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_service_annotation_prometheus_io_param_(.+)"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[4]--relabel_configs[5]--replacement"><a href="./values.yaml#L150">prometheus.scrape_configs[4].relabel_configs[5].replacement</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__param_$1"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[4]--relabel_configs[6]--action"><a href="./values.yaml#L151">prometheus.scrape_configs[4].relabel_configs[6].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"labelmap"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[4]--relabel_configs[6]--regex"><a href="./values.yaml#L152">prometheus.scrape_configs[4].relabel_configs[6].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_service_label_(.+)"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[4]--relabel_configs[7]--action"><a href="./values.yaml#L154">prometheus.scrape_configs[4].relabel_configs[7].action</a></td>
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
			<td id="prometheus--scrape_configs[4]--relabel_configs[7]--source_labels[0]"><a href="./values.yaml#L153">prometheus.scrape_configs[4].relabel_configs[7].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_namespace"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[4]--relabel_configs[7]--target_label"><a href="./values.yaml#L155">prometheus.scrape_configs[4].relabel_configs[7].target_label</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"namespace"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[4]--relabel_configs[8]--action"><a href="./values.yaml#L157">prometheus.scrape_configs[4].relabel_configs[8].action</a></td>
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
			<td id="prometheus--scrape_configs[4]--relabel_configs[8]--source_labels[0]"><a href="./values.yaml#L156">prometheus.scrape_configs[4].relabel_configs[8].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_service_name"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[4]--relabel_configs[8]--target_label"><a href="./values.yaml#L158">prometheus.scrape_configs[4].relabel_configs[8].target_label</a></td>
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
			<td id="prometheus--scrape_configs[4]--relabel_configs[9]--action"><a href="./values.yaml#L160">prometheus.scrape_configs[4].relabel_configs[9].action</a></td>
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
			<td id="prometheus--scrape_configs[4]--relabel_configs[9]--source_labels[0]"><a href="./values.yaml#L159">prometheus.scrape_configs[4].relabel_configs[9].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_pod_node_name"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[4]--relabel_configs[9]--target_label"><a href="./values.yaml#L161">prometheus.scrape_configs[4].relabel_configs[9].target_label</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"node"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[5]--honor_labels"><a href="./values.yaml#L164">prometheus.scrape_configs[5].honor_labels</a></td>
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
			<td id="prometheus--scrape_configs[5]--job_name"><a href="./values.yaml#L163">prometheus.scrape_configs[5].job_name</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"kubernetes-service-endpoints-slow"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[5]--kubernetes_sd_configs[0]--role"><a href="./values.yaml#L170">prometheus.scrape_configs[5].kubernetes_sd_configs[0].role</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"endpoints"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[5]--relabel_configs[0]--action"><a href="./values.yaml#L174">prometheus.scrape_configs[5].relabel_configs[0].action</a></td>
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
			<td id="prometheus--scrape_configs[5]--relabel_configs[0]--regex"><a href="./values.yaml#L175">prometheus.scrape_configs[5].relabel_configs[0].regex</a></td>
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
			<td id="prometheus--scrape_configs[5]--relabel_configs[0]--source_labels[0]"><a href="./values.yaml#L173">prometheus.scrape_configs[5].relabel_configs[0].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_service_annotation_prometheus_io_scrape_slow"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[5]--relabel_configs[1]--action"><a href="./values.yaml#L177">prometheus.scrape_configs[5].relabel_configs[1].action</a></td>
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
			<td id="prometheus--scrape_configs[5]--relabel_configs[1]--regex"><a href="./values.yaml#L179">prometheus.scrape_configs[5].relabel_configs[1].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"(https?)"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[5]--relabel_configs[1]--source_labels[0]"><a href="./values.yaml#L176">prometheus.scrape_configs[5].relabel_configs[1].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_service_annotation_prometheus_io_scheme"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[5]--relabel_configs[1]--target_label"><a href="./values.yaml#L178">prometheus.scrape_configs[5].relabel_configs[1].target_label</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__scheme__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[5]--relabel_configs[2]--action"><a href="./values.yaml#L181">prometheus.scrape_configs[5].relabel_configs[2].action</a></td>
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
			<td id="prometheus--scrape_configs[5]--relabel_configs[2]--regex"><a href="./values.yaml#L183">prometheus.scrape_configs[5].relabel_configs[2].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"(.+)"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[5]--relabel_configs[2]--source_labels[0]"><a href="./values.yaml#L180">prometheus.scrape_configs[5].relabel_configs[2].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_service_annotation_prometheus_io_path"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[5]--relabel_configs[2]--target_label"><a href="./values.yaml#L182">prometheus.scrape_configs[5].relabel_configs[2].target_label</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__metrics_path__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[5]--relabel_configs[3]--action"><a href="./values.yaml#L185">prometheus.scrape_configs[5].relabel_configs[3].action</a></td>
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
			<td id="prometheus--scrape_configs[5]--relabel_configs[3]--regex"><a href="./values.yaml#L187">prometheus.scrape_configs[5].relabel_configs[3].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"(.+?)(?::\\d+)?;(\\d+)"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[5]--relabel_configs[3]--replacement"><a href="./values.yaml#L188">prometheus.scrape_configs[5].relabel_configs[3].replacement</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"$1:$2"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[5]--relabel_configs[3]--source_labels[0]"><a href="./values.yaml#L184">prometheus.scrape_configs[5].relabel_configs[3].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__address__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[5]--relabel_configs[3]--source_labels[1]"><a href="./values.yaml#L184">prometheus.scrape_configs[5].relabel_configs[3].source_labels[1]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_service_annotation_prometheus_io_port"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[5]--relabel_configs[3]--target_label"><a href="./values.yaml#L186">prometheus.scrape_configs[5].relabel_configs[3].target_label</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__address__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[5]--relabel_configs[4]--action"><a href="./values.yaml#L189">prometheus.scrape_configs[5].relabel_configs[4].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"labelmap"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[5]--relabel_configs[4]--regex"><a href="./values.yaml#L190">prometheus.scrape_configs[5].relabel_configs[4].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_service_annotation_prometheus_io_param_(.+)"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[5]--relabel_configs[4]--replacement"><a href="./values.yaml#L191">prometheus.scrape_configs[5].relabel_configs[4].replacement</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__param_$1"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[5]--relabel_configs[5]--action"><a href="./values.yaml#L192">prometheus.scrape_configs[5].relabel_configs[5].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"labelmap"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[5]--relabel_configs[5]--regex"><a href="./values.yaml#L193">prometheus.scrape_configs[5].relabel_configs[5].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_service_label_(.+)"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[5]--relabel_configs[6]--action"><a href="./values.yaml#L195">prometheus.scrape_configs[5].relabel_configs[6].action</a></td>
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
			<td id="prometheus--scrape_configs[5]--relabel_configs[6]--source_labels[0]"><a href="./values.yaml#L194">prometheus.scrape_configs[5].relabel_configs[6].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_namespace"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[5]--relabel_configs[6]--target_label"><a href="./values.yaml#L196">prometheus.scrape_configs[5].relabel_configs[6].target_label</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"namespace"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[5]--relabel_configs[7]--action"><a href="./values.yaml#L198">prometheus.scrape_configs[5].relabel_configs[7].action</a></td>
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
			<td id="prometheus--scrape_configs[5]--relabel_configs[7]--source_labels[0]"><a href="./values.yaml#L197">prometheus.scrape_configs[5].relabel_configs[7].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_service_name"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[5]--relabel_configs[7]--target_label"><a href="./values.yaml#L199">prometheus.scrape_configs[5].relabel_configs[7].target_label</a></td>
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
			<td id="prometheus--scrape_configs[5]--relabel_configs[8]--action"><a href="./values.yaml#L201">prometheus.scrape_configs[5].relabel_configs[8].action</a></td>
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
			<td id="prometheus--scrape_configs[5]--relabel_configs[8]--source_labels[0]"><a href="./values.yaml#L200">prometheus.scrape_configs[5].relabel_configs[8].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_pod_node_name"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[5]--relabel_configs[8]--target_label"><a href="./values.yaml#L202">prometheus.scrape_configs[5].relabel_configs[8].target_label</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"node"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[5]--scrape_interval"><a href="./values.yaml#L166">prometheus.scrape_configs[5].scrape_interval</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"5m"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[5]--scrape_timeout"><a href="./values.yaml#L167">prometheus.scrape_configs[5].scrape_timeout</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"30s"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[6]--honor_labels"><a href="./values.yaml#L205">prometheus.scrape_configs[6].honor_labels</a></td>
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
			<td id="prometheus--scrape_configs[6]--job_name"><a href="./values.yaml#L204">prometheus.scrape_configs[6].job_name</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"prometheus-pushgateway"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[6]--kubernetes_sd_configs[0]--role"><a href="./values.yaml#L208">prometheus.scrape_configs[6].kubernetes_sd_configs[0].role</a></td>
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
			<td id="prometheus--scrape_configs[6]--relabel_configs[0]--action"><a href="./values.yaml#L212">prometheus.scrape_configs[6].relabel_configs[0].action</a></td>
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
			<td id="prometheus--scrape_configs[6]--relabel_configs[0]--regex"><a href="./values.yaml#L213">prometheus.scrape_configs[6].relabel_configs[0].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"pushgateway"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[6]--relabel_configs[0]--source_labels[0]"><a href="./values.yaml#L211">prometheus.scrape_configs[6].relabel_configs[0].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_service_annotation_prometheus_io_probe"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[7]--honor_labels"><a href="./values.yaml#L216">prometheus.scrape_configs[7].honor_labels</a></td>
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
			<td id="prometheus--scrape_configs[7]--job_name"><a href="./values.yaml#L215">prometheus.scrape_configs[7].job_name</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"kubernetes-services"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[7]--kubernetes_sd_configs[0]--role"><a href="./values.yaml#L223">prometheus.scrape_configs[7].kubernetes_sd_configs[0].role</a></td>
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
			<td id="prometheus--scrape_configs[7]--metrics_path"><a href="./values.yaml#L218">prometheus.scrape_configs[7].metrics_path</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/probe"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[7]--params--module[0]"><a href="./values.yaml#L220">prometheus.scrape_configs[7].params.module[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"http_2xx"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[7]--relabel_configs[0]--action"><a href="./values.yaml#L227">prometheus.scrape_configs[7].relabel_configs[0].action</a></td>
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
			<td id="prometheus--scrape_configs[7]--relabel_configs[0]--regex"><a href="./values.yaml#L228">prometheus.scrape_configs[7].relabel_configs[0].regex</a></td>
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
			<td id="prometheus--scrape_configs[7]--relabel_configs[0]--source_labels[0]"><a href="./values.yaml#L226">prometheus.scrape_configs[7].relabel_configs[0].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_service_annotation_prometheus_io_probe"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[7]--relabel_configs[1]--source_labels[0]"><a href="./values.yaml#L229">prometheus.scrape_configs[7].relabel_configs[1].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__address__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[7]--relabel_configs[1]--target_label"><a href="./values.yaml#L230">prometheus.scrape_configs[7].relabel_configs[1].target_label</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__param_target"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[7]--relabel_configs[2]--replacement"><a href="./values.yaml#L232">prometheus.scrape_configs[7].relabel_configs[2].replacement</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"blackbox"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[7]--relabel_configs[2]--target_label"><a href="./values.yaml#L231">prometheus.scrape_configs[7].relabel_configs[2].target_label</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__address__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[7]--relabel_configs[3]--source_labels[0]"><a href="./values.yaml#L233">prometheus.scrape_configs[7].relabel_configs[3].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__param_target"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[7]--relabel_configs[3]--target_label"><a href="./values.yaml#L234">prometheus.scrape_configs[7].relabel_configs[3].target_label</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"instance"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[7]--relabel_configs[4]--action"><a href="./values.yaml#L235">prometheus.scrape_configs[7].relabel_configs[4].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"labelmap"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[7]--relabel_configs[4]--regex"><a href="./values.yaml#L236">prometheus.scrape_configs[7].relabel_configs[4].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_service_label_(.+)"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[7]--relabel_configs[5]--source_labels[0]"><a href="./values.yaml#L237">prometheus.scrape_configs[7].relabel_configs[5].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_namespace"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[7]--relabel_configs[5]--target_label"><a href="./values.yaml#L238">prometheus.scrape_configs[7].relabel_configs[5].target_label</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"namespace"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[7]--relabel_configs[6]--source_labels[0]"><a href="./values.yaml#L239">prometheus.scrape_configs[7].relabel_configs[6].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_service_name"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[7]--relabel_configs[6]--target_label"><a href="./values.yaml#L240">prometheus.scrape_configs[7].relabel_configs[6].target_label</a></td>
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
			<td id="prometheus--scrape_configs[8]--honor_labels"><a href="./values.yaml#L243">prometheus.scrape_configs[8].honor_labels</a></td>
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
			<td id="prometheus--scrape_configs[8]--job_name"><a href="./values.yaml#L242">prometheus.scrape_configs[8].job_name</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"kubernetes-pods"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[8]--kubernetes_sd_configs[0]--role"><a href="./values.yaml#L246">prometheus.scrape_configs[8].kubernetes_sd_configs[0].role</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"pod"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[8]--relabel_configs[0]--action"><a href="./values.yaml#L250">prometheus.scrape_configs[8].relabel_configs[0].action</a></td>
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
			<td id="prometheus--scrape_configs[8]--relabel_configs[0]--regex"><a href="./values.yaml#L251">prometheus.scrape_configs[8].relabel_configs[0].regex</a></td>
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
			<td id="prometheus--scrape_configs[8]--relabel_configs[0]--source_labels[0]"><a href="./values.yaml#L249">prometheus.scrape_configs[8].relabel_configs[0].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_pod_annotation_prometheus_io_scrape"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[8]--relabel_configs[10]--action"><a href="./values.yaml#L286">prometheus.scrape_configs[8].relabel_configs[10].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"drop"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[8]--relabel_configs[10]--regex"><a href="./values.yaml#L285">prometheus.scrape_configs[8].relabel_configs[10].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"Pending|Succeeded|Failed|Completed"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[8]--relabel_configs[10]--source_labels[0]"><a href="./values.yaml#L284">prometheus.scrape_configs[8].relabel_configs[10].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_pod_phase"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[8]--relabel_configs[11]--action"><a href="./values.yaml#L288">prometheus.scrape_configs[8].relabel_configs[11].action</a></td>
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
			<td id="prometheus--scrape_configs[8]--relabel_configs[11]--source_labels[0]"><a href="./values.yaml#L287">prometheus.scrape_configs[8].relabel_configs[11].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_pod_node_name"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[8]--relabel_configs[11]--target_label"><a href="./values.yaml#L289">prometheus.scrape_configs[8].relabel_configs[11].target_label</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"node"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[8]--relabel_configs[1]--action"><a href="./values.yaml#L253">prometheus.scrape_configs[8].relabel_configs[1].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"drop"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[8]--relabel_configs[1]--regex"><a href="./values.yaml#L254">prometheus.scrape_configs[8].relabel_configs[1].regex</a></td>
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
			<td id="prometheus--scrape_configs[8]--relabel_configs[1]--source_labels[0]"><a href="./values.yaml#L252">prometheus.scrape_configs[8].relabel_configs[1].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_pod_annotation_prometheus_io_scrape_slow"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[8]--relabel_configs[2]--action"><a href="./values.yaml#L256">prometheus.scrape_configs[8].relabel_configs[2].action</a></td>
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
			<td id="prometheus--scrape_configs[8]--relabel_configs[2]--regex"><a href="./values.yaml#L257">prometheus.scrape_configs[8].relabel_configs[2].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"(https?)"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[8]--relabel_configs[2]--source_labels[0]"><a href="./values.yaml#L255">prometheus.scrape_configs[8].relabel_configs[2].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_pod_annotation_prometheus_io_scheme"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[8]--relabel_configs[2]--target_label"><a href="./values.yaml#L258">prometheus.scrape_configs[8].relabel_configs[2].target_label</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__scheme__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[8]--relabel_configs[3]--action"><a href="./values.yaml#L260">prometheus.scrape_configs[8].relabel_configs[3].action</a></td>
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
			<td id="prometheus--scrape_configs[8]--relabel_configs[3]--regex"><a href="./values.yaml#L262">prometheus.scrape_configs[8].relabel_configs[3].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"(.+)"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[8]--relabel_configs[3]--source_labels[0]"><a href="./values.yaml#L259">prometheus.scrape_configs[8].relabel_configs[3].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_pod_annotation_prometheus_io_path"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[8]--relabel_configs[3]--target_label"><a href="./values.yaml#L261">prometheus.scrape_configs[8].relabel_configs[3].target_label</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__metrics_path__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[8]--relabel_configs[4]--action"><a href="./values.yaml#L264">prometheus.scrape_configs[8].relabel_configs[4].action</a></td>
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
			<td id="prometheus--scrape_configs[8]--relabel_configs[4]--regex"><a href="./values.yaml#L265">prometheus.scrape_configs[8].relabel_configs[4].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"(\\d+);(([A-Fa-f0-9]{1,4}::?){1,7}[A-Fa-f0-9]{1,4})"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[8]--relabel_configs[4]--replacement"><a href="./values.yaml#L266">prometheus.scrape_configs[8].relabel_configs[4].replacement</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"[$2]:$1"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[8]--relabel_configs[4]--source_labels[0]"><a href="./values.yaml#L263">prometheus.scrape_configs[8].relabel_configs[4].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_pod_annotation_prometheus_io_port"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[8]--relabel_configs[4]--source_labels[1]"><a href="./values.yaml#L263">prometheus.scrape_configs[8].relabel_configs[4].source_labels[1]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_pod_ip"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[8]--relabel_configs[4]--target_label"><a href="./values.yaml#L267">prometheus.scrape_configs[8].relabel_configs[4].target_label</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__address__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[8]--relabel_configs[5]--action"><a href="./values.yaml#L269">prometheus.scrape_configs[8].relabel_configs[5].action</a></td>
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
			<td id="prometheus--scrape_configs[8]--relabel_configs[5]--regex"><a href="./values.yaml#L270">prometheus.scrape_configs[8].relabel_configs[5].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"(\\d+);((([0-9]+?)(\\.|$)){4})"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[8]--relabel_configs[5]--replacement"><a href="./values.yaml#L271">prometheus.scrape_configs[8].relabel_configs[5].replacement</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"$2:$1"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[8]--relabel_configs[5]--source_labels[0]"><a href="./values.yaml#L268">prometheus.scrape_configs[8].relabel_configs[5].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_pod_annotation_prometheus_io_port"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[8]--relabel_configs[5]--source_labels[1]"><a href="./values.yaml#L268">prometheus.scrape_configs[8].relabel_configs[5].source_labels[1]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_pod_ip"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[8]--relabel_configs[5]--target_label"><a href="./values.yaml#L272">prometheus.scrape_configs[8].relabel_configs[5].target_label</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__address__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[8]--relabel_configs[6]--action"><a href="./values.yaml#L273">prometheus.scrape_configs[8].relabel_configs[6].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"labelmap"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[8]--relabel_configs[6]--regex"><a href="./values.yaml#L274">prometheus.scrape_configs[8].relabel_configs[6].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_pod_annotation_prometheus_io_param_(.+)"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[8]--relabel_configs[6]--replacement"><a href="./values.yaml#L275">prometheus.scrape_configs[8].relabel_configs[6].replacement</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__param_$1"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[8]--relabel_configs[7]--action"><a href="./values.yaml#L276">prometheus.scrape_configs[8].relabel_configs[7].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"labelmap"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[8]--relabel_configs[7]--regex"><a href="./values.yaml#L277">prometheus.scrape_configs[8].relabel_configs[7].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_pod_label_(.+)"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[8]--relabel_configs[8]--action"><a href="./values.yaml#L279">prometheus.scrape_configs[8].relabel_configs[8].action</a></td>
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
			<td id="prometheus--scrape_configs[8]--relabel_configs[8]--source_labels[0]"><a href="./values.yaml#L278">prometheus.scrape_configs[8].relabel_configs[8].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_namespace"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[8]--relabel_configs[8]--target_label"><a href="./values.yaml#L280">prometheus.scrape_configs[8].relabel_configs[8].target_label</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"namespace"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[8]--relabel_configs[9]--action"><a href="./values.yaml#L282">prometheus.scrape_configs[8].relabel_configs[9].action</a></td>
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
			<td id="prometheus--scrape_configs[8]--relabel_configs[9]--source_labels[0]"><a href="./values.yaml#L281">prometheus.scrape_configs[8].relabel_configs[9].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_pod_name"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[8]--relabel_configs[9]--target_label"><a href="./values.yaml#L283">prometheus.scrape_configs[8].relabel_configs[9].target_label</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"pod"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[9]--honor_labels"><a href="./values.yaml#L292">prometheus.scrape_configs[9].honor_labels</a></td>
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
			<td id="prometheus--scrape_configs[9]--job_name"><a href="./values.yaml#L291">prometheus.scrape_configs[9].job_name</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"kubernetes-pods-slow"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[9]--kubernetes_sd_configs[0]--role"><a href="./values.yaml#L298">prometheus.scrape_configs[9].kubernetes_sd_configs[0].role</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"pod"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[9]--relabel_configs[0]--action"><a href="./values.yaml#L302">prometheus.scrape_configs[9].relabel_configs[0].action</a></td>
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
			<td id="prometheus--scrape_configs[9]--relabel_configs[0]--regex"><a href="./values.yaml#L303">prometheus.scrape_configs[9].relabel_configs[0].regex</a></td>
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
			<td id="prometheus--scrape_configs[9]--relabel_configs[0]--source_labels[0]"><a href="./values.yaml#L301">prometheus.scrape_configs[9].relabel_configs[0].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_pod_annotation_prometheus_io_scrape_slow"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[9]--relabel_configs[10]--action"><a href="./values.yaml#L337">prometheus.scrape_configs[9].relabel_configs[10].action</a></td>
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
			<td id="prometheus--scrape_configs[9]--relabel_configs[10]--source_labels[0]"><a href="./values.yaml#L336">prometheus.scrape_configs[9].relabel_configs[10].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_pod_node_name"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[9]--relabel_configs[10]--target_label"><a href="./values.yaml#L338">prometheus.scrape_configs[9].relabel_configs[10].target_label</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"node"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[9]--relabel_configs[1]--action"><a href="./values.yaml#L305">prometheus.scrape_configs[9].relabel_configs[1].action</a></td>
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
			<td id="prometheus--scrape_configs[9]--relabel_configs[1]--regex"><a href="./values.yaml#L306">prometheus.scrape_configs[9].relabel_configs[1].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"(https?)"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[9]--relabel_configs[1]--source_labels[0]"><a href="./values.yaml#L304">prometheus.scrape_configs[9].relabel_configs[1].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_pod_annotation_prometheus_io_scheme"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[9]--relabel_configs[1]--target_label"><a href="./values.yaml#L307">prometheus.scrape_configs[9].relabel_configs[1].target_label</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__scheme__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[9]--relabel_configs[2]--action"><a href="./values.yaml#L309">prometheus.scrape_configs[9].relabel_configs[2].action</a></td>
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
			<td id="prometheus--scrape_configs[9]--relabel_configs[2]--regex"><a href="./values.yaml#L311">prometheus.scrape_configs[9].relabel_configs[2].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"(.+)"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[9]--relabel_configs[2]--source_labels[0]"><a href="./values.yaml#L308">prometheus.scrape_configs[9].relabel_configs[2].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_pod_annotation_prometheus_io_path"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[9]--relabel_configs[2]--target_label"><a href="./values.yaml#L310">prometheus.scrape_configs[9].relabel_configs[2].target_label</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__metrics_path__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[9]--relabel_configs[3]--action"><a href="./values.yaml#L313">prometheus.scrape_configs[9].relabel_configs[3].action</a></td>
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
			<td id="prometheus--scrape_configs[9]--relabel_configs[3]--regex"><a href="./values.yaml#L314">prometheus.scrape_configs[9].relabel_configs[3].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"(\\d+);(([A-Fa-f0-9]{1,4}::?){1,7}[A-Fa-f0-9]{1,4})"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[9]--relabel_configs[3]--replacement"><a href="./values.yaml#L315">prometheus.scrape_configs[9].relabel_configs[3].replacement</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"[$2]:$1"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[9]--relabel_configs[3]--source_labels[0]"><a href="./values.yaml#L312">prometheus.scrape_configs[9].relabel_configs[3].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_pod_annotation_prometheus_io_port"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[9]--relabel_configs[3]--source_labels[1]"><a href="./values.yaml#L312">prometheus.scrape_configs[9].relabel_configs[3].source_labels[1]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_pod_ip"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[9]--relabel_configs[3]--target_label"><a href="./values.yaml#L316">prometheus.scrape_configs[9].relabel_configs[3].target_label</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__address__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[9]--relabel_configs[4]--action"><a href="./values.yaml#L318">prometheus.scrape_configs[9].relabel_configs[4].action</a></td>
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
			<td id="prometheus--scrape_configs[9]--relabel_configs[4]--regex"><a href="./values.yaml#L319">prometheus.scrape_configs[9].relabel_configs[4].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"(\\d+);((([0-9]+?)(\\.|$)){4})"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[9]--relabel_configs[4]--replacement"><a href="./values.yaml#L320">prometheus.scrape_configs[9].relabel_configs[4].replacement</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"$2:$1"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[9]--relabel_configs[4]--source_labels[0]"><a href="./values.yaml#L317">prometheus.scrape_configs[9].relabel_configs[4].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_pod_annotation_prometheus_io_port"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[9]--relabel_configs[4]--source_labels[1]"><a href="./values.yaml#L317">prometheus.scrape_configs[9].relabel_configs[4].source_labels[1]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_pod_ip"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[9]--relabel_configs[4]--target_label"><a href="./values.yaml#L321">prometheus.scrape_configs[9].relabel_configs[4].target_label</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__address__"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[9]--relabel_configs[5]--action"><a href="./values.yaml#L322">prometheus.scrape_configs[9].relabel_configs[5].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"labelmap"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[9]--relabel_configs[5]--regex"><a href="./values.yaml#L323">prometheus.scrape_configs[9].relabel_configs[5].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_pod_annotation_prometheus_io_param_(.+)"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[9]--relabel_configs[5]--replacement"><a href="./values.yaml#L324">prometheus.scrape_configs[9].relabel_configs[5].replacement</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__param_$1"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[9]--relabel_configs[6]--action"><a href="./values.yaml#L325">prometheus.scrape_configs[9].relabel_configs[6].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"labelmap"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[9]--relabel_configs[6]--regex"><a href="./values.yaml#L326">prometheus.scrape_configs[9].relabel_configs[6].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_pod_label_(.+)"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[9]--relabel_configs[7]--action"><a href="./values.yaml#L328">prometheus.scrape_configs[9].relabel_configs[7].action</a></td>
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
			<td id="prometheus--scrape_configs[9]--relabel_configs[7]--source_labels[0]"><a href="./values.yaml#L327">prometheus.scrape_configs[9].relabel_configs[7].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_namespace"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[9]--relabel_configs[7]--target_label"><a href="./values.yaml#L329">prometheus.scrape_configs[9].relabel_configs[7].target_label</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"namespace"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[9]--relabel_configs[8]--action"><a href="./values.yaml#L331">prometheus.scrape_configs[9].relabel_configs[8].action</a></td>
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
			<td id="prometheus--scrape_configs[9]--relabel_configs[8]--source_labels[0]"><a href="./values.yaml#L330">prometheus.scrape_configs[9].relabel_configs[8].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_pod_name"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[9]--relabel_configs[8]--target_label"><a href="./values.yaml#L332">prometheus.scrape_configs[9].relabel_configs[8].target_label</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"pod"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[9]--relabel_configs[9]--action"><a href="./values.yaml#L335">prometheus.scrape_configs[9].relabel_configs[9].action</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"drop"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[9]--relabel_configs[9]--regex"><a href="./values.yaml#L334">prometheus.scrape_configs[9].relabel_configs[9].regex</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"Pending|Succeeded|Failed|Completed"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[9]--relabel_configs[9]--source_labels[0]"><a href="./values.yaml#L333">prometheus.scrape_configs[9].relabel_configs[9].source_labels[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"__meta_kubernetes_pod_phase"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[9]--scrape_interval"><a href="./values.yaml#L294">prometheus.scrape_configs[9].scrape_interval</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"5m"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--scrape_configs[9]--scrape_timeout"><a href="./values.yaml#L295">prometheus.scrape_configs[9].scrape_timeout</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"30s"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--server--configPath"><a href="./values.yaml#L5">prometheus.server.configPath</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/etc/config/prometheus.yml"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--server--ingress--enabled"><a href="./values.yaml#L22">prometheus.server.ingress.enabled</a></td>
			<td>
bool
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
false
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--server--ingressroute--enabled"><a href="./values.yaml#L25">prometheus.server.ingressroute.enabled</a></td>
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
			<td id="prometheus--server--ingressroute--path"><a href="./values.yaml#L26">prometheus.server.ingressroute.path</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/prometheus/"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--server--persistentVolume--enabled"><a href="./values.yaml#L8">prometheus.server.persistentVolume.enabled</a></td>
			<td>
bool
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
false
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--server--persistentVolume--nfs--enabled"><a href="./values.yaml#L13">prometheus.server.persistentVolume.nfs.enabled</a></td>
			<td>
bool
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
false
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--server--persistentVolume--nfs--path"><a href="./values.yaml#L16">prometheus.server.persistentVolume.nfs.path</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/path"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--server--persistentVolume--nfs--server"><a href="./values.yaml#L14">prometheus.server.persistentVolume.nfs.server</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"10.0.0.1"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--server--persistentVolume--size"><a href="./values.yaml#L11">prometheus.server.persistentVolume.size</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"10Gi"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--server--persistentVolume--storageClass"><a href="./values.yaml#L10">prometheus.server.persistentVolume.storageClass</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"-"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--server--persistentVolume--volumeName"><a href="./values.yaml#L9">prometheus.server.persistentVolume.volumeName</a></td>
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
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--server--retention"><a href="./values.yaml#L28">prometheus.server.retention</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"15w"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="prometheus--server--service--enabled"><a href="./values.yaml#L19">prometheus.server.service.enabled</a></td>
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
			<td id="pveExporter--env--pveExistingSecretName"><a href="./values.yaml#L365">pveExporter.env.pveExistingSecretName</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"prometheus-pve-exporter"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="pveExporter--env--pveUser"><a href="./values.yaml#L364">pveExporter.env.pveUser</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"prometheus@pve"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="pveExporter--env--pveVerifySsl"><a href="./values.yaml#L366">pveExporter.env.pveVerifySsl</a></td>
			<td>
bool
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
false
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="pveExporter--image--repository"><a href="./values.yaml#L343">pveExporter.image.repository</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"prompve/prometheus-pve-exporter"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="pveExporter--image--tag"><a href="./values.yaml#L344">pveExporter.image.tag</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"3.5.2"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="pveExporter--replicaCount"><a href="./values.yaml#L346">pveExporter.replicaCount</a></td>
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
			<td></td>
		</tr>
		<tr>
			<td id="pveExporter--resources"><a href="./values.yaml#L361">pveExporter.resources</a></td>
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
			<td id="pveExporter--revisionHistoryLimit"><a href="./values.yaml#L348">pveExporter.revisionHistoryLimit</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
10
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="pveExporter--securityContext--capabilities--drop[0]"><a href="./values.yaml#L356">pveExporter.securityContext.capabilities.drop[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"ALL"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="pveExporter--securityContext--readOnlyRootFilesystem"><a href="./values.yaml#L357">pveExporter.securityContext.readOnlyRootFilesystem</a></td>
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
			<td id="pveExporter--securityContext--runAsNonRoot"><a href="./values.yaml#L358">pveExporter.securityContext.runAsNonRoot</a></td>
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
			<td id="pveExporter--securityContext--runAsUser"><a href="./values.yaml#L359">pveExporter.securityContext.runAsUser</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
65534
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="pveExporter--serviceAccount--create"><a href="./values.yaml#L351">pveExporter.serviceAccount.create</a></td>
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
	</tbody>
</table>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| trowaflo | <trowa.flo@gmail.com> |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
