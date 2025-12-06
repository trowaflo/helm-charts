

# grafana

Grafana visualization and dashboarding platform with custom extensions.
Wraps the official Grafana Helm chart with domain-specific customizations,
providing integrated dashboard provisioning and Traefik IngressRoute support.

---

![Version: 0.1.7](https://img.shields.io/badge/Version-0.1.7-informational?style=flat-square)  ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) 

**Homepage:** <https://grafana.com>

## Source Code

* <https://github.com/grafana/grafana>
* <https://github.com/trowaflo/helm-charts>

## Requirements

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://grafana.github.io/helm-charts | grafana | 8.11.4 |

- Helm: v3+

## Getting Started

### Add repository

```bash
helm repo add grafana https://example.com/helm-charts
helm repo update
```

### Install

```bash
helm install my-grafana grafana/grafana \
  --namespace default \
  --create-namespace
```

### Upgrade

```bash
helm upgrade my-grafana grafana/grafana \
  --namespace default \
  --install
```

### Uninstall

```bash
helm uninstall my-grafana --namespace default
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
			<td id="dashboards--default--custom-dashboard--file"><a href="./values.yaml#L25">dashboards.default.custom-dashboard.file</a></td>
			<td>