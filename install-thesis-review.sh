#!/usr/bin/env bash
set -euo pipefail

project="${1:-${PROJECT:-my_thesis_review}}"
zip_url="${THESIS_REVIEW_ZIP_URL:-https://punpiti.github.io/thesis-review-prompt-pack/thesis_review_student_edition.zip}"
zip_file="thesis_review_student_edition.zip"

if [[ "$project" == /* || "$project" == *".."* ]]; then
  echo "Refusing unsafe project name: $project" >&2
  exit 1
fi

if command -v wget >/dev/null 2>&1; then
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
mkdir -p "$workspace"
cp -R workspace_template/. "$workspace/"
mkdir -p "$workspace/prompt_pack"
cp -R . "$workspace/prompt_pack/"

cat <<EOF
Created thesis review workspace:
  $workspace

Next steps:
  1. Put thesis, references, PDFs, results, and evidence files in:
     $workspace/00_inbox/
  2. Open that workspace in Codex / Claude Code / Antigravity.
  3. Tell the AI:
     init workspace จากไฟล์รวม
     เตรียม instruction จากงานปัจจุบัน
     ประเมิน
EOF
