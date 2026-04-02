#!/usr/bin/env bash
# setup-agents.sh
# Creates ~/.copilot/agents/ symlinks for every active agent defined in manifests/agents.yaml.
# Run from the root of your cloned jolt23/gh-copilot-agents repository.
#
# Usage:
#   ./scripts/setup-agents.sh              # create/update all symlinks
#   ./scripts/setup-agents.sh --dry-run    # preview without making changes
#   ./scripts/setup-agents.sh --remove     # remove all managed symlinks

set -euo pipefail

# ── Configuration ────────────────────────────────────────────────────────────
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
AGENTS_DIR="${HOME}/.copilot/agents"
MANIFEST="${REPO_ROOT}/manifests/agents.yaml"
DRY_RUN=false
REMOVE=false

# ── Colour helpers ────────────────────────────────────────────────────────────
GREEN='\033[0;32m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; NC='\033[0m'
info()    { echo -e "${GREEN}[info]${NC}  $*"; }
warn()    { echo -e "${YELLOW}[warn]${NC}  $*"; }
error()   { echo -e "${RED}[error]${NC} $*" >&2; }

# ── Argument parsing ──────────────────────────────────────────────────────────
for arg in "$@"; do
  case "$arg" in
    --dry-run) DRY_RUN=true ;;
    --remove)  REMOVE=true  ;;
    *) error "Unknown argument: $arg"; exit 1 ;;
  esac
done

$DRY_RUN && warn "Dry-run mode — no changes will be made."

# ── Dependency check ──────────────────────────────────────────────────────────
if ! command -v yq &>/dev/null; then
  error "'yq' is required to parse agents.yaml."
  echo  "  Install via: brew install yq   OR   pip install yq"
  exit 1
fi

# ── Sanity checks ─────────────────────────────────────────────────────────────
[[ -f "$MANIFEST" ]]   || { error "Manifest not found: $MANIFEST"; exit 1; }
[[ -d "$REPO_ROOT/agents" ]] || { error "agents/ directory not found in repo root: $REPO_ROOT"; exit 1; }

# ── Create target directory ───────────────────────────────────────────────────
if [[ ! -d "$AGENTS_DIR" ]]; then
  if $DRY_RUN; then
    warn "Would create directory: $AGENTS_DIR"
  else
    mkdir -p "$AGENTS_DIR"
    info "Created directory: $AGENTS_DIR"
  fi
fi

# ── Read agents from manifest ─────────────────────────────────────────────────
# yq outputs lines of: <path>|<status>
AGENT_ENTRIES=()
while IFS= read -r entry; do
  AGENT_ENTRIES+=("$entry")
done < <(yq e '.agents[] | .path + "|" + .status' "$MANIFEST")

created=0; skipped=0; removed=0; errors=0

for entry in "${AGENT_ENTRIES[@]}"; do
  agent_path="${entry%%|*}"   # e.g. agents/ansible-agent.md
  status="${entry##*|}"        # e.g. active

  # Only wire up active agents
  if [[ "$status" != "active" ]]; then
    warn "Skipping inactive agent: $agent_path (status=$status)"
    (( skipped++ )) || true
    continue
  fi

  # Derive names
  filename="$(basename "$agent_path" .md)"           # ansible-agent
  symlink_name="${filename}.agent.md"                 # ansible-agent.agent.md
  symlink_path="${AGENTS_DIR}/${symlink_name}"        # ~/.copilot/agents/ansible-agent.agent.md
  real_target="${REPO_ROOT}/${agent_path}"            # /abs/path/to/repo/agents/ansible-agent.md

  # Validate the source file exists
  if [[ ! -f "$real_target" ]]; then
    error "Agent file not found (skipping): $real_target"
    (( errors++ )) || true
    continue
  fi

  # ── Remove mode ──────────────────────────────────────────────────────────
  if $REMOVE; then
    if [[ -L "$symlink_path" ]]; then
      if $DRY_RUN; then
        warn "Would remove symlink: $symlink_path"
      else
        rm "$symlink_path"
        info "Removed: $symlink_path"
      fi
      (( removed++ )) || true
    else
      warn "No symlink to remove at: $symlink_path"
    fi
    continue
  fi

  # ── Create / update mode ─────────────────────────────────────────────────
  if [[ -L "$symlink_path" ]]; then
    existing_target="$(readlink "$symlink_path")"
    if [[ "$existing_target" == "$real_target" ]]; then
      info "Up to date: $symlink_name → $real_target"
      (( skipped++ )) || true
      continue
    else
      warn "Updating stale symlink: $symlink_name"
      warn "  was → $existing_target"
      warn "  now → $real_target"
      if ! $DRY_RUN; then rm "$symlink_path"; fi
    fi
  elif [[ -e "$symlink_path" ]]; then
    error "Path exists but is not a symlink — skipping: $symlink_path"
    (( errors++ )) || true
    continue
  fi

  if $DRY_RUN; then
    warn "Would create: $symlink_path → $real_target"
  else
    ln -s "$real_target" "$symlink_path"
    info "Created: $symlink_name → $real_target"
  fi
  (( created++ )) || true
done

# ── Summary ───────────────────────────────────────────────────────────────────
echo ""
echo "────────────────────────────────────────"
if $REMOVE; then
  echo -e "  Removed : ${removed}"
else
  echo -e "  Created : ${created}"
  echo -e "  Up to date: ${skipped}"
fi
[[ $errors -gt 0 ]] && echo -e "  ${RED}Errors  : ${errors}${NC}"
echo "────────────────────────────────────────"
