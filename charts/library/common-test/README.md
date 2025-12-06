

# common-test

Test application chart demonstrating and validating the common library chart functionality.
Provides unit test scenarios covering common chart features including deployments,
services, ingress, security contexts, and Prometheus integration.

This chart is NOT intended for production use. It serves as a reference implementation
and testing vehicle for the common library.

---

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square)  ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) 

## Source Code

* <https://github.com/trowaflo/helm-charts>

## Requirements

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../common | common | 0.1.0 |

- Helm: v3+

## Getting Started

### Add repository

```bash
helm repo add common-test https://example.com/helm-charts
helm repo update
```

### Install

```bash
helm install my-common-test common-test/common-test \
  --namespace default \
  --create-namespace
```

### Upgrade

```bash
helm upgrade my-common-test common-test/common-test \
  --namespace default \
  --install
```

### Uninstall

```bash
helm uninstall my-common-test --namespace default
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
			<td id="containers--main--args[0]"><a href="./values.yaml#L5">containers.main.args[0]</a></td>
			<td>