# CI Fix Plan — feat/consolidate-ci

## Contexte

La PR #228 consolide les workflows CI via des workflows réutilisables (`trowaflo/github-actions`).
Le nouveau pipeline expose 4 échecs **pre-existing** (existaient déjà sur `main`) :

| # | Job | Cause racine | Complexité |
|---|-----|-------------|------------|
| T-001 | graphite-exporter + frigate-exporter tests | Snapshots périmés (`helm.sh/chart` 1.0.0→1.1.0) | Simple |
| T-002 | Helm Docs Check | README.md outdatés | Simple |
| T-003 | cert-manager-platform tests | Schema strict du subchart v0.9.5 rejette `enabled`/`configVersion` | Architectural |

---

## T-001 — Mettre à jour les snapshots stale [ ] IN PROGRESS

**Fichiers :**
- `charts/apps/graphite-exporter/tests/__snapshot__/` — snapshots à régénérer
- `charts/apps/frigate-exporter/tests/__snapshot__/` — snapshots à régénérer

- [ ] Régénérer les snapshots graphite-exporter
  ```bash
  helm unittest -u charts/apps/graphite-exporter
  ```
  Attendu : `Snapshot: N updated, 0 failed`

- [ ] Régénérer les snapshots frigate-exporter
  ```bash
  helm dependency update charts/apps/frigate-exporter
  helm unittest -u charts/apps/frigate-exporter
  ```
  Attendu : `Snapshot: N updated, 0 failed`

- [ ] Vérifier que les deux passent
  ```bash
  helm unittest charts/apps/graphite-exporter && helm unittest charts/apps/frigate-exporter
  ```
  Attendu : tous PASS

- [ ] Commit
  ```bash
  git add charts/apps/graphite-exporter/tests/__snapshot__/ charts/apps/frigate-exporter/tests/__snapshot__/
  git commit -m "fix(tests): update stale snapshots for graphite-exporter and frigate-exporter"
  ```

---

## T-002 — Régénérer les docs helm [ ]

**Fichiers :**
- `charts/apps/*/README.md` + `charts/library/*/README.md` — régénérés par helm-docs

- [ ] Régénérer tous les README
  ```bash
  helm-docs
  ```

- [ ] Vérifier qu'il n'y a pas de diff inattendu
  ```bash
  git diff --stat
  ```

- [ ] Commit les READMEs mis à jour
  ```bash
  git add charts/
  git commit -m "docs: regenerate helm-docs READMEs"
  ```

---

## T-003 — Corriger le schema strict de cert-manager-webhook-ovh [ ]

**Problème :** `cert-manager-webhook-ovh` v0.9.5 a `additionalProperties: false` dans son schema JSON.
Notre chart passe `enabled` (condition Helm) et `configVersion` (validation custom) sous la clé `cert-manager-webhook-ovh:`.
Le subchart voit ces propriétés inconnues et échoue.

**Fix :** Déplacer `enabled` et `configVersion` hors du namespace du subchart.

**Fichiers à modifier :**
- `charts/apps/cert-manager-platform/Chart.yaml` — changer la condition
- `charts/apps/cert-manager-platform/values.yaml` — restructurer les clés
- `charts/apps/cert-manager-platform/templates/_helpers.tpl` — lire depuis nouveau namespace
- `charts/apps/cert-manager-platform/tests/values/default.yaml`
- `charts/apps/cert-manager-platform/tests/values/disable-webhook.yaml`
- `charts/apps/cert-manager-platform/tests/values/configversion-missing.yaml`
- `charts/apps/cert-manager-platform/tests/values/configversion-wrong.yaml`
- (tous les autres `tests/values/*.yaml` contenant `cert-manager-webhook-ovh.enabled`)

### Sous-étapes

- [ ] Modifier `Chart.yaml` : changer la condition du subchart
  ```yaml
  # avant
  condition: cert-manager-webhook-ovh.enabled
  # après
  condition: certManagerWebhookOvh.enabled
  ```

- [ ] Modifier `values.yaml` : restructurer les clés
  ```yaml
  # Supprimer cert-manager-webhook-ovh.enabled et cert-manager-webhook-ovh.configVersion
  # Ajouter section dédiée
  certManagerWebhookOvh:
    enabled: true
    configVersion: "0.0.2"
  ```

- [ ] Modifier `_helpers.tpl` : lire depuis `.Values.certManagerWebhookOvh`
  ```
  {{- $webhookOvh := .Values.certManagerWebhookOvh }}
  ```
  (remplace `index .Values "cert-manager-webhook-ovh"`)

- [ ] Mettre à jour tous les fichiers `tests/values/*.yaml`
  - Remplacer `cert-manager-webhook-ovh:\n  enabled:` par `certManagerWebhookOvh:\n  enabled:`
  - Remplacer `cert-manager-webhook-ovh:\n  configVersion:` par `certManagerWebhookOvh:\n  configVersion:`

- [ ] Lancer les tests
  ```bash
  helm dependency update charts/apps/cert-manager-platform
  helm unittest charts/apps/cert-manager-platform
  ```
  Attendu : tous PASS (0 failed)

- [ ] Commit
  ```bash
  git add charts/apps/cert-manager-platform/
  git commit -m "fix(cert-manager-platform): move enabled/configVersion out of subchart namespace to fix schema validation"
  ```

---

## T-004 — Refactorer le reusable workflow helm dans github-actions [ ]

**Repo :** `trowaflo/github-actions`

**Problème :** `helm.yml` est un workflow monolithique à flags appelé 3 fois différemment
(`helm-ci.yml`, `helm-release.yml`, `helm-pr-cleanup.yml`). Cela :

- Rend le workflow difficile à lire (cascade de `if`)
- Crée un couplage fort entre PR, release, et cleanup
- Empêche de résoudre proprement le cycle bump → docs stales

**Piste :** Découper en workflows séparés (`helm-test.yml`, `helm-release.yml`, `helm-pr-cleanup.yml`)
ou à minima isoler le job `bump` pour qu'il s'exécute après les tests.

---

## Post-fix

- [ ] Push + vérifier CI verte sur la PR #228
  ```bash
  git push
  ```

---

## Statut global

- [ ] T-001 snapshots
- [ ] T-002 helm-docs
- [ ] T-003 cert-manager schema
- [ ] CI verte
