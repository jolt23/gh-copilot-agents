# Go Review Rubric

## Purpose

Define an idiomatic and practical rubric for reviewing Go code with strong focus on correctness, concurrency safety, error handling, and test quality.

## Review dimensions

1. Correctness
- nil safety and boundary conditions
- panic risk and defensive checks
- stable behavior for malformed or partial inputs

2. Error handling
- explicit error returns and propagation
- wrapped errors with `%w` where chaining matters
- meaningful context in error messages

3. Concurrency
- race conditions and shared state ownership
- lock usage and deadlock risk
- goroutine lifecycle, cancellation, and leak prevention
- safe channel close and receive/send behavior

4. Context and timeouts
- proper `context.Context` threading through call chains
- cancellation and deadline handling in I/O and long operations
- no silent context dropping at boundaries

5. API and package design
- clear exported API surface
- cohesive package boundaries and minimal coupling
- naming aligned with Go conventions

6. Performance
- avoid unnecessary allocations in hot paths
- avoid expensive `defer` in critical loops when measurable
- efficient slice and map usage for expected workloads

7. Testing
- table-driven coverage for edge cases
- explicit failure-path tests
- deterministic tests with no flaky timing dependencies
- meaningful assertions over superficial coverage counts

## Severity guidance

- `critical`: correctness/security issue likely to cause production failure or data risk
- `high`: major bug, race, or cancellation defect with high operational impact
- `medium`: maintainability/performance issue with moderate impact
- `low`: readability or minor idiomatic improvement

## Finding template

- `title`
- `severity`
- `category`
- `file`
- `line`
- `evidence`
- `suggested_fix`
- `confidence`
