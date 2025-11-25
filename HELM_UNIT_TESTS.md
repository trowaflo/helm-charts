# Helm Unit Tests

Ce repository utilise [helm-unittest](https://github.com/helm-unittest/helm-unittest) pour tester les templates Helm.

## Installation locale

Pour installer le plugin helm-unittest localement :

```bash
helm plugin install https://github.com/helm-unittest/helm-unittest.git
```

## Exécuter les tests

### Tous les charts

Pour exécuter tous les tests de tous les charts :

```bash
for chart in charts/*/; do
  if [ -d "${chart}tests" ]; then
    echo "Running tests for ${chart}"
    helm unittest "${chart}"
  fi
done
```

### Un chart spécifique

Pour tester un chart spécifique, par exemple frigate-exporter :

```bash
helm unittest charts/frigate-exporter
```

### Options utiles

- Mode verbose : `helm unittest -v charts/frigate-exporter`
- Avec couleurs : `helm unittest --color charts/frigate-exporter`
- Mise à jour des snapshots : `helm unittest -u charts/frigate-exporter`

## Structure des tests

Les tests sont organisés dans un dossier `tests/` à l'intérieur de chaque chart :

```text
charts/
  frigate-exporter/
    Chart.yaml
    values.yaml
    templates/
      common.yaml
    tests/
      deployment_test.yaml
      service_test.yaml
      servicemonitor_test.yaml
```

## Écrire de nouveaux tests

Les tests utilisent la syntaxe YAML suivante :

```yaml
suite: test description
templates:
  - templates/common.yaml
tests:
  - it: should do something
    set:
      key: value
    asserts:
      - isKind:
          of: Deployment
      - equal:
          path: metadata.name
          value: expected-name
```

### Assertions principales

- `isKind`: Vérifie le type de ressource Kubernetes
- `equal`: Vérifie qu'une valeur est égale à une valeur attendue
- `notEqual`: Vérifie qu'une valeur n'est pas égale
- `contains`: Vérifie qu'une liste contient un élément
- `isNotNull` / `isNull`: Vérifie si une valeur existe
- `matchRegex`: Vérifie qu'une valeur correspond à une regex
- `hasDocuments`: Vérifie le nombre de documents générés

## CI/CD

Les tests sont automatiquement exécutés dans GitHub Actions sur chaque pull request qui modifie des fichiers dans le dossier `charts/`.

Voir `.github/workflows/helm-unit-test.yml` pour plus de détails.

## Références

- [Documentation helm-unittest](https://github.com/helm-unittest/helm-unittest/blob/main/DOCUMENT.md)
- [Exemples de tests](https://github.com/helm-unittest/helm-unittest/tree/main/test/data)
