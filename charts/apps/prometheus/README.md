# prometheus

![Version: 3.0.0](https://img.shields.io/badge/Version-3.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Wraps the official kube-prometheus-stack Helm chart providing production-ready monitoring
stack including Prometheus, Grafana, Alertmanager, and node exporters.

**Homepage:** <https://prometheus.io>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| trowaflo | <trowa.flo@gmail.com> |  |

## Source Code

* <https://github.com/prometheus/prometheus>
* <https://github.com/prometheus-operator/prometheus-operator>
* <https://github.com/trowaflo/helm-charts>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://prometheus-community.github.io/helm-charts | prometheus | 28.0.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| prometheus.alertmanager.enabled | bool | `false` |  |
| prometheus.kube-state-metrics.enabled | bool | `true` |  |
| prometheus.networkPolicy.enabled | bool | `true` |  |
| prometheus.prometheus-node-exporter.containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| prometheus.prometheus-node-exporter.enabled | bool | `true` |  |
| prometheus.prometheus-node-exporter.rbac.pspEnabled | bool | `false` |  |
| prometheus.prometheus-pushgateway.enabled | bool | `false` |  |
| prometheus.scrape_configs[0].job_name | string | `"prometheus"` |  |
| prometheus.scrape_configs[0].static_configs[0].targets[0] | string | `"localhost:9090"` |  |
| prometheus.scrape_configs[1].bearer_token_file | string | `"/var/run/secrets/kubernetes.io/serviceaccount/token"` |  |
| prometheus.scrape_configs[1].job_name | string | `"kubernetes-apiservers"` |  |
| prometheus.scrape_configs[1].kubernetes_sd_configs[0].role | string | `"endpoints"` |  |
| prometheus.scrape_configs[1].relabel_configs[0].action | string | `"keep"` |  |
| prometheus.scrape_configs[1].relabel_configs[0].regex | string | `"default;kubernetes;https"` |  |
| prometheus.scrape_configs[1].relabel_configs[0].source_labels[0] | string | `"__meta_kubernetes_namespace"` |  |
| prometheus.scrape_configs[1].relabel_configs[0].source_labels[1] | string | `"__meta_kubernetes_service_name"` |  |
| prometheus.scrape_configs[1].relabel_configs[0].source_labels[2] | string | `"__meta_kubernetes_endpoint_port_name"` |  |
| prometheus.scrape_configs[1].scheme | string | `"https"` |  |
| prometheus.scrape_configs[1].tls_config.ca_file | string | `"/var/run/secrets/kubernetes.io/serviceaccount/ca.crt"` |  |
| prometheus.scrape_configs[1].tls_config.insecure_skip_verify | bool | `true` |  |
| prometheus.scrape_configs[2].bearer_token_file | string | `"/var/run/secrets/kubernetes.io/serviceaccount/token"` |  |
| prometheus.scrape_configs[2].job_name | string | `"kubernetes-nodes"` |  |
| prometheus.scrape_configs[2].kubernetes_sd_configs[0].role | string | `"node"` |  |
| prometheus.scrape_configs[2].relabel_configs[0].action | string | `"labelmap"` |  |
| prometheus.scrape_configs[2].relabel_configs[0].regex | string | `"__meta_kubernetes_node_label_(.+)"` |  |
| prometheus.scrape_configs[2].relabel_configs[1].replacement | string | `"kubernetes.default.svc:443"` |  |
| prometheus.scrape_configs[2].relabel_configs[1].target_label | string | `"__address__"` |  |
| prometheus.scrape_configs[2].relabel_configs[2].regex | string | `"(.+)"` |  |
| prometheus.scrape_configs[2].relabel_configs[2].replacement | string | `"/api/v1/nodes/$1/proxy/metrics"` |  |
| prometheus.scrape_configs[2].relabel_configs[2].source_labels[0] | string | `"__meta_kubernetes_node_name"` |  |
| prometheus.scrape_configs[2].relabel_configs[2].target_label | string | `"__metrics_path__"` |  |
| prometheus.scrape_configs[2].scheme | string | `"https"` |  |
| prometheus.scrape_configs[2].tls_config.ca_file | string | `"/var/run/secrets/kubernetes.io/serviceaccount/ca.crt"` |  |
| prometheus.scrape_configs[2].tls_config.insecure_skip_verify | bool | `true` |  |
| prometheus.scrape_configs[3].bearer_token_file | string | `"/var/run/secrets/kubernetes.io/serviceaccount/token"` |  |
| prometheus.scrape_configs[3].job_name | string | `"kubernetes-nodes-cadvisor"` |  |
| prometheus.scrape_configs[3].kubernetes_sd_configs[0].role | string | `"node"` |  |
| prometheus.scrape_configs[3].relabel_configs[0].action | string | `"labelmap"` |  |
| prometheus.scrape_configs[3].relabel_configs[0].regex | string | `"__meta_kubernetes_node_label_(.+)"` |  |
| prometheus.scrape_configs[3].relabel_configs[1].replacement | string | `"kubernetes.default.svc:443"` |  |
| prometheus.scrape_configs[3].relabel_configs[1].target_label | string | `"__address__"` |  |
| prometheus.scrape_configs[3].relabel_configs[2].regex | string | `"(.+)"` |  |
| prometheus.scrape_configs[3].relabel_configs[2].replacement | string | `"/api/v1/nodes/$1/proxy/metrics/cadvisor"` |  |
| prometheus.scrape_configs[3].relabel_configs[2].source_labels[0] | string | `"__meta_kubernetes_node_name"` |  |
| prometheus.scrape_configs[3].relabel_configs[2].target_label | string | `"__metrics_path__"` |  |
| prometheus.scrape_configs[3].scheme | string | `"https"` |  |
| prometheus.scrape_configs[3].tls_config.ca_file | string | `"/var/run/secrets/kubernetes.io/serviceaccount/ca.crt"` |  |
| prometheus.scrape_configs[3].tls_config.insecure_skip_verify | bool | `true` |  |
| prometheus.scrape_configs[4].honor_labels | bool | `true` |  |
| prometheus.scrape_configs[4].job_name | string | `"kubernetes-service-endpoints"` |  |
| prometheus.scrape_configs[4].kubernetes_sd_configs[0].role | string | `"endpoints"` |  |
| prometheus.scrape_configs[4].relabel_configs[0].action | string | `"keep"` |  |
| prometheus.scrape_configs[4].relabel_configs[0].regex | bool | `true` |  |
| prometheus.scrape_configs[4].relabel_configs[0].source_labels[0] | string | `"__meta_kubernetes_service_annotation_prometheus_io_scrape"` |  |
| prometheus.scrape_configs[4].relabel_configs[1].action | string | `"drop"` |  |
| prometheus.scrape_configs[4].relabel_configs[1].regex | bool | `true` |  |
| prometheus.scrape_configs[4].relabel_configs[1].source_labels[0] | string | `"__meta_kubernetes_service_annotation_prometheus_io_scrape_slow"` |  |
| prometheus.scrape_configs[4].relabel_configs[2].action | string | `"replace"` |  |
| prometheus.scrape_configs[4].relabel_configs[2].regex | string | `"(https?)"` |  |
| prometheus.scrape_configs[4].relabel_configs[2].source_labels[0] | string | `"__meta_kubernetes_service_annotation_prometheus_io_scheme"` |  |
| prometheus.scrape_configs[4].relabel_configs[2].target_label | string | `"__scheme__"` |  |
| prometheus.scrape_configs[4].relabel_configs[3].action | string | `"replace"` |  |
| prometheus.scrape_configs[4].relabel_configs[3].regex | string | `"(.+)"` |  |
| prometheus.scrape_configs[4].relabel_configs[3].source_labels[0] | string | `"__meta_kubernetes_service_annotation_prometheus_io_path"` |  |
| prometheus.scrape_configs[4].relabel_configs[3].target_label | string | `"__metrics_path__"` |  |
| prometheus.scrape_configs[4].relabel_configs[4].action | string | `"replace"` |  |
| prometheus.scrape_configs[4].relabel_configs[4].regex | string | `"(.+?)(?::\\d+)?;(\\d+)"` |  |
| prometheus.scrape_configs[4].relabel_configs[4].replacement | string | `"$1:$2"` |  |
| prometheus.scrape_configs[4].relabel_configs[4].source_labels[0] | string | `"__address__"` |  |
| prometheus.scrape_configs[4].relabel_configs[4].source_labels[1] | string | `"__meta_kubernetes_service_annotation_prometheus_io_port"` |  |
| prometheus.scrape_configs[4].relabel_configs[4].target_label | string | `"__address__"` |  |
| prometheus.scrape_configs[4].relabel_configs[5].action | string | `"labelmap"` |  |
| prometheus.scrape_configs[4].relabel_configs[5].regex | string | `"__meta_kubernetes_service_annotation_prometheus_io_param_(.+)"` |  |
| prometheus.scrape_configs[4].relabel_configs[5].replacement | string | `"__param_$1"` |  |
| prometheus.scrape_configs[4].relabel_configs[6].action | string | `"labelmap"` |  |
| prometheus.scrape_configs[4].relabel_configs[6].regex | string | `"__meta_kubernetes_service_label_(.+)"` |  |
| prometheus.scrape_configs[4].relabel_configs[7].action | string | `"replace"` |  |
| prometheus.scrape_configs[4].relabel_configs[7].source_labels[0] | string | `"__meta_kubernetes_namespace"` |  |
| prometheus.scrape_configs[4].relabel_configs[7].target_label | string | `"namespace"` |  |
| prometheus.scrape_configs[4].relabel_configs[8].action | string | `"replace"` |  |
| prometheus.scrape_configs[4].relabel_configs[8].source_labels[0] | string | `"__meta_kubernetes_service_name"` |  |
| prometheus.scrape_configs[4].relabel_configs[8].target_label | string | `"service"` |  |
| prometheus.scrape_configs[4].relabel_configs[9].action | string | `"replace"` |  |
| prometheus.scrape_configs[4].relabel_configs[9].source_labels[0] | string | `"__meta_kubernetes_pod_node_name"` |  |
| prometheus.scrape_configs[4].relabel_configs[9].target_label | string | `"node"` |  |
| prometheus.scrape_configs[5].honor_labels | bool | `true` |  |
| prometheus.scrape_configs[5].job_name | string | `"kubernetes-service-endpoints-slow"` |  |
| prometheus.scrape_configs[5].kubernetes_sd_configs[0].role | string | `"endpoints"` |  |
| prometheus.scrape_configs[5].relabel_configs[0].action | string | `"keep"` |  |
| prometheus.scrape_configs[5].relabel_configs[0].regex | bool | `true` |  |
| prometheus.scrape_configs[5].relabel_configs[0].source_labels[0] | string | `"__meta_kubernetes_service_annotation_prometheus_io_scrape_slow"` |  |
| prometheus.scrape_configs[5].relabel_configs[1].action | string | `"replace"` |  |
| prometheus.scrape_configs[5].relabel_configs[1].regex | string | `"(https?)"` |  |
| prometheus.scrape_configs[5].relabel_configs[1].source_labels[0] | string | `"__meta_kubernetes_service_annotation_prometheus_io_scheme"` |  |
| prometheus.scrape_configs[5].relabel_configs[1].target_label | string | `"__scheme__"` |  |
| prometheus.scrape_configs[5].relabel_configs[2].action | string | `"replace"` |  |
| prometheus.scrape_configs[5].relabel_configs[2].regex | string | `"(.+)"` |  |
| prometheus.scrape_configs[5].relabel_configs[2].source_labels[0] | string | `"__meta_kubernetes_service_annotation_prometheus_io_path"` |  |
| prometheus.scrape_configs[5].relabel_configs[2].target_label | string | `"__metrics_path__"` |  |
| prometheus.scrape_configs[5].relabel_configs[3].action | string | `"replace"` |  |
| prometheus.scrape_configs[5].relabel_configs[3].regex | string | `"(.+?)(?::\\d+)?;(\\d+)"` |  |
| prometheus.scrape_configs[5].relabel_configs[3].replacement | string | `"$1:$2"` |  |
| prometheus.scrape_configs[5].relabel_configs[3].source_labels[0] | string | `"__address__"` |  |
| prometheus.scrape_configs[5].relabel_configs[3].source_labels[1] | string | `"__meta_kubernetes_service_annotation_prometheus_io_port"` |  |
| prometheus.scrape_configs[5].relabel_configs[3].target_label | string | `"__address__"` |  |
| prometheus.scrape_configs[5].relabel_configs[4].action | string | `"labelmap"` |  |
| prometheus.scrape_configs[5].relabel_configs[4].regex | string | `"__meta_kubernetes_service_annotation_prometheus_io_param_(.+)"` |  |
| prometheus.scrape_configs[5].relabel_configs[4].replacement | string | `"__param_$1"` |  |
| prometheus.scrape_configs[5].relabel_configs[5].action | string | `"labelmap"` |  |
| prometheus.scrape_configs[5].relabel_configs[5].regex | string | `"__meta_kubernetes_service_label_(.+)"` |  |
| prometheus.scrape_configs[5].relabel_configs[6].action | string | `"replace"` |  |
| prometheus.scrape_configs[5].relabel_configs[6].source_labels[0] | string | `"__meta_kubernetes_namespace"` |  |
| prometheus.scrape_configs[5].relabel_configs[6].target_label | string | `"namespace"` |  |
| prometheus.scrape_configs[5].relabel_configs[7].action | string | `"replace"` |  |
| prometheus.scrape_configs[5].relabel_configs[7].source_labels[0] | string | `"__meta_kubernetes_service_name"` |  |
| prometheus.scrape_configs[5].relabel_configs[7].target_label | string | `"service"` |  |
| prometheus.scrape_configs[5].relabel_configs[8].action | string | `"replace"` |  |
| prometheus.scrape_configs[5].relabel_configs[8].source_labels[0] | string | `"__meta_kubernetes_pod_node_name"` |  |
| prometheus.scrape_configs[5].relabel_configs[8].target_label | string | `"node"` |  |
| prometheus.scrape_configs[5].scrape_interval | string | `"5m"` |  |
| prometheus.scrape_configs[5].scrape_timeout | string | `"30s"` |  |
| prometheus.scrape_configs[6].honor_labels | bool | `true` |  |
| prometheus.scrape_configs[6].job_name | string | `"prometheus-pushgateway"` |  |
| prometheus.scrape_configs[6].kubernetes_sd_configs[0].role | string | `"service"` |  |
| prometheus.scrape_configs[6].relabel_configs[0].action | string | `"keep"` |  |
| prometheus.scrape_configs[6].relabel_configs[0].regex | string | `"pushgateway"` |  |
| prometheus.scrape_configs[6].relabel_configs[0].source_labels[0] | string | `"__meta_kubernetes_service_annotation_prometheus_io_probe"` |  |
| prometheus.scrape_configs[7].honor_labels | bool | `true` |  |
| prometheus.scrape_configs[7].job_name | string | `"kubernetes-services"` |  |
| prometheus.scrape_configs[7].kubernetes_sd_configs[0].role | string | `"service"` |  |
| prometheus.scrape_configs[7].metrics_path | string | `"/probe"` |  |
| prometheus.scrape_configs[7].params.module[0] | string | `"http_2xx"` |  |
| prometheus.scrape_configs[7].relabel_configs[0].action | string | `"keep"` |  |
| prometheus.scrape_configs[7].relabel_configs[0].regex | bool | `true` |  |
| prometheus.scrape_configs[7].relabel_configs[0].source_labels[0] | string | `"__meta_kubernetes_service_annotation_prometheus_io_probe"` |  |
| prometheus.scrape_configs[7].relabel_configs[1].source_labels[0] | string | `"__address__"` |  |
| prometheus.scrape_configs[7].relabel_configs[1].target_label | string | `"__param_target"` |  |
| prometheus.scrape_configs[7].relabel_configs[2].replacement | string | `"blackbox"` |  |
| prometheus.scrape_configs[7].relabel_configs[2].target_label | string | `"__address__"` |  |
| prometheus.scrape_configs[7].relabel_configs[3].source_labels[0] | string | `"__param_target"` |  |
| prometheus.scrape_configs[7].relabel_configs[3].target_label | string | `"instance"` |  |
| prometheus.scrape_configs[7].relabel_configs[4].action | string | `"labelmap"` |  |
| prometheus.scrape_configs[7].relabel_configs[4].regex | string | `"__meta_kubernetes_service_label_(.+)"` |  |
| prometheus.scrape_configs[7].relabel_configs[5].source_labels[0] | string | `"__meta_kubernetes_namespace"` |  |
| prometheus.scrape_configs[7].relabel_configs[5].target_label | string | `"namespace"` |  |
| prometheus.scrape_configs[7].relabel_configs[6].source_labels[0] | string | `"__meta_kubernetes_service_name"` |  |
| prometheus.scrape_configs[7].relabel_configs[6].target_label | string | `"service"` |  |
| prometheus.scrape_configs[8].honor_labels | bool | `true` |  |
| prometheus.scrape_configs[8].job_name | string | `"kubernetes-pods"` |  |
| prometheus.scrape_configs[8].kubernetes_sd_configs[0].role | string | `"pod"` |  |
| prometheus.scrape_configs[8].relabel_configs[0].action | string | `"keep"` |  |
| prometheus.scrape_configs[8].relabel_configs[0].regex | bool | `true` |  |
| prometheus.scrape_configs[8].relabel_configs[0].source_labels[0] | string | `"__meta_kubernetes_pod_annotation_prometheus_io_scrape"` |  |
| prometheus.scrape_configs[8].relabel_configs[10].action | string | `"drop"` |  |
| prometheus.scrape_configs[8].relabel_configs[10].regex | string | `"Pending|Succeeded|Failed|Completed"` |  |
| prometheus.scrape_configs[8].relabel_configs[10].source_labels[0] | string | `"__meta_kubernetes_pod_phase"` |  |
| prometheus.scrape_configs[8].relabel_configs[11].action | string | `"replace"` |  |
| prometheus.scrape_configs[8].relabel_configs[11].source_labels[0] | string | `"__meta_kubernetes_pod_node_name"` |  |
| prometheus.scrape_configs[8].relabel_configs[11].target_label | string | `"node"` |  |
| prometheus.scrape_configs[8].relabel_configs[1].action | string | `"drop"` |  |
| prometheus.scrape_configs[8].relabel_configs[1].regex | bool | `true` |  |
| prometheus.scrape_configs[8].relabel_configs[1].source_labels[0] | string | `"__meta_kubernetes_pod_annotation_prometheus_io_scrape_slow"` |  |
| prometheus.scrape_configs[8].relabel_configs[2].action | string | `"replace"` |  |
| prometheus.scrape_configs[8].relabel_configs[2].regex | string | `"(https?)"` |  |
| prometheus.scrape_configs[8].relabel_configs[2].source_labels[0] | string | `"__meta_kubernetes_pod_annotation_prometheus_io_scheme"` |  |
| prometheus.scrape_configs[8].relabel_configs[2].target_label | string | `"__scheme__"` |  |
| prometheus.scrape_configs[8].relabel_configs[3].action | string | `"replace"` |  |
| prometheus.scrape_configs[8].relabel_configs[3].regex | string | `"(.+)"` |  |
| prometheus.scrape_configs[8].relabel_configs[3].source_labels[0] | string | `"__meta_kubernetes_pod_annotation_prometheus_io_path"` |  |
| prometheus.scrape_configs[8].relabel_configs[3].target_label | string | `"__metrics_path__"` |  |
| prometheus.scrape_configs[8].relabel_configs[4].action | string | `"replace"` |  |
| prometheus.scrape_configs[8].relabel_configs[4].regex | string | `"(\\d+);(([A-Fa-f0-9]{1,4}::?){1,7}[A-Fa-f0-9]{1,4})"` |  |
| prometheus.scrape_configs[8].relabel_configs[4].replacement | string | `"[$2]:$1"` |  |
| prometheus.scrape_configs[8].relabel_configs[4].source_labels[0] | string | `"__meta_kubernetes_pod_annotation_prometheus_io_port"` |  |
| prometheus.scrape_configs[8].relabel_configs[4].source_labels[1] | string | `"__meta_kubernetes_pod_ip"` |  |
| prometheus.scrape_configs[8].relabel_configs[4].target_label | string | `"__address__"` |  |
| prometheus.scrape_configs[8].relabel_configs[5].action | string | `"replace"` |  |
| prometheus.scrape_configs[8].relabel_configs[5].regex | string | `"(\\d+);((([0-9]+?)(\\.|$)){4})"` |  |
| prometheus.scrape_configs[8].relabel_configs[5].replacement | string | `"$2:$1"` |  |
| prometheus.scrape_configs[8].relabel_configs[5].source_labels[0] | string | `"__meta_kubernetes_pod_annotation_prometheus_io_port"` |  |
| prometheus.scrape_configs[8].relabel_configs[5].source_labels[1] | string | `"__meta_kubernetes_pod_ip"` |  |
| prometheus.scrape_configs[8].relabel_configs[5].target_label | string | `"__address__"` |  |
| prometheus.scrape_configs[8].relabel_configs[6].action | string | `"labelmap"` |  |
| prometheus.scrape_configs[8].relabel_configs[6].regex | string | `"__meta_kubernetes_pod_annotation_prometheus_io_param_(.+)"` |  |
| prometheus.scrape_configs[8].relabel_configs[6].replacement | string | `"__param_$1"` |  |
| prometheus.scrape_configs[8].relabel_configs[7].action | string | `"labelmap"` |  |
| prometheus.scrape_configs[8].relabel_configs[7].regex | string | `"__meta_kubernetes_pod_label_(.+)"` |  |
| prometheus.scrape_configs[8].relabel_configs[8].action | string | `"replace"` |  |
| prometheus.scrape_configs[8].relabel_configs[8].source_labels[0] | string | `"__meta_kubernetes_namespace"` |  |
| prometheus.scrape_configs[8].relabel_configs[8].target_label | string | `"namespace"` |  |
| prometheus.scrape_configs[8].relabel_configs[9].action | string | `"replace"` |  |
| prometheus.scrape_configs[8].relabel_configs[9].source_labels[0] | string | `"__meta_kubernetes_pod_name"` |  |
| prometheus.scrape_configs[8].relabel_configs[9].target_label | string | `"pod"` |  |
| prometheus.scrape_configs[9].honor_labels | bool | `true` |  |
| prometheus.scrape_configs[9].job_name | string | `"kubernetes-pods-slow"` |  |
| prometheus.scrape_configs[9].kubernetes_sd_configs[0].role | string | `"pod"` |  |
| prometheus.scrape_configs[9].relabel_configs[0].action | string | `"keep"` |  |
| prometheus.scrape_configs[9].relabel_configs[0].regex | bool | `true` |  |
| prometheus.scrape_configs[9].relabel_configs[0].source_labels[0] | string | `"__meta_kubernetes_pod_annotation_prometheus_io_scrape_slow"` |  |
| prometheus.scrape_configs[9].relabel_configs[10].action | string | `"replace"` |  |
| prometheus.scrape_configs[9].relabel_configs[10].source_labels[0] | string | `"__meta_kubernetes_pod_node_name"` |  |
| prometheus.scrape_configs[9].relabel_configs[10].target_label | string | `"node"` |  |
| prometheus.scrape_configs[9].relabel_configs[1].action | string | `"replace"` |  |
| prometheus.scrape_configs[9].relabel_configs[1].regex | string | `"(https?)"` |  |
| prometheus.scrape_configs[9].relabel_configs[1].source_labels[0] | string | `"__meta_kubernetes_pod_annotation_prometheus_io_scheme"` |  |
| prometheus.scrape_configs[9].relabel_configs[1].target_label | string | `"__scheme__"` |  |
| prometheus.scrape_configs[9].relabel_configs[2].action | string | `"replace"` |  |
| prometheus.scrape_configs[9].relabel_configs[2].regex | string | `"(.+)"` |  |
| prometheus.scrape_configs[9].relabel_configs[2].source_labels[0] | string | `"__meta_kubernetes_pod_annotation_prometheus_io_path"` |  |
| prometheus.scrape_configs[9].relabel_configs[2].target_label | string | `"__metrics_path__"` |  |
| prometheus.scrape_configs[9].relabel_configs[3].action | string | `"replace"` |  |
| prometheus.scrape_configs[9].relabel_configs[3].regex | string | `"(\\d+);(([A-Fa-f0-9]{1,4}::?){1,7}[A-Fa-f0-9]{1,4})"` |  |
| prometheus.scrape_configs[9].relabel_configs[3].replacement | string | `"[$2]:$1"` |  |
| prometheus.scrape_configs[9].relabel_configs[3].source_labels[0] | string | `"__meta_kubernetes_pod_annotation_prometheus_io_port"` |  |
| prometheus.scrape_configs[9].relabel_configs[3].source_labels[1] | string | `"__meta_kubernetes_pod_ip"` |  |
| prometheus.scrape_configs[9].relabel_configs[3].target_label | string | `"__address__"` |  |
| prometheus.scrape_configs[9].relabel_configs[4].action | string | `"replace"` |  |
| prometheus.scrape_configs[9].relabel_configs[4].regex | string | `"(\\d+);((([0-9]+?)(\\.|$)){4})"` |  |
| prometheus.scrape_configs[9].relabel_configs[4].replacement | string | `"$2:$1"` |  |
| prometheus.scrape_configs[9].relabel_configs[4].source_labels[0] | string | `"__meta_kubernetes_pod_annotation_prometheus_io_port"` |  |
| prometheus.scrape_configs[9].relabel_configs[4].source_labels[1] | string | `"__meta_kubernetes_pod_ip"` |  |
| prometheus.scrape_configs[9].relabel_configs[4].target_label | string | `"__address__"` |  |
| prometheus.scrape_configs[9].relabel_configs[5].action | string | `"labelmap"` |  |
| prometheus.scrape_configs[9].relabel_configs[5].regex | string | `"__meta_kubernetes_pod_annotation_prometheus_io_param_(.+)"` |  |
| prometheus.scrape_configs[9].relabel_configs[5].replacement | string | `"__param_$1"` |  |
| prometheus.scrape_configs[9].relabel_configs[6].action | string | `"labelmap"` |  |
| prometheus.scrape_configs[9].relabel_configs[6].regex | string | `"__meta_kubernetes_pod_label_(.+)"` |  |
| prometheus.scrape_configs[9].relabel_configs[7].action | string | `"replace"` |  |
| prometheus.scrape_configs[9].relabel_configs[7].source_labels[0] | string | `"__meta_kubernetes_namespace"` |  |
| prometheus.scrape_configs[9].relabel_configs[7].target_label | string | `"namespace"` |  |
| prometheus.scrape_configs[9].relabel_configs[8].action | string | `"replace"` |  |
| prometheus.scrape_configs[9].relabel_configs[8].source_labels[0] | string | `"__meta_kubernetes_pod_name"` |  |
| prometheus.scrape_configs[9].relabel_configs[8].target_label | string | `"pod"` |  |
| prometheus.scrape_configs[9].relabel_configs[9].action | string | `"drop"` |  |
| prometheus.scrape_configs[9].relabel_configs[9].regex | string | `"Pending|Succeeded|Failed|Completed"` |  |
| prometheus.scrape_configs[9].relabel_configs[9].source_labels[0] | string | `"__meta_kubernetes_pod_phase"` |  |
| prometheus.scrape_configs[9].scrape_interval | string | `"5m"` |  |
| prometheus.scrape_configs[9].scrape_timeout | string | `"30s"` |  |
| prometheus.server.configPath | string | `"/etc/config/prometheus.yml"` |  |
| prometheus.server.ingress.enabled | bool | `false` |  |
| prometheus.server.ingressroute.enabled | bool | `true` |  |
| prometheus.server.ingressroute.path | string | `"/prometheus/"` |  |
| prometheus.server.persistentVolume.enabled | bool | `false` |  |
| prometheus.server.persistentVolume.nfs.enabled | bool | `false` |  |
| prometheus.server.persistentVolume.nfs.path | string | `"/path"` |  |
| prometheus.server.persistentVolume.nfs.server | string | `"10.0.0.1"` |  |
| prometheus.server.persistentVolume.size | string | `"10Gi"` |  |
| prometheus.server.persistentVolume.storageClass | string | `"-"` |  |
| prometheus.server.persistentVolume.volumeName | string | `""` |  |
| prometheus.server.retention | string | `"15w"` |  |
| prometheus.server.service.enabled | bool | `true` |  |
| pveExporter.env.pveExistingSecretName | string | `"prometheus-pve-exporter"` |  |
| pveExporter.env.pveUser | string | `"prometheus@pve"` |  |
| pveExporter.env.pveVerifySsl | bool | `false` |  |
| pveExporter.image.repository | string | `"prompve/prometheus-pve-exporter"` |  |
| pveExporter.image.tag | string | `"3.8.0"` |  |
| pveExporter.replicaCount | int | `1` |  |
| pveExporter.resources | object | `{}` |  |
| pveExporter.revisionHistoryLimit | int | `10` |  |
| pveExporter.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| pveExporter.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| pveExporter.securityContext.runAsNonRoot | bool | `true` |  |
| pveExporter.securityContext.runAsUser | int | `65534` |  |
| pveExporter.serviceAccount.create | bool | `true` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
