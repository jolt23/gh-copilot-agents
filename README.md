# GitHub Copilot Agents Repository

This repository is a scalable starting point for curating a large catalog of specialized GitHub Copilot agents, reusable skills, and shared instruction sets.

## Goals

- Organize many domain-specific agents in a predictable structure.
- Reuse skills across multiple agents.
- Keep instructions modular and easy to maintain.
- Provide at least one concrete sample agent to demonstrate patterns.

## Repository Layout

```text
.
├── .github/
│   └── copilot-instructions.md
├── agents/
│   ├── <agent-name-1>.md
│   └── <agent-name-2>.md
├── instructions/
│   ├── authoring-agents.md
│   └── repository-standards.md
├── manifests/
│   ├── agents.yaml
│   └── skills.yaml
├── skills/
│   ├── <domain-1>/
│   │   ├── <skill-name-1>.md
│   │   └── <skill-name-2>.md
│   └── <domain-2>/
│       └── <skill-name-3>.md
└── templates/
    ├── agent-template.md
    └── skill-template.md
```

## How to Use This Repo

1. Add a markdown file under `agents/` for each specialized Copilot agent.
2. Place reusable capabilities under `skills/`.
3. Put cross-cutting policies, authoring rules, and repository guidance under `instructions/`.
4. Register every agent and skill in the manifest files for discoverability.
5. Keep each agent self-contained while composing from reusable skills when possible.

## Sample Agent

A sample specialist agent is available under [agents/](agents).

It is intended to help with:

- domain-focused authoring and review tasks
- reusable workflow and quality guidance
- practical examples that can be adapted for new agents

## Recommended Conventions

- One markdown file per agent.
- One markdown file per reusable skill.
- Keep each agent self-contained when practical.
- Prefer small, composable skills over long monolithic prompts.

## Scaling the Catalog

As the repository grows, consider adding:

- tags and ownership metadata
- test fixtures for prompts and expected outputs
- CI validation for manifest consistency
- linting for markdown frontmatter and required sections
- domain folders for cloud, data, security, platform, and developer productivity agents

## Next Suggested Agents

- Kubernetes operations
- Terraform modules
- Python backend modernization
- GitHub Actions workflows
- SQL query tuning
- Incident triage
