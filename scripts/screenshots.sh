#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$root"
mkdir -p screenshots

palettes=(alexandria babylon knossos petra tikal troy)
app_pid=""
config_file=""

cleanup() {
  if [[ -n "${app_pid:-}" ]]; then
    kill "$app_pid" 2>/dev/null || true
    wait "$app_pid" 2>/dev/null || true
    app_pid=""
  fi
  if [[ -n "${config_file:-}" ]]; then
    rm -f "$config_file"
    config_file=""
  fi
}
trap cleanup EXIT

for name in "${palettes[@]}"; do
  cleanup
  config_file="$(mktemp)"
  log_file="/tmp/findspot-$name-alacritty.log"

  # Keep the real palette, but override the window size and launch Neovim
  # through Alacritty's current TOML terminal.shell configuration.
  cat "ports/alacritty/$name.toml" > "$config_file"
  cat >> "$config_file" <<EOF
[window]
dimensions.columns = 108
dimensions.lines = 30
title = "findspot - $name"

[terminal]
shell = { program = "/usr/bin/nvim", args = ["--clean", "-u", "NONE", "--cmd", "set runtimepath^=$root", "-c", "syntax on", "-c", "set number cursorline signcolumn=yes", "-c", "colorscheme findspot-$name", "$root/scripts/showcase.lua"] }
EOF

  alacritty --config-file "$config_file" >"$log_file" 2>&1 &
  app_pid=$!

  # Wait until the actual Alacritty X11 window exists. Never commit a blank
  # root-window capture if the terminal failed to launch.
  window_id=""
  for _ in $(seq 1 30); do
    if ! kill -0 "$app_pid" 2>/dev/null; then
      cat "$log_file"
      echo "Alacritty exited before opening $name" >&2
      exit 1
    fi
    window_id="$(xdotool search --onlyvisible --class Alacritty 2>/dev/null | head -n 1 || true)"
    if [[ -n "$window_id" ]]; then
      break
    fi
    sleep 0.5
  done

  if [[ -z "$window_id" ]]; then
    cat "$log_file"
    echo "No visible Alacritty window found for $name" >&2
    exit 1
  fi

  xdotool windowraise "$window_id" || true
  sleep 1
  import -window "$window_id" "screenshots/$name.png"
  test "$(stat -c%s "screenshots/$name.png")" -gt 10000 || {
    echo "Screenshot for $name is unexpectedly small" >&2
    exit 1
  }
  echo "Captured Alacritty + Neovim: $name"
  cleanup
done
