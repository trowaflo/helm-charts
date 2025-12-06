

# portainer

Portainer Community Edition - container and Kubernetes environment management platform.
Provides intuitive UI for managing Docker containers, Kubernetes clusters, and registries.
Wraps the official Portainer Helm chart with custom persistence and networking configuration.

---

![Version: 0.0.7](https://img.shields.io/badge/Version-0.0.7-informational?style=flat-square)  ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) 

**Homepage:** <https://www.portainer.io>

## Source Code

* <https://github.com/portainer/k8s>
* <https://github.com/trowaflo/helm-charts>

## Requirements

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://portainer.github.io/k8s | portainer | 1.0.63 |

- Helm: v3+

## Getting Started

### Add repository

```bash
helm repo add portainer https://example.com/helm-charts
helm repo update
```

### Install

```bash
helm install my-portainer portainer/portainer \
  --namespace default \
  --create-namespace
```

### Upgrade

```bash
helm upgrade my-portainer portainer/portainer \
  --namespace default \
  --install
```

### Uninstall

```bash
helm uninstall my-portainer --namespace default
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
			<td id="pv"><a href="./values.yaml#L2">pv</a></td>
			<td>