param(
  [string]$Project = "my_thesis_review",
  [string]$ZipUrl = "https://punpiti.github.io/thesis-review-prompt-pack/thesis_review_student_edition.zip"
)

$ErrorActionPreference = "Stop"

if ($Project.Contains("..") -or [System.IO.Path]::IsPathRooted($Project)) {
  throw "Refusing unsafe project name: $Project"
}

$ZipFile = "thesis_review_student_edition.zip"

Invoke-WebRequest -Uri $ZipUrl -OutFile $ZipFile
Expand-Archive -Path $ZipFile -DestinationPath . -Force

Set-Location ".\prompt_packs\thesis_review_student_edition"

$Workspace = Join-Path (Resolve-Path "..\..").Path $Project
New-Item -ItemType Directory -Force -Path $Workspace | Out-Null
Copy-Item -Path ".\workspace_template\*" -Destination $Workspace -Recurse -Force
New-Item -ItemType Directory -Force -Path (Join-Path $Workspace "prompt_pack") | Out-Null
Copy-Item -Path ".\*" -Destination (Join-Path $Workspace "prompt_pack") -Recurse -Force

Write-Host ""
Write-Host "Created thesis review workspace:"
Write-Host "  $Workspace"
Write-Host ""
Write-Host "Next steps:"
Write-Host "  1. Put thesis, references, PDFs, results, and evidence files in:"
Write-Host "     $Workspace\00_inbox\"
Write-Host "  2. Open that workspace in Codex / Claude Code / Antigravity."
Write-Host "  3. Tell the AI:"
Write-Host "     init workspace จากไฟล์รวม"
Write-Host "     เตรียม instruction จากงานปัจจุบัน"
Write-Host "     ประเมิน"
