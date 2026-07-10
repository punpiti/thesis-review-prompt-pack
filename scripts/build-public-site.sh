#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
output_dir="${1:-$repo_root/public}"
allowlist="$repo_root/public-files.txt"

if [[ "$output_dir" == "$repo_root" || "$output_dir" == "/" ]]; then
  echo "Refusing unsafe output directory: $output_dir" >&2
  exit 1
fi

rm -rf "$output_dir"
mkdir -p "$output_dir"

while IFS= read -r entry || [[ -n "$entry" ]]; do
  [[ -z "$entry" || "$entry" == \#* ]] && continue

  source_path="$repo_root/$entry"
  if [[ ! -e "$source_path" ]]; then
    echo "Missing allowlisted public path: $entry" >&2
    exit 1
  fi

  if [[ -L "$source_path" ]] || find "$source_path" -type l -print -quit | grep -q .; then
    echo "Symlinks are not allowed in public content: $entry" >&2
    exit 1
  fi

  mkdir -p "$output_dir/$(dirname "$entry")"
  cp -a "$source_path" "$output_dir/$entry"
done < "$allowlist"

touch "$output_dir/.nojekyll"

if find "$output_dir" -path '*/.ai/*' -o -name '.git' -o -name 'ANTIGRAVITY.md' | grep -q .; then
  echo "Internal-only content reached the public artifact" >&2
  exit 1
fi

echo "Public site staged at: $output_dir"

