# graphite-exporter

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Prometheus exporter for converting Graphite plaintext protocol metrics to Prometheus format.
Enables Prometheus to scrape metrics from legacy Graphite systems and sources
(e.g., TrueNAS, custom monitoring systems) that emit Graphite-formatted metrics.

**Homepage:** <https://github.com/prometheus/graphite_exporter>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| trowaflo | <trowa.flo@gmail.com> |  |

## Source Code

* <https://github.com/prometheus/graphite_exporter>
* <https://github.com/trowaflo/helm-charts>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://trowaflo.github.io/helm-charts | common | 2.0.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| containers.main.args[0] | string | `"--graphite.listen-address=:9109"` |  |
| containers.main.image.pullPolicy | string | `"IfNotPresent"` |  |
| containers.main.image.repository | string | `"prom/graphite-exporter"` |  |
| containers.main.image.tag | string | `"v0.16.0@sha256:e54bca6645ea8a9e8c52312a8540de98ad08819d38476c021d77a0eae75bc797"` |  |
| containers.main.probes.liveness.httpGet.path | string | `"/metrics"` |  |
| containers.main.probes.readiness.httpGet.path | string | `"/metrics"` |  |
| containers.main.probes.startup.httpGet.path | string | `"/metrics"` |  |
| ingress.main.enabled | bool | `true` |  |
| ingress.main.hosts[0].host | string | `"graphite-exporter.fqdn.example.com"` |  |
| ingress.main.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.main.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| serviceMonitor.enabled | bool | `true` |  |
| serviceMonitor.endpoints[0].metricRelabelings[0].action | string | `"keep"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[0].regex | string | `"^(scale_.*)"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[0].sourceLabels[0] | string | `"__name__"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[10].action | string | `"replace"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[10].regex | string | `"^(.*)_(cpu)_cpu([0-9]+)?"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[10].replacement | string | `"${1}_${2}${3}"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[10].sourceLabels[0] | string | `"__name__"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[10].targetLabel | string | `"__name__"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[11].action | string | `"replace"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[11].regex | string | `"^(.*)_(total)_total"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[11].replacement | string | `"${1}_${2}"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[11].sourceLabels[0] | string | `"__name__"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[11].targetLabel | string | `"__name__"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[12].action | string | `"replace"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[12].regex | string | `"^(.*)_(available)_available"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[12].replacement | string | `"${1}_${2}"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[12].sourceLabels[0] | string | `"__name__"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[12].targetLabel | string | `"__name__"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[13].action | string | `"replace"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[13].regex | string | `"^(.*)_(size)_size"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[13].replacement | string | `"${1}_${2}"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[13].sourceLabels[0] | string | `"__name__"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[13].targetLabel | string | `"__name__"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[14].action | string | `"replace"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[14].regex | string | `"^(.*)_(avail)_avail"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[14].replacement | string | `"${1}_${2}"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[14].sourceLabels[0] | string | `"__name__"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[14].targetLabel | string | `"__name__"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[15].action | string | `"replace"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[15].regex | string | `"^(.*)_(free)_free"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[15].replacement | string | `"${1}_${2}"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[15].sourceLabels[0] | string | `"__name__"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[15].targetLabel | string | `"__name__"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[16].action | string | `"replace"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[16].regex | string | `"^(.*)_(l2bytes)_l2bytes"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[16].replacement | string | `"${1}_${2}"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[16].sourceLabels[0] | string | `"__name__"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[16].targetLabel | string | `"__name__"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[17].action | string | `"replace"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[17].regex | string | `"^(.*)_(l2hits)_l2hits"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[17].replacement | string | `"${1}_${2}"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[17].sourceLabels[0] | string | `"__name__"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[17].targetLabel | string | `"__name__"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[18].action | string | `"replace"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[18].regex | string | `"^(.*)_(l2miss)_l2miss"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[18].replacement | string | `"${1}_${2}"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[18].sourceLabels[0] | string | `"__name__"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[18].targetLabel | string | `"__name__"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[19].action | string | `"replace"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[19].regex | string | `"^(.*)_(load)_load(1|5|15)"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[19].replacement | string | `"${1}_${2}${3}"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[19].sourceLabels[0] | string | `"__name__"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[19].targetLabel | string | `"__name__"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[1].action | string | `"replace"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[1].regex | string | `"^scale_([^_]+)_.*"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[1].replacement | string | `"${1}"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[1].sourceLabels[0] | string | `"__name__"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[1].targetLabel | string | `"hostname"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[20].action | string | `"keep"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[20].regex | string | `"truenas_(system_uptime.*|cpu_usage.*|cputemp.*|system_load.*|meminfo.*|arcstats.*|net_.*(speed|received|sent).*|disk_stats_busy__serial_lunid.*)"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[20].sourceLabels[0] | string | `"__name__"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[2].action | string | `"replace"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[2].regex | string | `"^scale_[^_]+_([^_]+)_.*"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[2].replacement | string | `"${1}"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[2].sourceLabels[0] | string | `"__name__"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[2].targetLabel | string | `"service"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[3].action | string | `"replace"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[3].regex | string | `"^.*_cpu_cpu([0-9]+)"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[3].replacement | string | `"cpu${1}"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[3].sourceLabels[0] | string | `"__name__"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[3].targetLabel | string | `"cpu"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[4].action | string | `"replace"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[4].regex | string | `"^.*_cputemp_temperatures_cpu([0-9]+)"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[4].replacement | string | `"cpu${1}"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[4].sourceLabels[0] | string | `"__name__"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[4].targetLabel | string | `"cpu"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[5].action | string | `"replace"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[5].regex | string | `"^.*_net_speed_([^_]+)_[^_\\n]+"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[5].replacement | string | `"${1}"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[5].sourceLabels[0] | string | `"__name__"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[5].targetLabel | string | `"interface"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[6].action | string | `"replace"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[6].regex | string | `"^(.*_net_speed).*"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[6].replacement | string | `"${1}"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[6].sourceLabels[0] | string | `"__name__"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[6].targetLabel | string | `"__name__"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[7].action | string | `"replace"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[7].regex | string | `"^(scale_truenas)_truenas_(.*)$"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[7].replacement | string | `"${1}_${2}"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[7].sourceLabels[0] | string | `"__name__"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[7].targetLabel | string | `"__name__"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[8].action | string | `"replace"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[8].regex | string | `"^scale_[^_]+_(.*)"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[8].replacement | string | `"truenas_${1}"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[8].sourceLabels[0] | string | `"__name__"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[8].targetLabel | string | `"__name__"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[9].action | string | `"replace"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[9].regex | string | `"^(.*)_(uptime)_uptime"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[9].replacement | string | `"${1}_${2}"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[9].sourceLabels[0] | string | `"__name__"` |  |
| serviceMonitor.endpoints[0].metricRelabelings[9].targetLabel | string | `"__name__"` |  |
| serviceMonitor.endpoints[0].port | string | `"main"` |  |
| services.graphite.annotations | object | `{}` |  |
| services.graphite.enabled | bool | `true` |  |
| services.graphite.labels | object | `{}` |  |
| services.graphite.ports.graphite-tcp.port | int | `9109` |  |
| services.graphite.ports.graphite-tcp.protocol | string | `"TCP"` |  |
| services.graphite.ports.graphite-udp.port | int | `9109` |  |
| services.graphite.ports.graphite-udp.protocol | string | `"UDP"` |  |
| services.graphite.type | string | `"LoadBalancer"` |  |
| services.main.annotations | object | `{}` |  |
| services.main.enabled | bool | `true` |  |
| services.main.labels | object | `{}` |  |
| services.main.ports.main.port | int | `9108` |  |
| services.main.ports.main.protocol | string | `"TCP"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
