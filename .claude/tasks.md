# CI Fix Plan — feat/consolidate-ci

## Contexte

PR #228 : consolidation des workflows CI via `trowaflo/github-actions`.
Le nouveau pipeline exposait 4 bugs pre-existing + 2 problèmes détectés en cours de route.

## ✅ T-001 — Snapshots stale (graphite-exporter + frigate-exporter)

Commit `48d5d7c` — `fix(tests): update stale snapshots`

## ✅ T-002 — READMEs helm-docs outdatés

Commit `3bc9bf4` — `docs: regenerate helm-docs READMEs`

## ✅ T-003 — cert-manager-platform : schema strict du subchart

Commit `bdd7923` — `fix(cert-manager-platform): move enabled/configVersion out of subchart namespace`

`cert-manager-webhook-ovh` v0.9.5 a `additionalProperties: false`.
Déplacé `enabled` et `configVersion` vers `certManagerWebhookOvh.*`.

## ✅ T-004 — Cycle bump → docs stale

Commit `7d81943` — `chore(ci): disable docs check on PR, fix stale snapshots after version bumps`

`enable_docs_check: false` sur les PRs. Les docs sont auto-générées au merge sur main.

## ✅ T-005 — Permissions manquantes sur les workflows helm

Commit `ad2caf3` — `fix(ci): add top-level permissions: read-all to helm workflows`

`helm-ci.yml`, `helm-pr-cleanup.yml`, `helm-release.yml` n'avaient pas de `permissions: read-all`
au top-level (contrairement à `ci.yml`). Checkov SARIF uploadait 3 alertes bloquantes.

## ✅ T-006 — Markdown lint

Commit `aadeb01` + `8173cb2` — `chore(ci): enable markdown lint` + fixes

Ajout de `.markdownlint-cli2.yaml`, correction de `copilot-instructions.md`,
`CLAUDE.md`, issue templates.

---

## T-007 — Refactorer le reusable workflow helm dans github-actions [ ]

**Repo :** `trowaflo/github-actions`

**Problème :** `helm.yml` est un workflow monolithique à flags, appelé 3 fois avec des paramètres
différents (`helm-ci.yml`, `helm-release.yml`, `helm-pr-cleanup.yml`). Cela :

- Rend le workflow difficile à lire (cascade de `if`)
- Crée un couplage fort entre PR, release et cleanup
- Empêche de résoudre proprement le cycle bump → docs stales

**Piste :** Découper en workflows séparés ou isoler le job `bump` pour qu'il s'exécute après
les tests.

---

## Statut global

- [x] T-001 snapshots
- [x] T-002 helm-docs
- [x] T-003 cert-manager schema
- [x] T-004 cycle bump/docs
- [x] T-005 permissions workflows
- [x] T-006 markdown lint
- [ ] T-007 refacto reusable github-actions
- [ ] CI verte sur PR #228
