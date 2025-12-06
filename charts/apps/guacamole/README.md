

# guacamole

Apache Guacamole HTML5 remote desktop gateway for secure access to virtual machines and servers.
Provides browser-based RDP, SSH, and VNC access without requiring client-side installations.

---

![Version: 0.3.3](https://img.shields.io/badge/Version-0.3.3-informational?style=flat-square)  ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) 

**Homepage:** <https://guacamole.apache.org>

## Source Code

* <https://github.com/apache/guacamole-server>
* <https://github.com/trowaflo/helm-charts>

## Requirements

- Helm: v3+

## Getting Started

### Add repository

```bash
helm repo add guacamole https://example.com/helm-charts
helm repo update
```

### Install

```bash
helm install my-guacamole guacamole/guacamole \
  --namespace default \
  --create-namespace
```

### Upgrade

```bash
helm upgrade my-guacamole guacamole/guacamole \
  --namespace default \
  --install
```

### Uninstall

```bash
helm uninstall my-guacamole --namespace default
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
			<td id="app--resources--requests--cpu"><a href="./values.yaml#L17">app.resources.requests.cpu</a></td>
			<td>