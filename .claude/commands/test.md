---
description: Run helm unittest for the current chart. When working on charts/library/common, test both tests/common-test AND dependent app charts. Always delete stale common-*.tgz and run helm dependency update before testing.
---

## Common library

```bash
for target in tests/common-test charts/apps/ghostfolio; do
  rm -f "${target}/charts/common-*.tgz"
  helm dependency update "${target}"
  helm unittest "${target}"
done
```

## Single app chart

```bash
rm -f charts/apps/<chart>/charts/common-*.tgz
helm dependency update charts/apps/<chart>
helm unittest charts/apps/<chart>
```

## Update snapshots: append `-u` to helm unittest
