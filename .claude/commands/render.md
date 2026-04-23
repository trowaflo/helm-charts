Render a chart's templates.

Determine the chart from current context (files recently edited, branch name, etc.). Use the chart name as the release name unless the user specifies otherwise.

```bash
helm dependency update charts/apps/<chart-name>
helm template <chart-name> charts/apps/<chart-name>
```
