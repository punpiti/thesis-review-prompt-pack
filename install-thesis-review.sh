#!/usr/bin/env bash
set -euo pipefail

project="${1:-${PROJECT:-my_thesis_review}}"
zip_url="${THESIS_REVIEW_ZIP_URL:-https://punpiti.github.io/thesis-review-prompt-pack/thesis_review_student_edition.zip}"
version_url="${THESIS_REVIEW_VERSION_URL:-https://punpiti.github.io/thesis-review-prompt-pack/VERSION.md}"
mode="${THESIS_REVIEW_INSTALL_MODE:-safe}"
remote_version_file=""
install_root="$PWD"
staging_dir="$(mktemp -d)"
zip_file="$staging_dir/thesis_review_student_edition.zip"

cleanup() {
  rm -rf "$staging_dir"
}
trap cleanup EXIT

if [[ "$project" == /* || "$project" == *".."* ]]; then
  echo "Refusing unsafe project name: $project" >&2
  exit 1
fi

extract_version() {
  sed -n 's/^Current version: `\{0,1\}\([^`[:space:]]*\)`\{0,1\}.*/\1/p' "$1" | head -1
}

version_newer() {
  local current="$1"
  local candidate="$2"
  [[ -n "$candidate" ]] || return 1
  [[ -n "$current" ]] || return 0
  [[ "$current" != "$candidate" ]] || return 1
  if command -v sort >/dev/null 2>&1; then
    [[ "$(printf '%s\n%s\n' "$current" "$candidate" | sort -V | tail -1)" == "$candidate" ]]
  else
    [[ "$current" != "$candidate" ]]
  fi
}

download_file() {
  local url="$1"
  local dest="$2"
  if [[ -f "$url" ]]; then
    cp "$url" "$dest"
  elif command -v wget >/dev/null 2>&1; then
    wget -q -O "$dest" "$url"
  elif command -v curl >/dev/null 2>&1; then
    curl -fsL -o "$dest" "$url"
  else
    return 1
  fi
}

workspace_probe="$install_root/$project"
if [[ -e "$workspace_probe" && ! -d "$workspace_probe" ]]; then
  echo "Refusing to install: project path exists and is not a directory: $workspace_probe" >&2
  exit 1
fi
local_version=""
if [[ -f "$workspace_probe/prompt_pack/VERSION.md" ]]; then
  local_version="$(extract_version "$workspace_probe/prompt_pack/VERSION.md")"
fi

remote_version_file="$(mktemp)"
remote_version=""
if download_file "$version_url" "$remote_version_file"; then
  remote_version="$(extract_version "$remote_version_file")"
  if [[ -n "$local_version" && -n "$remote_version" ]]; then
    if version_newer "$local_version" "$remote_version"; then
      echo "New prompt pack version available on GitHub Pages: $remote_version (local: $local_version)"
    elif [[ "$local_version" == "$remote_version" ]]; then
      echo "Prompt pack is already current: $local_version"
    else
      echo "Local prompt pack version ($local_version) is not older than GitHub Pages ($remote_version)."
    fi
  elif [[ -n "$remote_version" ]]; then
    echo "Latest GitHub Pages prompt pack version: $remote_version"
  fi
else
  echo "Could not check remote version at $version_url; continuing with install/update." >&2
  rm -f "$remote_version_file"
  remote_version_file=""
fi

if [[ -f "$zip_url" ]]; then
  cp "$zip_url" "$zip_file"
elif command -v wget >/dev/null 2>&1; then
  wget -O "$zip_file" "$zip_url"
elif command -v curl >/dev/null 2>&1; then
  curl -fL -o "$zip_file" "$zip_url"
else
  echo "Need wget or curl to download $zip_url" >&2
  exit 1
fi

if ! command -v unzip >/dev/null 2>&1; then
  echo "Need unzip to extract $zip_file" >&2
  exit 1
fi

unzip -q "$zip_file" -d "$staging_dir/extracted"
cd "$staging_dir/extracted/prompt_packs/thesis_review_student_edition"

workspace="$install_root/$project"
workspace_exists=0
had_prompt_pack=0
if [[ -d "$workspace" ]]; then
  workspace_exists=1
fi
if [[ -d "$workspace/prompt_pack" ]]; then
  had_prompt_pack=1
fi

mkdir -p "$workspace"

timestamp="$(date +%Y%m%d-%H%M%S)"

if [[ "$workspace_exists" -eq 1 && "$mode" != "overwrite" ]]; then
  echo "Existing workspace detected: $workspace"
  echo "Using safe update mode. Existing workspace files will not be overwritten."
  echo "Set THESIS_REVIEW_INSTALL_MODE=overwrite only if you intentionally want to refresh workspace template files."

  while IFS= read -r src; do
    rel="${src#workspace_template/}"
    dest="$workspace/$rel"
    if [[ -d "$src" ]]; then
      mkdir -p "$dest"
    elif [[ ! -e "$dest" ]]; then
      mkdir -p "$(dirname "$dest")"
      cp "$src" "$dest"
    fi
  done < <(find workspace_template -mindepth 1 | sort)
else
  cp -R workspace_template/. "$workspace/"
fi

if [[ "$had_prompt_pack" -eq 1 ]]; then
  backup="$workspace/prompt_pack_backup_$timestamp"
  mv "$workspace/prompt_pack" "$backup"
  echo "Backed up existing prompt_pack to: $backup"
elif [[ -d "$workspace/prompt_pack" ]]; then
  rm -rf "$workspace/prompt_pack"
fi

mkdir -p "$workspace/prompt_pack"
cp -R . "$workspace/prompt_pack/"

installed_version="$(extract_version VERSION.md)"
if [[ -n "${backup:-}" ]]; then
  update_note="$workspace/PROMPT_PACK_UPDATE_NOTES_$timestamp.md"
  {
    echo "# Prompt Pack Update Notes"
    echo
    echo "- Checked/updated: $(date '+%Y-%m-%d %H:%M:%S')"
    echo "- GitHub Pages version URL: $version_url"
    echo "- Previous local version: ${local_version:-unknown}"
    echo "- Remote version reported before install: ${remote_version:-unknown}"
    echo "- Installed version: ${installed_version:-unknown}"
    echo "- Previous prompt pack backup: $(basename "$backup")"
    echo
    echo "## Preservation Rule"
    echo
    echo "This update replaced only \`prompt_pack/\` and preserved the previous pack backup."
    echo "It did not overwrite thesis/manuscript files, \`04_review_notes/\`,"
    echo "\`00_review_instructions/\`, or existing workspace \`AGENTS.md\` / \`CLAUDE.md\`."
    echo
    echo "## How To Adopt New Concepts"
    echo
    echo "1. Compare \`$(basename "$backup")/VERSION.md\` with \`prompt_pack/VERSION.md\`."
    echo "2. Review new workflow ideas in \`prompt_pack/AGENTS.md\`, \`prompt_pack/CLAUDE.md\`,"
    echo "   \`prompt_pack/workspace_template/AGENTS.md\`, and focused skill folders."
    echo "3. Add only useful new ideas to workspace instructions as a small patch."
    echo "4. Keep local/user-used rules when they conflict unless the user explicitly decides to replace them."
    echo
    echo "## Installed Changelog"
    echo
    sed -n '1,220p' VERSION.md
  } > "$update_note"
  echo "Wrote update notes: $update_note"
fi

if [[ -f "$workspace/PROMPT_PACK_VERSION.md" ]]; then
  {
    echo "# Prompt Pack Version"
    echo
    echo "- Installed prompt pack version: ${installed_version:-unknown}"
    echo "- Previous local prompt pack version: ${local_version:-unknown}"
    echo "- GitHub Pages prompt pack version checked: ${remote_version:-unknown}"
    echo "- GitHub Pages version URL: $version_url"
    echo "- Installed/updated: $(date '+%Y-%m-%d %H:%M:%S')"
    echo "- Install mode: $mode"
    if [[ -n "${backup:-}" ]]; then
      echo "- Previous prompt pack backup: $(basename "$backup")"
      echo "- Update notes: $(basename "$update_note")"
    fi
    echo
    echo "See \`prompt_pack/VERSION.md\` for package changelog."
    echo "Adopt new workflow concepts by reviewing the update notes and patching workspace instructions only after user approval."
  } > "$workspace/PROMPT_PACK_VERSION.md"
fi

if [[ -n "$remote_version_file" ]]; then
  rm -f "$remote_version_file"
fi

cat <<EOF
Created or updated thesis review workspace:
  $workspace

Installed prompt pack version:
  ${installed_version:-unknown}

GitHub Pages version checked:
  ${remote_version:-unknown}

Next steps:
  1. If this is a new workspace, put thesis, references, PDFs, results, and evidence files in:
     $workspace/00_inbox/
  2. If this is an update, open the workspace and ask the AI:
     เช็คเวอร์ชัน prompt_pack กับ GitHub Pages และสรุปแนวคิดใหม่ที่ควรรับเข้ามา โดยห้ามทับสิ่งที่ user เคยใช้แล้ว
  3. For normal review, tell the AI:
     init workspace จากไฟล์รวม
     เตรียม instruction จากงานปัจจุบัน
     ประเมิน
EOF
