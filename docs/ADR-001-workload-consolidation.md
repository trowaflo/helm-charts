# ADR-001: Workload Consolidation Architecture Decision

## Status
**Rejected** - Decided to keep separate workload types

## Context
During the development of the common library chart, a proposal was made to consolidate all workload types (Deployment, StatefulSet, Job, CronJob) into a single `workloads` object with a `kind` discriminator field to reduce duplication.

### Current Approach
```yaml
deployment:
  enabled: true
  containers:
    main:
      image: {...}
  podSecurityContext: {...}

statefulsets:
  redis:
    enabled: true
    containers:
      redis:
        image: {...}
    volumeClaimTemplates: [...]
```

### Proposed Consolidation
```yaml
workloads:
  main:
    kind: Deployment
    enabled: true
    containers:
      main:
        image: {...}

  redis:
    kind: StatefulSet
    enabled: true
    containers:
      redis:
        image: {...}
    volumeClaimTemplates: [...]  # StatefulSet-specific
```

## Decision
We decided to **maintain separate workload types** (deployment, statefulsets, jobs, cronjobs) rather than consolidate into a single workloads object.

## Rationale

### Advantages of Separate Types (Current Approach)
1. **Type Safety**: Each workload type has its own schema with type-specific fields clearly defined
2. **Discoverability**: Users can easily see what configuration options are available for each workload type
3. **Validation**: Easier to validate type-specific required fields (e.g., `schedule` for CronJob, `volumeClaimTemplates` for StatefulSet)
4. **Documentation**: helm-docs generates clearer documentation with separate sections per workload type
5. **IDE Support**: Better autocomplete and validation in editors
6. **Semantic Clarity**: Clear intent - a chart with `deployment:` vs `statefulsets:` immediately indicates what's being deployed

### Disadvantages of Consolidation
1. **Mixed Schema**: Type-specific fields (schedule, volumeClaimTemplates, etc.) would be mixed in the same object
2. **Loss of Type Safety**: No guarantee at the values level that required fields for a specific kind are present
3. **Reduced Discoverability**: Harder for users to discover available options
4. **Complex Documentation**: Single large section rather than clear per-type sections
5. **Runtime Validation**: Would require more complex runtime validation instead of schema validation

## Consequences

### What We Keep
- Separate value structures for each workload type
- Clear type-specific field definitions
- Better helm-docs generation
- Better IDE support

### Duplication We Accept
- Pod-level fields (podSecurityContext, nodeSelector, tolerations, affinity) are duplicated
- Container-level logic is already de-duplicated via the `common.helpers.container` template

### How We Mitigate Duplication
1. **Container Template**: The `_container.tpl` template in `manifests/` eliminates all container-level duplication
2. **Common Values Pattern**: Charts can use YAML anchors or the common library's values preparation for shared configurations
3. **Consistent Patterns**: All workloads follow the same structure pattern, making it easy to copy/adapt

## Alternative Considered

### Hybrid Approach
Allow both approaches:
```yaml
# Traditional (preferred for clarity)
deployment:
  enabled: true

# Consolidated (for advanced users)
workloads:
  myapp:
    kind: Deployment
```

**Rejected because**: Adds complexity, confusing to have two ways to define the same thing, harder to maintain.

## References
- Issue: User feedback requesting consolidation to reduce duplication
- Discussion: Repository maintainer analysis of pros/cons
- Related: `_container.tpl` template that successfully eliminates container-level duplication

## Notes
This decision may be revisited if:
- Helm adds native support for discriminated unions in schemas
- User feedback strongly indicates preference for consolidation
- We find a way to maintain type safety with consolidated approach
