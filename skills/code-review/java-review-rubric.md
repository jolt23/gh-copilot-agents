# Java Review Rubric

## Purpose

Provide a concise rubric for reviewing Java changes with focus on correctness, reliability, and maintainability.

## Review dimensions

1. Correctness
- null safety and boundary handling
- exception propagation and diagnostics
- transaction boundary correctness

2. Concurrency and resources
- thread-safety and shared state ownership
- lock and contention risk
- resource lifecycle and timeout handling

3. API and architecture
- clear API contracts and package cohesion
- dependency direction and layering discipline
- avoid unnecessary complexity in abstractions

4. Security
- input validation and injection risks
- authz/authn boundary handling
- sensitive data handling in logs and errors

5. Testing
- failure-path coverage
- deterministic unit and integration behavior
- meaningful assertions and edge-case tests

## Severity guidance

- `critical`: high-probability production failure or security exposure
- `high`: significant correctness or concurrency defect
- `medium`: maintainability/performance issue with moderate impact
- `low`: minor clarity or idiomatic improvement
