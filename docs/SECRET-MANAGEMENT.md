# Secret Management Best Practices

## Current Approach

The Ghostfolio chart follows a **GitOps-first** approach where secrets are managed externally and never created by the chart itself. This ensures:

1. **No Secret Drift**: ArgoCD and other GitOps tools don't see drift from `randAlphaNum` or `lookup` functions
2. **Security**: Secrets are never committed to Git or stored in Helm values
3. **Separation of Concerns**: Secret management is handled by dedicated tools (External Secrets Operator, Sealed Secrets, etc.)

## Required Secrets

The chart requires three secrets to be pre-created:

### 1. Application Secrets (`ghostfolio-secrets`)
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: ghostfolio-secrets
  namespace: ghostfolio
type: Opaque
stringData:
  ACCESS_TOKEN_SALT: <random-32-char-string>
  JWT_SECRET_KEY: <random-32-char-string>
```

### 2. Database Connection Secret (`ghostfolio-db-secret`)
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: ghostfolio-db-secret
  namespace: ghostfolio
type: Opaque
stringData:
  DATABASE_URL: postgresql://user:password@ghostfolio-postgresql/ghostfolio
```

### 3. Redis Password Secret (`ghostfolio-redis-secret`)
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: ghostfolio-redis-secret
  namespace: ghostfolio
type: Opaque
stringData:
  REDIS_PASSWORD: <random-password>
```

## Secret Name Configuration

All secret names are configurable via values:

```yaml
ghostfolio:
  # Application secrets
  secretName: ghostfolio-secrets  # Configurable

  # Database secrets
  database:
    secretName: ghostfolio-db-secret  # Configurable
    secretKey: DATABASE_URL  # Configurable

  # Redis secrets
  redis:
    passwordSecretName: ghostfolio-redis-secret  # Configurable
    passwordSecretKey: REDIS_PASSWORD  # Configurable
```

## Integration with Secret Management Tools

### External Secrets Operator

```yaml
apiVersion: external-secrets.io/v1beta1
kind: ExternalSecret
metadata:
  name: ghostfolio-secrets
spec:
  refreshInterval: 1h
  secretStoreRef:
    name: vault-backend
    kind: SecretStore
  target:
    name: ghostfolio-secrets
    creationPolicy: Owner
  data:
    - secretKey: ACCESS_TOKEN_SALT
      remoteRef:
        key: secret/data/ghostfolio
        property: access_token_salt
    - secretKey: JWT_SECRET_KEY
      remoteRef:
        key: secret/data/ghostfolio
        property: jwt_secret_key
```

### Sealed Secrets

```yaml
apiVersion: bitnami.com/v1alpha1
kind: SealedSecret
metadata:
  name: ghostfolio-secrets
spec:
  encryptedData:
    ACCESS_TOKEN_SALT: AgBx3...encrypted...
    JWT_SECRET_KEY: AgCy4...encrypted...
  template:
    metadata:
      name: ghostfolio-secrets
    type: Opaque
```

### SOPS with ArgoCD

```yaml
# secrets.enc.yaml (encrypted with SOPS)
apiVersion: v1
kind: Secret
metadata:
  name: ghostfolio-secrets
type: Opaque
stringData:
  ACCESS_TOKEN_SALT: ENC[AES256_GCM,data:xGF7...]
  JWT_SECRET_KEY: ENC[AES256_GCM,data:yHK8...]
```

## Why Not Generate Secrets in the Chart?

### Problems with Auto-Generated Secrets

**Option 1: Using `randAlphaNum`**
```yaml
# ❌ BAD - Causes GitOps drift
env:
  - name: SECRET
    value: {{ randAlphaNum 32 | b64enc }}
```
- Every `helm template` generates different values
- ArgoCD sees perpetual drift
- Secrets change on every sync

**Option 2: Using `lookup` function**
```yaml
# ❌ BAD - Doesn't work offline
{{- $secret := lookup "v1" "Secret" .Release.Namespace "my-secret" }}
{{- if not $secret }}
  # Generate new secret
{{- end }}
```
- Requires cluster access
- Doesn't work with ArgoCD's offline rendering
- Can't preview changes locally

### Our Approach: External Secret Management

✅ **GOOD - Explicit external management**
```yaml
env:
  - name: SECRET
    valueFrom:
      secretKeyRef:
        name: my-secret  # Created externally
        key: SECRET
```

Benefits:
- ✅ No drift - secrets are immutable references
- ✅ Works offline - ArgoCD can render templates without cluster access
- ✅ GitOps-friendly - only references in Git, not values
- ✅ Security - secrets managed by dedicated tools
- ✅ Flexibility - use any secret management solution

## Future Enhancement: Optional Secret Generation

If there's strong demand for development/testing convenience, we could add:

```yaml
secrets:
  create: false  # Default: false (current behavior)

  # Only used when create: true
  ghostfolio:
    accessTokenSalt: ""  # Auto-generate if empty
    jwtSecretKey: ""     # Auto-generate if empty

  redis:
    password: ""  # Auto-generate if empty
```

**Implementation considerations:**
- Would still be opt-in (default: false)
- Would use annotations to make secrets immutable after creation
- Would include warnings in NOTES.txt about GitOps compatibility
- Production users would still use external secret management

## Decision

For now, we maintain the **external-only** approach because:

1. **Primary use case is production**: GitOps with ArgoCD
2. **Security best practice**: Secrets should never be in values files
3. **Consistency**: All secrets managed the same way
4. **Simplicity**: One clear pattern to follow

Charts requiring simpler development experience can provide example secret manifests in their documentation.

## Example Secret Generation Script

For development/testing, users can use this script:

```bash
#!/bin/bash
# generate-secrets.sh

NAMESPACE=${1:-ghostfolio}

kubectl create secret generic ghostfolio-secrets \
  --namespace=$NAMESPACE \
  --from-literal=ACCESS_TOKEN_SALT=$(openssl rand -base64 32) \
  --from-literal=JWT_SECRET_KEY=$(openssl rand -base64 32) \
  --dry-run=client -o yaml | kubectl apply -f -

kubectl create secret generic ghostfolio-redis-secret \
  --namespace=$NAMESPACE \
  --from-literal=REDIS_PASSWORD=$(openssl rand -base64 32) \
  --dry-run=client -o yaml | kubectl apply -f -

# Database URL should be configured after PostgreSQL is running
echo "Don't forget to create ghostfolio-db-secret with DATABASE_URL"
```

## References

- [ArgoCD Best Practices - Secrets](https://argo-cd.readthedocs.io/en/stable/operator-manual/secret-management/)
- [External Secrets Operator](https://external-secrets.io/)
- [Sealed Secrets](https://github.com/bitnami-labs/sealed-secrets)
- [SOPS](https://github.com/mozilla/sops)
