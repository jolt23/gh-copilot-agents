# Repository Standards

## Required sections for every agent

Each agent should include:

1. Purpose
2. Scope
3. Inputs expected
4. Outputs expected
5. Operating workflow
6. Safety and quality checks
7. Linked skills
8. Example requests
9. Any agent-specific operating guidance needed to do the work well

## Naming

- Use lowercase kebab-case for agent files and skill folders.
- Use concise names that reflect the specialization.
- Prefer stable names that will still make sense as the catalog grows.

## Reuse

- Put reusable knowledge in `skills/`.
- Put shared policies and authoring rules in `instructions/`.
- Keep agent-specific orchestration in the agent file.

## Quality bar

Agents should:

- be explicit about what they do and do not handle
- guide users toward maintainable outcomes
- surface assumptions and validation steps
- prefer secure defaults
- avoid destructive actions unless clearly requested
- stay self-contained when a single file is enough

## Documentation style

- Use short sections and bullet lists.
- Provide concrete examples.
- Make linked skills obvious.
- Keep duplication low.

## Manifest ordering

- Keep entries in `manifests/agents.yaml` sorted alphabetically by `name`.
- Keep entries in `manifests/skills.yaml` sorted alphabetically by `name`.
- Preserve alphabetical ordering whenever adding, removing, or renaming entries.

## README catalog ordering

- Keep `README.md` Agent Catalog entries complete for all active agents.
- Keep Agent Catalog entries sorted alphabetically by agent display name.
- Preserve alphabetical ordering whenever adding, removing, or renaming agents.
