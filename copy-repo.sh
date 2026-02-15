#!/usr/bin/env bash
#
# copy-repo.sh — Copy a GitHub repo's contents into the current directory
#                (excluding .git directory).
#
# Usage:  copy-repo.sh <repo-url> [branch]

set -euo pipefail

[[ $# -lt 1 ]] && { echo "Usage: $(basename "$0") <repo-url> [branch]"; exit 1; }

REPO_URL="$1"
BRANCH="${2:-}"

command -v git >/dev/null 2>&1 || { echo "Error: git is required." >&2; exit 1; }

TMPDIR="$(mktemp -d)"
trap 'rm -rf "$TMPDIR"' EXIT

echo "⏳ Cloning $REPO_URL …"
CLONE_ARGS=(--depth 1)
[[ -n "$BRANCH" ]] && CLONE_ARGS+=(--branch "$BRANCH")
git clone "${CLONE_ARGS[@]}" "$REPO_URL" "$TMPDIR" || { echo "Error: Clone failed." >&2; exit 1; }

rm -rf "$TMPDIR/.git"

echo "📂 Copying to $(pwd) …"
cp -a "$TMPDIR"/. ./

echo "✅ Done."
