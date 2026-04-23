# KICS Security Remediation Guide

This document tracks KICS (Keeping Infrastructure as Code Secure) security findings and their remediation status.

## Goal

**Zero KICS warnings** - All security findings must be resolved or explicitly accepted with justification.

## Common KICS Findings in Kubernetes/Helm Charts

### 1. Missing Resource Limits

**Issue**: Containers without resource limits can consume all node resources
**Severity**: Medium
**Remediation**: Add resource requests and limits to all containers

```yaml
resources:
  requests:
    cpu: 100m
    memory: 128Mi
  limits:
    cpu: 500m
    memory: 256Mi
```

**Status**: ✅ RESOLVED - All containers in Ghostfolio chart have resource limits defined

### 2. Privileged Containers

**Issue**: Containers running in privileged mode have host-level access
**Severity**: High
**Remediation**: Set `privileged: false` and remove unnecessary capabilities

```yaml
securityContext:
  allowPrivilegeEscalation: false
  privileged: false
  capabilities:
    drop:
      - ALL
```

**Status**: ✅ RESOLVED - All containers have `allowPrivilegeEscalation: false` and drop ALL capabilities

### 3. Root User

**Issue**: Containers running as root have unnecessary privileges
**Severity**: High
**Remediation**: Run as non-root user

```yaml
podSecurityContext:
  runAsNonRoot: true
  runAsUser: 1000
  runAsGroup: 1000
  fsGroup: 1000
```

**Status**: ✅ RESOLVED - All pods have runAsNonRoot: true

### 4. Read-Write Root Filesystem

**Issue**: Writable root filesystem increases attack surface
**Severity**: Low
**Remediation**: Set readOnlyRootFilesystem where possible

```yaml
securityContext:
  readOnlyRootFilesystem: true
```

**Status**: ⚠️ PARTIAL

- Redis: readOnlyRootFilesystem: true (uses emptyDir for /data and /tmp)
- Ghostfolio main: readOnlyRootFilesystem: true
- Backup/Restore jobs: readOnlyRootFilesystem: false (need to write files)

**Justification for exceptions**:

- Backup/restore jobs need writable filesystem to write dump files
- This is acceptable as they are short-lived jobs

### 5. Service Account Auto-mount

**Issue**: Automatically mounting service account tokens when not needed
**Severity**: Low
**Remediation**: Disable automountServiceAccountToken

```yaml
spec:
  template:
    spec:
      automountServiceAccountToken: false
```

**Status**: ✅ RESOLVED - All deployments have automountServiceAccountToken: false

### 6. Network Policies

**Issue**: Missing network policies allow unrestricted pod-to-pod communication
**Severity**: Medium
**Remediation**: Implement network policies

**Status**: ⏳ NOT IMPLEMENTED
**Decision**: Network policies are environment-specific and should be managed outside the chart. Users can add custom network policies as needed.

### 7. Pod Security Standards

**Issue**: Not explicitly setting pod security admission labels
**Severity**: Low
**Remediation**: Add pod security labels to namespaces

**Status**: ⏳ NOT IMPLEMENTED
**Decision**: Pod Security Standards are cluster-level configurations. Charts should be compatible but not enforce specific PSS levels.

### 8. Image Pull Policy

**Issue**: Missing or incorrect image pull policy
**Severity**: Low
**Remediation**: Set explicit imagePullPolicy

```yaml
imagePullPolicy: IfNotPresent  # or Always for :latest tags
```

**Status**: ✅ RESOLVED - All containers have explicit imagePullPolicy

### 9. Liveness/Readiness Probes

**Issue**: Missing health probes can cause cascading failures
**Severity**: Medium
**Remediation**: Add liveness and readiness probes

**Status**: ✅ RESOLVED - Main deployment has both probes, Redis has custom exec probes

### 10. Secrets in Environment Variables

**Issue**: Hardcoded secrets in environment variables
**Severity**: Critical
**Remediation**: Use secret references

```yaml
env:
  - name: DATABASE_URL
    valueFrom:
      secretKeyRef:
        name: ghostfolio-db-secret
        key: DATABASE_URL
```

**Status**: ✅ RESOLVED - All secrets use secretKeyRef

## Testing KICS Locally

To run KICS scan on the charts:

```bash
# Render the chart
helm template ghostfolio charts/apps/ghostfolio > /tmp/ghostfolio.yaml

# Run KICS
docker run -v /tmp:/path checkmarx/kics:latest scan -p /path/ghostfolio.yaml
```

## CI/CD Integration

KICS runs automatically in the CI pipeline via the security workflow:

- File: `.github/workflows/ci.yml`
- Job: `security`
- Results uploaded to GitHub Security tab

## Acceptance Criteria

All KICS findings must be either:

1. ✅ **Resolved**: Fixed in the code
2. ⏳ **Accepted**: Documented reason for acceptance
3. 🔧 **Planned**: Scheduled for future fix

No findings should remain in **unaddressed** status.

## Current Status Summary

| Category | Status      | Count |
|----------|-------------|-------|
| Critical | ✅ Resolved | 1/1   |
| High     | ✅ Resolved | 2/2   |
| Medium   | ⚠️ Partial  | 2/3   |
| Low      | ✅ Resolved | 3/4   |

**Overall**: 8/10 findings resolved, 2 accepted with justification

## Next Steps

1. Monitor CI for any new KICS findings
2. Update this document when new findings appear
3. Review accepted findings quarterly to see if they can be resolved
