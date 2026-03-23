# Ansible Collection Authoring

## Purpose

Provide reusable guidance for creating and maintaining Ansible Collections using clear structure, versioning discipline, and publishable quality standards.

## When to use

- creating a new Ansible Collection
- organizing reusable plugins, modules, roles, and docs for distribution
- preparing a collection for internal or public publication

## Guidance

- Create collections using the standard Ansible Galaxy process and naming conventions (`ansible-galaxy collection init <namespace>.<collection_name>`).
- Keep the namespace and collection name stable and meaningful for long-term reuse.
- Follow standard collection structure (`plugins/`, `roles/`, `playbooks/`, `docs/`, `meta/`, and tests as appropriate).
- Keep modules and plugins focused, documented, and backward compatible where practical.
- Use semantic versioning and maintain a clear changelog for release consumers.
- Define dependencies explicitly in collection metadata and avoid unnecessary coupling.
- Include examples that demonstrate real usage patterns of modules, roles, and plugins.
- Create root-level collection documentation (for example `README.md`) for every collection.
- Ensure collection documentation includes: collection description, requirements, variables, dependencies, usage examples, and author/maintainer.
- Validate with linting and sanity checks before release.
- Prefer secure defaults in modules and avoid exposing secrets in outputs or logs.

## Quality checks

- Collection metadata is complete and accurate.
- Directory structure follows standard collection conventions.
- Public interfaces are documented and examples execute as expected.
- Versioning, dependencies, and release notes are consistent.
- Root-level collection documentation should exist and stay aligned with current collection capabilities.

## Related agents

- `ansible-playbooks-roles`
