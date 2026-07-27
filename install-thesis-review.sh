#!/usr/bin/env bash
set -euo pipefail

project="${1:-${PROJECT:-my_thesis_review}}"
zip_url="${THESIS_REVIEW_ZIP_URL:-https://punpiti.github.io/thesis-review-prompt-pack/thesis_review_student_edition.zip}"
zip_file="thesis_review_student_edition.zip"
mode="${THESIS_REVIEW_INSTALL_MODE:-safe}"

if [[ "$project" == /* || "$project" == *".."* ]]; then
  echo "Refusing unsafe project name: $project" >&2
  exit 1
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

unzip -o "$zip_file"
cd prompt_packs/thesis_review_student_edition

workspace="$PWD/../../$project"
workspace_exists=0
if [[ -d "$workspace" ]]; then
  workspace_exists=1
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

if [[ -d "$workspace/prompt_pack" ]]; then
  backup="$workspace/prompt_pack_backup_$timestamp"
  mv "$workspace/prompt_pack" "$backup"
  echo "Backed up existing prompt_pack to: $backup"
fi

mkdir -p "$workspace/prompt_pack"
cp -R . "$workspace/prompt_pack/"

if [[ -f "$workspace/PROMPT_PACK_VERSION.md" ]]; then
  {
    echo "# Prompt Pack Version"
    echo
    echo "- Installed prompt pack version: $(sed -n 's/^Current version: //p' VERSION.md | head -1)"
    echo "- Installed/updated: $(date '+%Y-%m-%d %H:%M:%S')"
    echo "- Install mode: $mode"
    echo
    echo "See \`prompt_pack/VERSION.md\` for package changelog."
  } > "$workspace/PROMPT_PACK_VERSION.md"
fi

cat <<EOF
Created or updated thesis review workspace:
  $workspace

Installed prompt pack version:
  $(sed -n 's/^Current version: //p' VERSION.md | head -1)

Next steps:
  1. If this is a new workspace, put thesis, references, PDFs, results, and evidence files in:
     $workspace/00_inbox/
  2. If this is an update, open the workspace and ask the AI:
     เช็คเวอร์ชัน prompt_pack ว่าควรอัปเดต workflow หรือ AGENTS/CLAUDE ใน workspace ไหม โดยห้ามทับ review notes หรือไฟล์ thesis
  3. For normal review, tell the AI:
     init workspace จากไฟล์รวม
     เตรียม instruction จากงานปัจจุบัน
     ประเมิน
EOF
