# Test Command

Run helm unittest for this repo.

Determine the target chart from the current working context (files recently edited, branch name, etc.). If unclear, ask.

- Single chart: `helm unittest charts/apps/<chart-name>`
- All charts: `for chart in charts/*/*/; do [ -d "${chart}tests" ] && helm dependency update "${chart}" && helm unittest "${chart}"; done`
- Update snapshots: `helm unittest -u charts/apps/<chart-name>`

If the user doesn't specify, run the chart currently being worked on. Run all charts only if explicitly asked.
