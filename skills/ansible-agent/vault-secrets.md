# Ansible Vault Secrets Management

## Purpose

Provide reusable guidance for securely creating and managing secrets with Ansible Vault when an external secret store is not available.

## When to use

- external secret managers are unavailable for the target environment
- credentials, API keys, or certificates must be stored in the Ansible repository
- teams need a secure and repeatable vault workflow for local and CI/CD execution

## Guidance

- Default to Ansible Vault for secret-at-rest protection when no external secret store exists.
- Create encrypted files with `ansible-vault create` and edit them with `ansible-vault edit`.
- Encrypt existing files with `ansible-vault encrypt` and avoid committing unencrypted copies.
- Store shared encrypted variables in `group_vars/all/vault.yml` unless they are environment- or group-specific.
- Use per-environment vault files where separation is required (for example by datacenter or cloud group).
- Keep vault password material out of source control and use secure delivery methods (`--vault-id` with password files or prompts).
- Restrict file permissions for vault password files and rotate vault credentials on a defined schedule.
- Use `no_log: true` on tasks handling secret values to prevent leakage into logs.
- Prefer templating and variable references over embedding secret literals directly in tasks.
- Document decryption expectations for operators and CI/CD pipelines.

## Quality checks

- No plaintext secrets are committed to the repository.
- Vault files decrypt successfully in authorized execution contexts only.
- Secret-bearing tasks and outputs are protected with `no_log` where appropriate.
- Secret scope follows least privilege (shared secrets in `group_vars/all`, scoped secrets in specific group files).

## Related agents

- `ansible-playbooks-roles`
