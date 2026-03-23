# Authoring New Agents

## Agent creation checklist

- Create a new file under `agents/<agent-name>-agent.md`.
- Add the agent's purpose, scope, workflow, guardrails, operating guidance, and example requests to that file.
- Add or reference reusable skills in `skills/`.
- Register the agent in `manifests/agents.yaml`.

## Good agent design

A strong agent is:

- specific enough to be reliable
- broad enough to solve a meaningful class of tasks
- modular enough to reuse shared skills
- documented enough for others to extend it

## Suggested metadata

Include lightweight metadata in a markdown table, such as:

- name
- slug
- domain
- tags
- linked skills
- status

## Prompt design tips

- Start with the mission.
- List the highest-value tasks.
- Define boundaries clearly.
- Encode a repeatable workflow.
- Include quality checks.
- Provide examples of good requests.
