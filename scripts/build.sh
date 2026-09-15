#!/usr/bin/env bash
# Build distributable bundles into dist/.
#   dist/claude/<skill>.skill     Claude.ai / Claude Desktop: Settings > Skills > upload
#   dist/langdock/<skill>.zip     Langdock: Skills > Add Skill > Upload a skill
#   dist/pmo-skills-plugin.zip    Claude Cowork: Settings > Plugins > upload
# npx skills, Claude Code and Codex install straight from the repo (see README).
set -euo pipefail
cd "$(dirname "$0")/.."

PLUGIN=plugins/pmo-skills
VERSION=$(sed -n 's/.*"version": *"\([^"]*\)".*/\1/p' "$PLUGIN/.claude-plugin/plugin.json")
CODEX_VERSION=$(sed -n 's/.*"version": *"\([^"]*\)".*/\1/p' "$PLUGIN/.codex-plugin/plugin.json")
[[ "$VERSION" == "$CODEX_VERSION" ]] || { echo "error: Claude ($VERSION) and Codex ($CODEX_VERSION) plugin versions differ" >&2; exit 1; }

rm -rf dist && mkdir -p dist/claude dist/langdock

for dir in "$PLUGIN"/skills/*/; do
  name=$(basename "$dir")
  file="$dir/SKILL.md"
  # Frontmatter checks: name matches folder, limits from Claude and Langdock.
  fm_name=$(sed -n '2,/^---$/s/^name: *//p' "$file")
  desc=$(sed -n '2,/^---$/s/^description: *//p' "$file")
  [[ "$fm_name" == "$name" ]] || { echo "error: $file name '$fm_name' != folder '$name'" >&2; exit 1; }
  [[ ${#name} -le 64 ]] || { echo "error: $file name >64 chars" >&2; exit 1; }
  [[ -n "$desc" && ${#desc} -le 1024 ]] || { echo "error: $file description missing or >1024 chars" >&2; exit 1; }

  # One top-level folder per archive; Claude and Langdock both accept this layout.
  (cd "$PLUGIN/skills" && zip -qrX "$OLDPWD/dist/claude/$name.skill" "$name" -x '*.DS_Store')
  cp "dist/claude/$name.skill" "dist/langdock/$name.zip"
  echo "built $name"
done

(cd "$PLUGIN" && zip -qrX "$OLDPWD/dist/pmo-skills-plugin.zip" .claude-plugin skills -x '*.DS_Store')
echo "built pmo-skills-plugin.zip (v$VERSION)"
