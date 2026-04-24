---
description: Render a chart's templates with helm template. Infer chart from context (edited files, branch name). Use chart name as release name unless specified. Always run helm dependency update first.
---

```bash
rm -f charts/apps/<chart>/charts/common-*.tgz
helm dependency update charts/apps/<chart>
helm template <chart> charts/apps/<chart>
```
