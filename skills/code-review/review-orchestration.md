# Review Orchestration

## Purpose

Provide a repeatable workflow for coordinating multiple specialized review agents and producing one consolidated report with consistent severity, categories, and remediation guidance.

## When to use

- when a repository contains multiple languages
- when one review must combine language-specific and cross-cutting findings
- when users need a single prioritized result for triage or release gates

## Inputs

- pull request diff or changed file list (default)
- optional full-repository scope only when completeness review is explicitly requested
- available specialist agents
- review priority (correctness, security, maintainability, performance, testing)
- threshold policy (for example: block on high+)

## Workflow

1. Default to pull request scope and expand to full completeness review only when explicitly instructed.
2. Partition review scope by language and component ownership.
3. Map each partition to one specialist agent.
4. Request results in a shared findings schema.
5. Merge and deduplicate findings based on issue identity and evidence overlap.
6. Normalize severity and category labels.
7. Sort findings by severity (`critical` -> `high` -> `medium` -> `low`).
8. Produce a concise final report with remediation sequence.

## Findings schema

Each finding should include:

- `id`
- `title`
- `severity` (`critical`, `high`, `medium`, `low`)
- `category` (`bug`, `security`, `performance`, `maintainability`, `testing`)
- `file`
- `line`
- `evidence`
- `suggested_fix`
- `confidence`
- `source_agent`

## Merge rules

- Keep one canonical finding for duplicates; merge supporting evidence.
- If severity conflicts, keep the higher severity and note discrepancy.
- Prefer precise findings with direct file and line evidence.
- Remove low-confidence findings lacking actionable next steps.

## Output format

- summary: top risks and recommended fix order
- findings: concise normalized list sorted by severity then confidence
- assumptions: missing context that could affect conclusions
- validation: tests or checks to run before merge/release
