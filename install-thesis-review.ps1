param(
  [string]$Project = "my_thesis_review",
  [string]$ZipUrl = "https://punpiti.github.io/thesis-review-prompt-pack/thesis_review_student_edition.zip",
  [string]$Mode = $env:THESIS_REVIEW_INSTALL_MODE
)

$ErrorActionPreference = "Stop"

if ($Project.Contains("..") -or [System.IO.Path]::IsPathRooted($Project)) {
  throw "Refusing unsafe project name: $Project"
}

$ZipFile = "thesis_review_student_edition.zip"
if ([string]::IsNullOrWhiteSpace($Mode)) {
  $Mode = "safe"
}

if (Test-Path $ZipUrl) {
  Copy-Item -Path $ZipUrl -Destination $ZipFile -Force
} else {
  Invoke-WebRequest -Uri $ZipUrl -OutFile $ZipFile
}
Expand-Archive -Path $ZipFile -DestinationPath . -Force

Set-Location ".\prompt_packs\thesis_review_student_edition"

$Workspace = Join-Path (Resolve-Path "..\..").Path $Project
$WorkspaceExists = Test-Path $Workspace
New-Item -ItemType Directory -Force -Path $Workspace | Out-Null

if ($WorkspaceExists -and $Mode -ne "overwrite") {
  Write-Host "Existing workspace detected: $Workspace"
  Write-Host "Using safe update mode. Existing workspace files will not be overwritten."
  Write-Host "Set THESIS_REVIEW_INSTALL_MODE=overwrite only if you intentionally want to refresh workspace template files."

  Get-ChildItem ".\workspace_template" -Recurse -Force | ForEach-Object {
    $Relative = $_.FullName.Substring((Resolve-Path ".\workspace_template").Path.Length).TrimStart('\', '/')
    $Destination = Join-Path $Workspace $Relative
    if ($_.PSIsContainer) {
      New-Item -ItemType Directory -Force -Path $Destination | Out-Null
    } elseif (-not (Test-Path $Destination)) {
      New-Item -ItemType Directory -Force -Path (Split-Path $Destination) | Out-Null
      Copy-Item -Path $_.FullName -Destination $Destination
    }
  }
} else {
  Copy-Item -Path ".\workspace_template\*" -Destination $Workspace -Recurse -Force
}

$Timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$PromptPackPath = Join-Path $Workspace "prompt_pack"
if (Test-Path $PromptPackPath) {
  $Backup = Join-Path $Workspace "prompt_pack_backup_$Timestamp"
  Move-Item -Path $PromptPackPath -Destination $Backup
  Write-Host "Backed up existing prompt_pack to: $Backup"
}

New-Item -ItemType Directory -Force -Path (Join-Path $Workspace "prompt_pack") | Out-Null
Copy-Item -Path ".\*" -Destination (Join-Path $Workspace "prompt_pack") -Recurse -Force

$VersionLine = (Get-Content ".\VERSION.md" | Where-Object { $_ -like "Current version:*" } | Select-Object -First 1)
$WorkspaceVersionFile = Join-Path $Workspace "PROMPT_PACK_VERSION.md"
if (Test-Path $WorkspaceVersionFile) {
  @(
    "# Prompt Pack Version",
    "",
    "- Installed prompt pack version: $VersionLine",
    "- Installed/updated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')",
    "- Install mode: $Mode",
    "",
    "See ``prompt_pack/VERSION.md`` for package changelog."
  ) | Set-Content -Path $WorkspaceVersionFile -Encoding UTF8
}

Write-Host ""
Write-Host "Created or updated thesis review workspace:"
Write-Host "  $Workspace"
Write-Host ""
Write-Host "Installed prompt pack version:"
Write-Host "  $VersionLine"
Write-Host ""
Write-Host "Next steps:"
Write-Host "  1. If this is a new workspace, put thesis, references, PDFs, results, and evidence files in:"
Write-Host "     $Workspace\00_inbox\"
Write-Host "  2. If this is an update, open the workspace and ask the AI:"
Write-Host "     เช็คเวอร์ชัน prompt_pack ว่าควรอัปเดต workflow หรือ AGENTS/CLAUDE ใน workspace ไหม โดยห้ามทับ review notes หรือไฟล์ thesis"
Write-Host "  3. For normal review, tell the AI:"
Write-Host "     init workspace จากไฟล์รวม"
Write-Host "     เตรียม instruction จากงานปัจจุบัน"
Write-Host "     ประเมิน"
