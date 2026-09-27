#!/bin/bash
# Start or stop the Systemd Nostalgia video wallpaper.
# theme-set passes the new theme slug as $1. post-boot passes nothing.

set -u

ROOT="$(cd "$(dirname "$(readlink -f "$0")")" && pwd)"
VIDEO="$ROOT/video/wallpaper.mp4"
SLUG="systemd-nostalgia"

requested="${1:-}"
if [[ -z "$requested" ]]; then
  requested="$(cat "${HOME}/.local/state/omarchy/current/theme.name" 2>/dev/null || true)"
fi
requested="$(printf '%s' "$requested" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')"

our_pids() {
  local line pid cmd
  pgrep -af mpvpaper 2>/dev/null | while IFS= read -r line; do
    pid="${line%% *}"
    cmd="${line#* }"
    [[ "$cmd" == *"$VIDEO"* ]] || continue
    printf '%s\n' "$pid"
  done
}

stop_wallpaper() {
  local pid
  while IFS= read -r pid; do
    [[ -n "$pid" ]] || continue
    kill "$pid" 2>/dev/null || true
  done < <(our_pids)
}

if [[ "$requested" != "$SLUG" ]]; then
  stop_wallpaper
  exit 0
fi

if ! command -v mpvpaper >/dev/null 2>&1; then
  echo "systemd-nostalgia: mpvpaper is not installed" >&2
  exit 1
fi

if [[ ! -f "$VIDEO" ]]; then
  echo "systemd-nostalgia: missing video: $VIDEO" >&2
  exit 1
fi

if [[ -n "$(our_pids)" ]]; then
  exit 0
fi

mpv_opts="no-audio --loop-file=inf --panscan=1"
if mpvpaper -f -o "$mpv_opts" ALL "$VIDEO"; then
  exit 0
fi

outputs="$(hyprctl monitors 2>/dev/null | awk '/^Monitor / {printf "%s ", $2}')"
outputs="${outputs% }"
if [[ -z "$outputs" ]]; then
  echo "systemd-nostalgia: no monitor to play on" >&2
  exit 1
fi

mpvpaper -f -o "$mpv_opts" "$outputs" "$VIDEO"
