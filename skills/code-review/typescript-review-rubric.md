# TypeScript Review Rubric

## Purpose

Provide a concise rubric for reviewing TypeScript changes with focus on type safety, runtime correctness, and maintainability.

## Review dimensions

1. Type safety
- avoid unsafe `any` and unchecked casts
- ensure narrowing is sound and explicit
- keep public type contracts stable

2. Runtime correctness
- validate external input at boundaries
- robust async and promise error handling
- avoid hidden runtime assumptions

3. API and module design
- clear interfaces and module boundaries
- predictable error and return shapes
- avoid circular dependencies and tight coupling

4. Security and data handling
- sanitize untrusted input
- avoid leaking sensitive data in logs
- review auth and permission checks where applicable

5. Testing
- edge-case and failure-path coverage
- deterministic async tests
- assertions aligned with runtime behavior

## Severity guidance

- `critical`: production-risk defect or security exposure
- `high`: major type/runtime correctness issue
- `medium`: maintainability or moderate reliability issue
- `low`: minor clarity or style-level improvement
