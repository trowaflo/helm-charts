# Helm Unit Tests

This repository uses [helm-unittest](https://github.com/helm-unittest/helm-unittest) to test Helm templates.

## Local Installation

Install the helm-unittest plugin locally:

```bash
helm plugin install https://github.com/helm-unittest/helm-unittest.git
```

## Running Tests

### All Charts

Run tests for every chart that has a `tests/` directory. Because charts are nested (e.g. `charts/apps/<chart>`), you need two levels of globbing:

```bash
for chart in charts/*/*/; do
  if [ -d "${chart}tests" ]; then
    echo "Running tests for ${chart}"
    helm unittest "${chart}"
  fi
done
```

Alternative using `find` (robust against future subfolders):

```bash
find charts -mindepth 2 -maxdepth 2 -type d -exec bash -c '[ -d "$0/tests" ] && echo "Running tests for $0" && helm unittest "$0"' {} \;
```

### Single Chart

Run tests for a specific chart (example: frigate-exporter):

```bash
helm unittest charts/apps/frigate-exporter
```

### Useful Options

- Color output: `helm unittest --color charts/apps/frigate-exporter`
- Update snapshots: `helm unittest -u charts/apps/frigate-exporter`

## Reminder: writing New Tests

Tests use the following YAML structure:

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

### Main Assertions

- `isKind`: Validates the Kubernetes resource kind
- `equal`: Asserts a value equals an expected one
- `notEqual`: Asserts a value differs from an expected one
- `contains`: Asserts a list contains an element
- `isNotNull` / `isNull`: Asserts presence or absence of a value
- `matchRegex`: Asserts a value matches a regular expression
- `hasDocuments`: Asserts the number of rendered documents

## CI/CD

Tests are automatically executed in GitHub Actions on each pull request that modifies files under `charts/`.

See `.github/workflows/helm-unittest.yml` for more details.

## References

- [helm-unittest documentation](https://github.com/helm-unittest/helm-unittest/blob/main/DOCUMENT.md)
- [Test examples](https://github.com/helm-unittest/helm-unittest/tree/main/test/data)
