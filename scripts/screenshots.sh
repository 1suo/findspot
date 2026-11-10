#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$root"
mkdir -p screenshots

palettes=(alexandria babylon knossos petra tikal troy)

cleanup() {
  if [[ -n "${app_pid:-}" ]]; then
    kill "$app_pid" 2>/dev/null || true
    wait "$app_pid" 2>/dev/null || true
  fi
}
trap cleanup EXIT

for name in "${palettes[@]}"; do
  cleanup
  app_pid=""
  alacritty \
    --config-file "$root/ports/alacritty/$name.toml" \
    --dimensions 108 30 \
    --title "findspot — $name" \
    -e nvim --clean -u NONE \
      --cmd "set runtimepath^=$root" \
      -c "syntax on" \
      -c "set number cursorline signcolumn=yes" \
      -c "colorscheme findspot-$name" \
      "$root/scripts/showcase.lua" &
  app_pid=$!

  # Capture the actual terminal emulator after Neovim has painted its TUI.
  sleep 3
  import -window root "screenshots/$name.png"
  echo "Captured Alacritty + Neovim: $name"
  cleanup
  app_pid=""
done
