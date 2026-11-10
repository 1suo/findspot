#!/usr/bin/env bash
set -euo pipefail

test -s theme.css
grep -Fq 'id: findspot-palette' theme.css
grep -Fq 'type: class-select' theme.css

for spec in alexandria:light babylon:dark knossos:light petra:dark tikal:dark troy:dark; do
  slug="${spec%%:*}"
  mode="${spec##*:}"
  grep -Fq "body.theme-${mode}.findspot-palette-${slug} {" theme.css
  grep -Fq "body.theme-${mode}.findspot-palette-${slug} .cm-editor" theme.css
done

if grep -Eq '^\\.(cm-editor|markdown-rendered)|,[[:space:]]*\\.(cm-editor|markdown-rendered)' theme.css; then
  echo "Found unscoped editor or preview selectors in theme.css" >&2
  exit 1
fi

echo "Obsidian theme package contains six scoped palettes."
