

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