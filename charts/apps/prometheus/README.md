

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