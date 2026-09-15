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

Copy a skill folder into your agent's skills directory (`.agents/skills/`, `.claude/skills/`, or equivalent). No dependencies.

## Writing rules for this repo

One file per skill. Positive instructions; state the target behaviour, not the ban. No two rules in one file that contradict each other. Menus over templates. Under 100 lines.
