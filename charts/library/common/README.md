

# common

Common library chart providing reusable Helm templates and default configurations.
Standardizes Kubernetes resource deployment (Deployments, Services, Ingress, ServiceMonitor)
across the chart repository with consistent security, observability, and best practices.

Used by all application charts in this repository for consistency.

---

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square)  ![Type: library](https://img.shields.io/badge/Type-library-informational?style=flat-square) 

**Homepage:** <https://github.com/trowaflo/helm-charts>

## Source Code

* <https://github.com/trowaflo/helm-charts>

## Requirements

- Helm: v3+

## Getting Started

### Add repository

```bash
helm repo add common https://example.com/helm-charts
helm repo update
```

### Install

```bash
helm install my-common common/common \
  --namespace default \
  --create-namespace
```

### Upgrade

```bash
helm upgrade my-common common/common \
  --namespace default \
  --install
```

### Uninstall

```bash
helm uninstall my-common --namespace default
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
			<td id="containers"><a href="./values.yaml#L23">containers</a></td>
			<td>