# Ansible Review Rubric

## Purpose

Provide a concise rubric for reviewing Ansible changes with focus on idempotency, safety, and maintainability.

## Review dimensions

1. Idempotency and module usage
- avoid shell where a module exists
- avoid tasks that always report changed
- ensure handlers run only when needed

2. Secrets and security
- no plaintext secrets in code or vars
- least-privilege privilege escalation usage
- safe handling of credentials and vault data

3. Variable design
- proper use of defaults, vars, and inventory vars
- clear precedence and environment separation
- avoid hidden coupling across roles

4. Reliability
- deterministic task ordering and dependencies
- safe retries and failure handling
- meaningful tags for selective execution

5. Testing and validation
- syntax-check readiness
- lint readiness
- check mode compatibility where feasible

## Severity guidance

- `critical`: security or execution issue likely to cause outage or compromise
- `high`: major idempotency or correctness issue with operational risk
- `medium`: maintainability issue with moderate risk
- `low`: clarity or minor best-practice improvement
