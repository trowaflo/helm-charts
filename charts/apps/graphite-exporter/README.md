

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