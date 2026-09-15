# PMO skills

Five generic skills for IT PMO work. Each is one `SKILL.md`, short enough to read in a minute, written to nudge the model's thinking rather than force a template.

| Skill | Use when |
|---|---|
| `summarize` | Condense a source so nothing can be cut without losing a fact. |
| `report` | Give one reader the overview they need to decide, to know what happened, or to see what is coming. |
| `write-human` | Same content, cleaner text. Last pass for anything that gets sent. |
| `conceptual-model` | Understand a topic from first principles: primitives, relations, boundaries, map, analogy, terms. |
| `shared-understanding` | Present an idea in the format that lets a specific reader hold it. |

Connections are loose: report may use summarize; report, conceptual-model, and shared-understanding end with write-human; shared-understanding hands structure and flow to show-me when that skill is present.

## Install

Skills live in `plugins/pmo-skills/skills/<name>/SKILL.md`. The repo is private; installers use your existing GitHub auth.

| Target | How |
|---|---|
| Any agent (Claude Code, Codex, Cursor, …) | `npx skills add antasar-ai/pmo-skills` (one skill: `--skill report`) |
| Claude Code plugin | `/plugin marketplace add antasar-ai/pmo-skills`, then `/plugin install pmo-skills@antasar-ai` |
| Codex plugin | `codex plugin marketplace add antasar-ai/pmo-skills`, then `codex plugin add pmo-skills@antasar-ai` |
| Claude.ai / Claude Desktop | Upload `<name>.skill` in Settings > Skills |
| Claude Cowork | Upload `pmo-skills-plugin.zip` in Settings > Plugins |
| Langdock | Upload `<name>.zip` in Skills > Add Skill > Upload a skill |
| Manual | Copy a skill folder into `.claude/skills/`, `.agents/skills/`, or equivalent |

Upload files come from the latest [release](https://github.com/antasar-ai/pmo-skills/releases), or build them locally with `scripts/build.sh` (output in `dist/`).

## Release

1. Bump `version` in both `plugins/pmo-skills/.claude-plugin/plugin.json` and `.codex-plugin/plugin.json`.
2. `git tag v1.0.1 && git push --tags`. The release workflow builds and attaches the bundles.

## Layout

```
.claude-plugin/marketplace.json     Claude marketplace (also read by npx skills)
.agents/plugins/marketplace.json    Codex marketplace
plugins/pmo-skills/
  .claude-plugin/plugin.json
  .codex-plugin/plugin.json
  skills/<name>/SKILL.md
scripts/build.sh                    validates frontmatter, builds dist/
```

Codex does not accept a plugin at the marketplace root, so the plugin sits in `plugins/pmo-skills/`.

## Writing rules for this repo

One file per skill. Positive instructions; state the target behaviour, not the ban. No two rules in one file that contradict each other. Menus over templates. Under 100 lines.
