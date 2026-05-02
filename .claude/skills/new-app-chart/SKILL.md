---
name: new-app-chart
description: >
  Creates a new application chart in charts/apps/ using the common library.
  Use whenever the user asks to create a new chart, add a new app, scaffold a chart,
  or deploy something new in this repo — even without the word "chart", e.g. "add plex",
  "create a chart for homepage", "I want to deploy node-exporter".
---

# new-app-chart

Use the existing charts in `charts/apps/` as references for structure, values format,
and test patterns. The most recent ones (`scrypted`, `mdns-repeater`) are the authoritative
examples for the current common library version.

## Key rule — dependency repository

The `common` dependency in `Chart.yaml` must always reference the **published registry**.
Use the same version as the other app charts in the repo:

```yaml
dependencies:
  - name: common
    version: x.y.z
    repository: https://trowaflo.github.io/helm-charts
```

`file://../../library/common` is only acceptable temporarily during local development
when iterating on the common library itself. Never commit it.

`version: 0.1.0` in `Chart.yaml` for a new chart — always. The CI bumps it automatically
via conventional commits, never set it manually. Same principle for the common dependency
version: use what the other charts use, never upgrade it manually.

## Tests

Every chart must have tests in `tests/`. Look at existing charts for patterns — one file
per resource type (workload, service, ingress…), with targeted assertions on the fields
that matter (image, ports, hosts…) plus `matchSnapshot`. A snapshot-only test is not enough.
