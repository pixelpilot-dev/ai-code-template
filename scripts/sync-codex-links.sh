#!/usr/bin/env bash

set -euo pipefail

usage() {
  cat <<'EOF'
Usage: sync-codex-links.sh [--dry-run]

Creates or refreshes symlinks from this repository into ~/.codex:
- AGENTS.md -> ~/.codex/AGENTS.md
- skills/<name> -> ~/.codex/skills/<name>
- agents/<name>.md -> ~/.codex/agents/<name>.md

Existing conflicting files or directories are moved into a timestamped backup
directory inside ~/.codex/backups/ before links are created.

Options:
  --dry-run   Print planned actions without changing anything
  -h, --help  Show this help
EOF
}

DRY_RUN=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run)
      DRY_RUN=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd -P)"
CODEX_ROOT="${CODEX_HOME:-$HOME/.codex}"
SKILLS_SRC="$REPO_ROOT/skills"
AGENTS_SRC="$REPO_ROOT/agents"
AGENTS_MD_SRC="$REPO_ROOT/AGENTS.md"

timestamp="$(date +%Y%m%d-%H%M%S)"
BACKUP_ROOT="$CODEX_ROOT/backups/sync-codex-links-$timestamp"
BACKUP_CREATED=0

log() {
  printf '%s\n' "$*"
}

run() {
  if [[ $DRY_RUN -eq 1 ]]; then
    log "[dry-run] $*"
  else
    "$@"
  fi
}

ensure_dir() {
  local path="$1"
  if [[ ! -d "$path" ]]; then
    run mkdir -p "$path"
  fi
}

ensure_backup_root() {
  if [[ $BACKUP_CREATED -eq 0 ]]; then
    ensure_dir "$BACKUP_ROOT"
    BACKUP_CREATED=1
  fi
}

backup_path_for() {
  local target="$1"
  local rel="${target#/}"
  printf '%s/%s\n' "$BACKUP_ROOT" "$rel"
}

backup_existing() {
  local target="$1"
  local backup_path
  backup_path="$(backup_path_for "$target")"
  ensure_backup_root
  ensure_dir "$(dirname "$backup_path")"
  log "Backing up existing path: $target -> $backup_path"
  run mv "$target" "$backup_path"
}

link_points_into_repo() {
  local target="$1"
  local resolved=""

  if [[ ! -L "$target" ]]; then
    return 1
  fi

  resolved="$(readlink "$target" || true)"
  [[ "$resolved" == "$REPO_ROOT"* ]]
}

remove_stale_repo_links() {
  local dir="$1"

  [[ -d "$dir" ]] || return 0

  while IFS= read -r path; do
    [[ -n "$path" ]] || continue
    if link_points_into_repo "$path" && [[ ! -e "$path" ]]; then
      log "Removing stale repo-managed symlink: $path"
      run rm "$path"
    fi
  done < <(find "$dir" -maxdepth 1 -mindepth 1 -type l | sort)
}

link_one() {
  local src="$1"
  local dst="$2"
  local current_target=""

  if [[ ! -e "$src" ]]; then
    echo "Source does not exist: $src" >&2
    exit 1
  fi

  ensure_dir "$(dirname "$dst")"

  if [[ -L "$dst" ]]; then
    current_target="$(readlink "$dst" || true)"
    if [[ "$current_target" == "$src" ]]; then
      log "Already linked: $dst -> $src"
      return
    fi
    backup_existing "$dst"
  elif [[ -e "$dst" ]]; then
    backup_existing "$dst"
  fi

  log "Linking: $dst -> $src"
  run ln -s "$src" "$dst"
}

main() {
  ensure_dir "$CODEX_ROOT"
  ensure_dir "$CODEX_ROOT/skills"
  ensure_dir "$CODEX_ROOT/agents"

  remove_stale_repo_links "$CODEX_ROOT/skills"
  remove_stale_repo_links "$CODEX_ROOT/agents"

  link_one "$AGENTS_MD_SRC" "$CODEX_ROOT/AGENTS.md"

  while IFS= read -r skill_dir; do
    [[ -n "$skill_dir" ]] || continue
    link_one "$skill_dir" "$CODEX_ROOT/skills/$(basename "$skill_dir")"
  done < <(find "$SKILLS_SRC" -mindepth 1 -maxdepth 1 -type d | sort)

  while IFS= read -r agent_file; do
    [[ -n "$agent_file" ]] || continue
    link_one "$agent_file" "$CODEX_ROOT/agents/$(basename "$agent_file")"
  done < <(find "$AGENTS_SRC" -mindepth 1 -maxdepth 1 -type f -name '*.md' | sort)

  if [[ $DRY_RUN -eq 1 ]]; then
    log "Dry run complete."
  else
    log "Symlink sync complete."
    if [[ $BACKUP_CREATED -eq 1 ]]; then
      log "Backups saved under: $BACKUP_ROOT"
    fi
    log "Restart Codex or open a new chat to ensure new skills and agents are picked up."
  fi
}

main
