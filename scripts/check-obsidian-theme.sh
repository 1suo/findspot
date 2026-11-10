#!/usr/bin/env bash
set -euo pipefail

test -s theme.css
grep -Fq 'id: findspot-palette' theme.css
grep -Fq 'type: class-select' theme.css
grep -Fq 'id: findspot-surfaces-swapped' theme.css
grep -Fq 'type: class-toggle' theme.css

for spec in alexandria:light babylon:dark knossos:light petra:dark tikal:dark troy:dark; do
  slug="\${spec%%:*}"
  mode="\${spec##*:}"
  grep -Fq "body.theme-\${mode}.findspot-palette-\${slug} {" theme.css
  grep -Fq "body.theme-\${mode}.findspot-palette-\${slug} .cm-editor" theme.css
  grep -Fq "body.theme-\${mode}.findspot-palette-\${slug}.findspot-surfaces-swapped {" theme.css
  grep -Fq "body.theme-\${mode}.findspot-palette-\${slug}.findspot-surfaces-swapped .cm-editor" theme.css
done

for variable in --tag-color --tag-color-hover --tag-background --tag-background-hover --tag-border-color; do
  grep -Fq -- "\${variable}:" theme.css
done

if grep -Eq -- "--tag-background: color-mix\\(in srgb, #[0-9a-fA-F]{6} 8[0-9]%, " theme.css; then
  echo "Found an overly saturated tag pill background." >&2
  exit 1
fi

if grep -Eq '^\\.(cm-editor|markdown-rendered)|,[[:space:]]*\\.(cm-editor|markdown-rendered)' theme.css; then
  echo "Found unscoped editor or preview selectors in theme.css" >&2
  exit 1
fi

echo "Obsidian theme package contains six palettes, swapped-surface variants, and readable tag pills."
