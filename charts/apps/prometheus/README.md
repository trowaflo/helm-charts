

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
| https://prometheus-community.github.io/helm-charts | prometheus | 27.50.0 |

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
  --namespace prometheus \
  --create-namespace
```

### Upgrade

```bash
helm upgrade my-prometheus prometheus/prometheus \
  --namespace prometheus \
  --install
```

### Uninstall

```bash
helm uninstall my-prometheus --namespace prometheus
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
			<td>prometheus.alertmanager.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.kube-state-metrics.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.networkPolicy.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.prometheus-node-exporter.containerSecurityContext.allowPrivilegeEscalation</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.prometheus-node-exporter.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.prometheus-node-exporter.rbac.pspEnabled</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.prometheus-pushgateway.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[0].job_name</td>
			<td>string</td>
			<td><pre lang="json">
"prometheus"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[0].static_configs[0].targets[0]</td>
			<td>string</td>
			<td><pre lang="json">
"localhost:9090"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[1].bearer_token_file</td>
			<td>string</td>
			<td><pre lang="json">
"/var/run/secrets/kubernetes.io/serviceaccount/token"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[1].job_name</td>
			<td>string</td>
			<td><pre lang="json">
"kubernetes-apiservers"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[1].kubernetes_sd_configs[0].role</td>
			<td>string</td>
			<td><pre lang="json">
"endpoints"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[1].relabel_configs[0].action</td>
			<td>string</td>
			<td><pre lang="json">
"keep"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[1].relabel_configs[0].regex</td>
			<td>string</td>
			<td><pre lang="json">
"default;kubernetes;https"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[1].relabel_configs[0].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_namespace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[1].relabel_configs[0].source_labels[1]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_service_name"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[1].relabel_configs[0].source_labels[2]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_endpoint_port_name"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[1].scheme</td>
			<td>string</td>
			<td><pre lang="json">
"https"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[1].tls_config.ca_file</td>
			<td>string</td>
			<td><pre lang="json">
"/var/run/secrets/kubernetes.io/serviceaccount/ca.crt"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[1].tls_config.insecure_skip_verify</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[2].bearer_token_file</td>
			<td>string</td>
			<td><pre lang="json">
"/var/run/secrets/kubernetes.io/serviceaccount/token"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[2].job_name</td>
			<td>string</td>
			<td><pre lang="json">
"kubernetes-nodes"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[2].kubernetes_sd_configs[0].role</td>
			<td>string</td>
			<td><pre lang="json">
"node"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[2].relabel_configs[0].action</td>
			<td>string</td>
			<td><pre lang="json">
"labelmap"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[2].relabel_configs[0].regex</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_node_label_(.+)"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[2].relabel_configs[1].replacement</td>
			<td>string</td>
			<td><pre lang="json">
"kubernetes.default.svc:443"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[2].relabel_configs[1].target_label</td>
			<td>string</td>
			<td><pre lang="json">
"__address__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[2].relabel_configs[2].regex</td>
			<td>string</td>
			<td><pre lang="json">
"(.+)"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[2].relabel_configs[2].replacement</td>
			<td>string</td>
			<td><pre lang="json">
"/api/v1/nodes/$1/proxy/metrics"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[2].relabel_configs[2].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_node_name"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[2].relabel_configs[2].target_label</td>
			<td>string</td>
			<td><pre lang="json">
"__metrics_path__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[2].scheme</td>
			<td>string</td>
			<td><pre lang="json">
"https"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[2].tls_config.ca_file</td>
			<td>string</td>
			<td><pre lang="json">
"/var/run/secrets/kubernetes.io/serviceaccount/ca.crt"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[2].tls_config.insecure_skip_verify</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[3].bearer_token_file</td>
			<td>string</td>
			<td><pre lang="json">
"/var/run/secrets/kubernetes.io/serviceaccount/token"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[3].job_name</td>
			<td>string</td>
			<td><pre lang="json">
"kubernetes-nodes-cadvisor"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[3].kubernetes_sd_configs[0].role</td>
			<td>string</td>
			<td><pre lang="json">
"node"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[3].relabel_configs[0].action</td>
			<td>string</td>
			<td><pre lang="json">
"labelmap"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[3].relabel_configs[0].regex</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_node_label_(.+)"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[3].relabel_configs[1].replacement</td>
			<td>string</td>
			<td><pre lang="json">
"kubernetes.default.svc:443"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[3].relabel_configs[1].target_label</td>
			<td>string</td>
			<td><pre lang="json">
"__address__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[3].relabel_configs[2].regex</td>
			<td>string</td>
			<td><pre lang="json">
"(.+)"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[3].relabel_configs[2].replacement</td>
			<td>string</td>
			<td><pre lang="json">
"/api/v1/nodes/$1/proxy/metrics/cadvisor"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[3].relabel_configs[2].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_node_name"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[3].relabel_configs[2].target_label</td>
			<td>string</td>
			<td><pre lang="json">
"__metrics_path__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[3].scheme</td>
			<td>string</td>
			<td><pre lang="json">
"https"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[3].tls_config.ca_file</td>
			<td>string</td>
			<td><pre lang="json">
"/var/run/secrets/kubernetes.io/serviceaccount/ca.crt"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[3].tls_config.insecure_skip_verify</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].honor_labels</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].job_name</td>
			<td>string</td>
			<td><pre lang="json">
"kubernetes-service-endpoints"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].kubernetes_sd_configs[0].role</td>
			<td>string</td>
			<td><pre lang="json">
"endpoints"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].relabel_configs[0].action</td>
			<td>string</td>
			<td><pre lang="json">
"keep"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].relabel_configs[0].regex</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].relabel_configs[0].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_service_annotation_prometheus_io_scrape"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].relabel_configs[1].action</td>
			<td>string</td>
			<td><pre lang="json">
"drop"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].relabel_configs[1].regex</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].relabel_configs[1].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_service_annotation_prometheus_io_scrape_slow"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].relabel_configs[2].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].relabel_configs[2].regex</td>
			<td>string</td>
			<td><pre lang="json">
"(https?)"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].relabel_configs[2].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_service_annotation_prometheus_io_scheme"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].relabel_configs[2].target_label</td>
			<td>string</td>
			<td><pre lang="json">
"__scheme__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].relabel_configs[3].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].relabel_configs[3].regex</td>
			<td>string</td>
			<td><pre lang="json">
"(.+)"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].relabel_configs[3].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_service_annotation_prometheus_io_path"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].relabel_configs[3].target_label</td>
			<td>string</td>
			<td><pre lang="json">
"__metrics_path__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].relabel_configs[4].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].relabel_configs[4].regex</td>
			<td>string</td>
			<td><pre lang="json">
"(.+?)(?::\\d+)?;(\\d+)"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].relabel_configs[4].replacement</td>
			<td>string</td>
			<td><pre lang="json">
"$1:$2"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].relabel_configs[4].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__address__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].relabel_configs[4].source_labels[1]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_service_annotation_prometheus_io_port"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].relabel_configs[4].target_label</td>
			<td>string</td>
			<td><pre lang="json">
"__address__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].relabel_configs[5].action</td>
			<td>string</td>
			<td><pre lang="json">
"labelmap"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].relabel_configs[5].regex</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_service_annotation_prometheus_io_param_(.+)"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].relabel_configs[5].replacement</td>
			<td>string</td>
			<td><pre lang="json">
"__param_$1"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].relabel_configs[6].action</td>
			<td>string</td>
			<td><pre lang="json">
"labelmap"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].relabel_configs[6].regex</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_service_label_(.+)"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].relabel_configs[7].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].relabel_configs[7].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_namespace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].relabel_configs[7].target_label</td>
			<td>string</td>
			<td><pre lang="json">
"namespace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].relabel_configs[8].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].relabel_configs[8].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_service_name"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].relabel_configs[8].target_label</td>
			<td>string</td>
			<td><pre lang="json">
"service"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].relabel_configs[9].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].relabel_configs[9].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_pod_node_name"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[4].relabel_configs[9].target_label</td>
			<td>string</td>
			<td><pre lang="json">
"node"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].honor_labels</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].job_name</td>
			<td>string</td>
			<td><pre lang="json">
"kubernetes-service-endpoints-slow"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].kubernetes_sd_configs[0].role</td>
			<td>string</td>
			<td><pre lang="json">
"endpoints"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].relabel_configs[0].action</td>
			<td>string</td>
			<td><pre lang="json">
"keep"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].relabel_configs[0].regex</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].relabel_configs[0].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_service_annotation_prometheus_io_scrape_slow"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].relabel_configs[1].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].relabel_configs[1].regex</td>
			<td>string</td>
			<td><pre lang="json">
"(https?)"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].relabel_configs[1].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_service_annotation_prometheus_io_scheme"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].relabel_configs[1].target_label</td>
			<td>string</td>
			<td><pre lang="json">
"__scheme__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].relabel_configs[2].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].relabel_configs[2].regex</td>
			<td>string</td>
			<td><pre lang="json">
"(.+)"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].relabel_configs[2].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_service_annotation_prometheus_io_path"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].relabel_configs[2].target_label</td>
			<td>string</td>
			<td><pre lang="json">
"__metrics_path__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].relabel_configs[3].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].relabel_configs[3].regex</td>
			<td>string</td>
			<td><pre lang="json">
"(.+?)(?::\\d+)?;(\\d+)"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].relabel_configs[3].replacement</td>
			<td>string</td>
			<td><pre lang="json">
"$1:$2"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].relabel_configs[3].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__address__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].relabel_configs[3].source_labels[1]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_service_annotation_prometheus_io_port"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].relabel_configs[3].target_label</td>
			<td>string</td>
			<td><pre lang="json">
"__address__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].relabel_configs[4].action</td>
			<td>string</td>
			<td><pre lang="json">
"labelmap"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].relabel_configs[4].regex</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_service_annotation_prometheus_io_param_(.+)"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].relabel_configs[4].replacement</td>
			<td>string</td>
			<td><pre lang="json">
"__param_$1"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].relabel_configs[5].action</td>
			<td>string</td>
			<td><pre lang="json">
"labelmap"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].relabel_configs[5].regex</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_service_label_(.+)"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].relabel_configs[6].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].relabel_configs[6].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_namespace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].relabel_configs[6].target_label</td>
			<td>string</td>
			<td><pre lang="json">
"namespace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].relabel_configs[7].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].relabel_configs[7].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_service_name"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].relabel_configs[7].target_label</td>
			<td>string</td>
			<td><pre lang="json">
"service"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].relabel_configs[8].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].relabel_configs[8].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_pod_node_name"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].relabel_configs[8].target_label</td>
			<td>string</td>
			<td><pre lang="json">
"node"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].scrape_interval</td>
			<td>string</td>
			<td><pre lang="json">
"5m"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[5].scrape_timeout</td>
			<td>string</td>
			<td><pre lang="json">
"30s"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[6].honor_labels</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[6].job_name</td>
			<td>string</td>
			<td><pre lang="json">
"prometheus-pushgateway"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[6].kubernetes_sd_configs[0].role</td>
			<td>string</td>
			<td><pre lang="json">
"service"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[6].relabel_configs[0].action</td>
			<td>string</td>
			<td><pre lang="json">
"keep"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[6].relabel_configs[0].regex</td>
			<td>string</td>
			<td><pre lang="json">
"pushgateway"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[6].relabel_configs[0].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_service_annotation_prometheus_io_probe"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[7].honor_labels</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[7].job_name</td>
			<td>string</td>
			<td><pre lang="json">
"kubernetes-services"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[7].kubernetes_sd_configs[0].role</td>
			<td>string</td>
			<td><pre lang="json">
"service"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[7].metrics_path</td>
			<td>string</td>
			<td><pre lang="json">
"/probe"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[7].params.module[0]</td>
			<td>string</td>
			<td><pre lang="json">
"http_2xx"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[7].relabel_configs[0].action</td>
			<td>string</td>
			<td><pre lang="json">
"keep"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[7].relabel_configs[0].regex</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[7].relabel_configs[0].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_service_annotation_prometheus_io_probe"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[7].relabel_configs[1].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__address__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[7].relabel_configs[1].target_label</td>
			<td>string</td>
			<td><pre lang="json">
"__param_target"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[7].relabel_configs[2].replacement</td>
			<td>string</td>
			<td><pre lang="json">
"blackbox"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[7].relabel_configs[2].target_label</td>
			<td>string</td>
			<td><pre lang="json">
"__address__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[7].relabel_configs[3].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__param_target"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[7].relabel_configs[3].target_label</td>
			<td>string</td>
			<td><pre lang="json">
"instance"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[7].relabel_configs[4].action</td>
			<td>string</td>
			<td><pre lang="json">
"labelmap"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[7].relabel_configs[4].regex</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_service_label_(.+)"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[7].relabel_configs[5].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_namespace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[7].relabel_configs[5].target_label</td>
			<td>string</td>
			<td><pre lang="json">
"namespace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[7].relabel_configs[6].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_service_name"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[7].relabel_configs[6].target_label</td>
			<td>string</td>
			<td><pre lang="json">
"service"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].honor_labels</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].job_name</td>
			<td>string</td>
			<td><pre lang="json">
"kubernetes-pods"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].kubernetes_sd_configs[0].role</td>
			<td>string</td>
			<td><pre lang="json">
"pod"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[0].action</td>
			<td>string</td>
			<td><pre lang="json">
"keep"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[0].regex</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[0].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_pod_annotation_prometheus_io_scrape"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[10].action</td>
			<td>string</td>
			<td><pre lang="json">
"drop"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[10].regex</td>
			<td>string</td>
			<td><pre lang="json">
"Pending|Succeeded|Failed|Completed"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[10].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_pod_phase"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[11].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[11].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_pod_node_name"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[11].target_label</td>
			<td>string</td>
			<td><pre lang="json">
"node"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[1].action</td>
			<td>string</td>
			<td><pre lang="json">
"drop"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[1].regex</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[1].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_pod_annotation_prometheus_io_scrape_slow"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[2].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[2].regex</td>
			<td>string</td>
			<td><pre lang="json">
"(https?)"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[2].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_pod_annotation_prometheus_io_scheme"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[2].target_label</td>
			<td>string</td>
			<td><pre lang="json">
"__scheme__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[3].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[3].regex</td>
			<td>string</td>
			<td><pre lang="json">
"(.+)"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[3].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_pod_annotation_prometheus_io_path"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[3].target_label</td>
			<td>string</td>
			<td><pre lang="json">
"__metrics_path__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[4].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[4].regex</td>
			<td>string</td>
			<td><pre lang="json">
"(\\d+);(([A-Fa-f0-9]{1,4}::?){1,7}[A-Fa-f0-9]{1,4})"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[4].replacement</td>
			<td>string</td>
			<td><pre lang="json">
"[$2]:$1"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[4].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_pod_annotation_prometheus_io_port"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[4].source_labels[1]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_pod_ip"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[4].target_label</td>
			<td>string</td>
			<td><pre lang="json">
"__address__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[5].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[5].regex</td>
			<td>string</td>
			<td><pre lang="json">
"(\\d+);((([0-9]+?)(\\.|$)){4})"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[5].replacement</td>
			<td>string</td>
			<td><pre lang="json">
"$2:$1"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[5].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_pod_annotation_prometheus_io_port"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[5].source_labels[1]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_pod_ip"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[5].target_label</td>
			<td>string</td>
			<td><pre lang="json">
"__address__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[6].action</td>
			<td>string</td>
			<td><pre lang="json">
"labelmap"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[6].regex</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_pod_annotation_prometheus_io_param_(.+)"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[6].replacement</td>
			<td>string</td>
			<td><pre lang="json">
"__param_$1"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[7].action</td>
			<td>string</td>
			<td><pre lang="json">
"labelmap"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[7].regex</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_pod_label_(.+)"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[8].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[8].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_namespace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[8].target_label</td>
			<td>string</td>
			<td><pre lang="json">
"namespace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[9].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[9].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_pod_name"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[8].relabel_configs[9].target_label</td>
			<td>string</td>
			<td><pre lang="json">
"pod"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].honor_labels</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].job_name</td>
			<td>string</td>
			<td><pre lang="json">
"kubernetes-pods-slow"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].kubernetes_sd_configs[0].role</td>
			<td>string</td>
			<td><pre lang="json">
"pod"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[0].action</td>
			<td>string</td>
			<td><pre lang="json">
"keep"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[0].regex</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[0].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_pod_annotation_prometheus_io_scrape_slow"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[10].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[10].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_pod_node_name"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[10].target_label</td>
			<td>string</td>
			<td><pre lang="json">
"node"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[1].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[1].regex</td>
			<td>string</td>
			<td><pre lang="json">
"(https?)"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[1].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_pod_annotation_prometheus_io_scheme"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[1].target_label</td>
			<td>string</td>
			<td><pre lang="json">
"__scheme__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[2].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[2].regex</td>
			<td>string</td>
			<td><pre lang="json">
"(.+)"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[2].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_pod_annotation_prometheus_io_path"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[2].target_label</td>
			<td>string</td>
			<td><pre lang="json">
"__metrics_path__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[3].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[3].regex</td>
			<td>string</td>
			<td><pre lang="json">
"(\\d+);(([A-Fa-f0-9]{1,4}::?){1,7}[A-Fa-f0-9]{1,4})"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[3].replacement</td>
			<td>string</td>
			<td><pre lang="json">
"[$2]:$1"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[3].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_pod_annotation_prometheus_io_port"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[3].source_labels[1]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_pod_ip"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[3].target_label</td>
			<td>string</td>
			<td><pre lang="json">
"__address__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[4].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[4].regex</td>
			<td>string</td>
			<td><pre lang="json">
"(\\d+);((([0-9]+?)(\\.|$)){4})"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[4].replacement</td>
			<td>string</td>
			<td><pre lang="json">
"$2:$1"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[4].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_pod_annotation_prometheus_io_port"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[4].source_labels[1]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_pod_ip"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[4].target_label</td>
			<td>string</td>
			<td><pre lang="json">
"__address__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[5].action</td>
			<td>string</td>
			<td><pre lang="json">
"labelmap"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[5].regex</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_pod_annotation_prometheus_io_param_(.+)"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[5].replacement</td>
			<td>string</td>
			<td><pre lang="json">
"__param_$1"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[6].action</td>
			<td>string</td>
			<td><pre lang="json">
"labelmap"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[6].regex</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_pod_label_(.+)"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[7].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[7].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_namespace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[7].target_label</td>
			<td>string</td>
			<td><pre lang="json">
"namespace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[8].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[8].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_pod_name"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[8].target_label</td>
			<td>string</td>
			<td><pre lang="json">
"pod"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[9].action</td>
			<td>string</td>
			<td><pre lang="json">
"drop"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[9].regex</td>
			<td>string</td>
			<td><pre lang="json">
"Pending|Succeeded|Failed|Completed"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].relabel_configs[9].source_labels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__meta_kubernetes_pod_phase"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].scrape_interval</td>
			<td>string</td>
			<td><pre lang="json">
"5m"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.scrape_configs[9].scrape_timeout</td>
			<td>string</td>
			<td><pre lang="json">
"30s"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.server.configPath</td>
			<td>string</td>
			<td><pre lang="json">
"/etc/config/prometheus.yml"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.server.ingress.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.server.ingressroute.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.server.ingressroute.path</td>
			<td>string</td>
			<td><pre lang="json">
"/prometheus/"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.server.persistentVolume.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.server.persistentVolume.nfs.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.server.persistentVolume.nfs.path</td>
			<td>string</td>
			<td><pre lang="json">
"/path"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.server.persistentVolume.nfs.server</td>
			<td>string</td>
			<td><pre lang="json">
"10.0.0.1"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.server.persistentVolume.size</td>
			<td>string</td>
			<td><pre lang="json">
"10Gi"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.server.persistentVolume.storageClass</td>
			<td>string</td>
			<td><pre lang="json">
"-"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.server.persistentVolume.volumeName</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.server.retention</td>
			<td>string</td>
			<td><pre lang="json">
"15w"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>prometheus.server.service.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>pveExporter.env.pveExistingSecretName</td>
			<td>string</td>
			<td><pre lang="json">
"prometheus-pve-exporter"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>pveExporter.env.pveUser</td>
			<td>string</td>
			<td><pre lang="json">
"prometheus@pve"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>pveExporter.env.pveVerifySsl</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>pveExporter.image.repository</td>
			<td>string</td>
			<td><pre lang="json">
"prompve/prometheus-pve-exporter"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>pveExporter.image.tag</td>
			<td>string</td>
			<td><pre lang="json">
"3.5.2"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>pveExporter.replicaCount</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>pveExporter.resources</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>pveExporter.revisionHistoryLimit</td>
			<td>int</td>
			<td><pre lang="json">
10
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>pveExporter.securityContext.capabilities.drop[0]</td>
			<td>string</td>
			<td><pre lang="json">
"ALL"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>pveExporter.securityContext.readOnlyRootFilesystem</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>pveExporter.securityContext.runAsNonRoot</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>pveExporter.securityContext.runAsUser</td>
			<td>int</td>
			<td><pre lang="json">
65534
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>pveExporter.serviceAccount.create</td>
			<td>bool</td>
			<td><pre lang="json">
true
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
