# Ansible Playbook Design

## Purpose

Provide reusable guidance for structuring Ansible playbooks that are readable, safe, and operationally maintainable.

## When to use

- creating a new playbook
- reviewing a playbook for structure and clarity
- deciding whether logic belongs in a playbook or a role

## Guidance

- Keep each play focused on a clear operational goal.
- Use descriptive names for plays and tasks.
- Prefer Ansible modules over `shell` and `command` unless there is a real limitation.
- Group notifications through handlers instead of restarting services inline.
- Use tags to support scoped execution during operations.
- Keep variable sources obvious and avoid duplicating the same values across files.
- Reserve templates and files for artifacts that truly need them.

## Quality checks

- Tasks should be idempotent when feasible.
- Handlers should only run on actual change.
- Variables should be traceable to a sensible scope.
- The playbook should be testable with syntax check and check mode.

## Related agents

- `ansible-playbooks-roles`
