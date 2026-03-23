# Ansible Role Authoring

## Purpose

Provide reusable guidance for turning automation into maintainable, shareable Ansible roles.

## When to use

- extracting repeated logic from playbooks
- creating a new role from scratch
- reviewing an existing role for maintainability

## Guidance

- Keep role logic in `roles/` and keep inventory data in `inventories/`; do not place inventory data inside roles.
- Create new roles using the standard Ansible Galaxy process (`ansible-galaxy init <role_name>` in the `roles/` directory).
- Use the standard role directory layout unless there is a strong reason not to.
- Keep `defaults/main.yml` for user-overridable settings.
- Avoid overusing `vars/main.yml` for values that environments may need to change.
- Break large task sequences into smaller files when it improves readability.
- Put service restart logic in handlers.
- Keep templates narrowly scoped and well named.
- Document required variables, supported platforms, and dependencies.
- Create root-level role documentation (for example `README.md`) for every role.
- Ensure role documentation includes: role description, requirements, variables, dependencies, usage examples, and author/maintainer.
- Build and maintain role metadata in `meta/main.yml`, and update it whenever role behavior, platforms, or dependencies change.
- Develop tests for every role and treat test coverage as mandatory, not optional.

## Quality checks

- Collection metadata is complete and accurate.
- The role should expose a clear interface through defaults.
- Internal task files should have coherent responsibilities.
- Handlers should be predictable and not duplicated unnecessarily.
- Dependencies and assumptions should be explicit.
- Root-level role documentation should exist and stay aligned with current role behavior and interfaces.
- Every role should include and pass role-level tests before promotion or release.

## Related agents

- `ansible-playbooks-roles`
