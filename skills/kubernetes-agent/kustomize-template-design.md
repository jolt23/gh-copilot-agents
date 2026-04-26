# Kustomize Template Design

## Purpose

Provide reusable guidance for building Kubernetes configurations with kustomize using a clear per-application structure with shared base resources and environment overlays.

## When to use

- creating a new Kubernetes configuration layout with kustomize
- organizing manifests by application and environment
- refactoring existing manifests into base and overlays
- reviewing whether environment settings are placed correctly

## Guidance

- Organize configurations per application under a dedicated directory.
- Use this structure for each application:

```text
kustomize/
  <application-name>/
    base/
      kustomization.yaml
      deployment.yaml
      service.yaml
      configmap.yaml
    overlays/
      dev/
        kustomization.yaml
        patch-*.yaml
      staging/
        kustomization.yaml
        patch-*.yaml
      prod/
        kustomization.yaml
        patch-*.yaml
```

- Keep `base/` for shared resources that should be common across environments.
- Keep overlay directories for target environment variables and environment-specific settings.
- Keep overlays focused on differences such as image tags, replica counts, hostnames, and resource limits.
- Avoid copying complete base manifests into overlays; prefer patches and kustomize transformers.
- Keep each overlay `kustomization.yaml` referencing `../../base` plus only required environment assets.
- If an application has many environment variables, prefer generated or referenced config resources scoped by overlay.

## Quality checks

- Every application should have a clear `base/` and `overlays/` split.
- Overlay configuration should represent target environment-specific values only.
- Rendered output should be deterministic for each overlay and free of missing references.
- Resource identity and selectors should remain valid after overlays are applied.

## Related agents

- `kubernetes-configurations`
