# Inventory and Variables Design

## Purpose

Provide reusable guidance for organizing Ansible inventories, variable scopes, and environment-specific configuration.

## When to use

- designing a new inventory layout
- debugging variable precedence confusion
- separating role defaults from environment configuration

## Guidance

- Put environment-specific values in inventory-related files.
- Use `group_vars/all` as the default location for variables shared across groups.
- Use group-specific files in `group_vars/` only when variables are specific to those groups.
- Use `group_vars` for shared group configuration and `host_vars` only when necessary.
- Keep role defaults generic and safe.
- Avoid hiding deployment-critical values in deeply nested or surprising locations.
- Call out precedence when moving variables between role defaults, inventory, and extra vars.
- Recommend vault-backed storage for secrets.

## Quality checks

- Variable ownership should be clear.
- Inventory layout should scale to more than one environment.
- Sensitive values should not be stored in plain text.
- Overrides should behave predictably.

## Related agents

- `ansible-playbooks-roles`
