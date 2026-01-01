# Copilot Instructions for helm-charts

## ⚠️ MANDATORY: Review These Instructions
**ALWAYS read and review this entire file at the start of ANY task or PR.** These instructions are your source of truth for architecture, conventions, and best practices. Update this file when you identify improvements or discover new patterns.

## Scope
Repo-wide guidance for GitHub Copilot (PR descriptions/reviews/fixes) for all charts.

## Self-improvement mandate
When working on ANY task:
1. Read these instructions completely before starting
2. Identify patterns or conventions not documented here
3. Look for optimization opportunities (code duplication, complex conditionals, missing abstractions)
4. Update this file if you discover important patterns or make structural changes
5. Propose instruction improvements when you notice gaps or ambiguities

## General expectations
- Branch from `main`; keep changes small and focused.
- Run `helm dependency update` in any chart you touch.
- Bump chart version when rendered manifests change.
- Prefer succinct, actionable PR descriptions and reviews.

## Required local checks (mandatory for any changed chart)
- Render sanity: `helm template <release> <chart-path>` with any required values for that chart.
- Unit tests: `helm unittest <chart-path>` (plugin: https://github.com/helm-unittest/helm-unittest). Add/adjust tests and snapshots when you change templates or values.
- Other validation tests: run any chart-specific validation present in `tests/` or workflows; update snapshots/fixtures as needed.
- Docs: run `helm-docs` when values/README change.

## Chart-specific notes (keep this section short; add only when truly chart-specific)
- cert-manager: dependency `cert-manager-webhook-ovh` requires `.Values.cert-manager-webhook-ovh.configVersion=0.0.2`; missing or wrong value fails templating. Tests: see `charts/apps/cert-manager/tests/` (enablement + configVersion cases).

## CI awareness
- Workflows in `.github/workflows/` cover lint, helm-docs, helm-unittest, security scans. Make sure changes won’t break them; mention executed commands in PRs.
