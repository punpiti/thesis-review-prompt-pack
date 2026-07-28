param(
  [string]$Project = "my_thesis_review",
  [string]$ZipUrl = "https://punpiti.github.io/thesis-review-prompt-pack/thesis_review_student_edition.zip",
  [string]$VersionUrl = "https://punpiti.github.io/thesis-review-prompt-pack/VERSION.md",
  [string]$Mode = $env:THESIS_REVIEW_INSTALL_MODE
)

$ErrorActionPreference = "Stop"

if ($Project.Contains("..") -or [System.IO.Path]::IsPathRooted($Project)) {
  throw "Refusing unsafe project name: $Project"
}

$InstallRoot = (Get-Location).Path
$StagingDirectory = Join-Path ([System.IO.Path]::GetTempPath()) "thesis-review-install-$([guid]::NewGuid().ToString())"
New-Item -ItemType Directory -Path $StagingDirectory | Out-Null
$ZipFile = Join-Path $StagingDirectory "thesis_review_student_edition.zip"
if ([string]::IsNullOrWhiteSpace($Mode)) {
  $Mode = "safe"
}

function Get-PackVersion {
  param([string]$Path)
  if (-not (Test-Path $Path)) {
    return ""
  }
  $Line = Get-Content $Path | Where-Object { $_ -like "Current version:*" } | Select-Object -First 1
  if ($Line -match 'Current version:\s+`?([^`\s]+)`?') {
    return $Matches[1]
  }
  return ""
}

function Test-VersionNewer {
  param([string]$Current, [string]$Candidate)
  if ([string]::IsNullOrWhiteSpace($Candidate)) {
    return $false
  }
  if ([string]::IsNullOrWhiteSpace($Current)) {
    return $true
  }
  if ($Current -eq $Candidate) {
    return $false
  }
  try {
    $CurrentParsed = [version]($Current.TrimStart("v"))
    $CandidateParsed = [version]($Candidate.TrimStart("v"))
    return $CandidateParsed -gt $CurrentParsed
  } catch {
    return $Current -ne $Candidate
  }
}

$WorkspaceProbe = Join-Path $InstallRoot $Project
if ((Test-Path $WorkspaceProbe) -and -not (Test-Path $WorkspaceProbe -PathType Container)) {
  throw "Refusing to install: project path exists and is not a directory: $WorkspaceProbe"
}
$LocalVersion = Get-PackVersion (Join-Path $WorkspaceProbe "prompt_pack\VERSION.md")
$RemoteVersionFile = Join-Path ([System.IO.Path]::GetTempPath()) "thesis-review-version-$([guid]::NewGuid().ToString()).md"
$RemoteVersion = ""

try {
  if (Test-Path $VersionUrl) {
    Copy-Item -Path $VersionUrl -Destination $RemoteVersionFile -Force
  } else {
    Invoke-WebRequest -Uri $VersionUrl -OutFile $RemoteVersionFile
  }
  $RemoteVersion = Get-PackVersion $RemoteVersionFile
  if (-not [string]::IsNullOrWhiteSpace($LocalVersion) -and -not [string]::IsNullOrWhiteSpace($RemoteVersion)) {
    if (Test-VersionNewer $LocalVersion $RemoteVersion) {
      Write-Host "New prompt pack version available on GitHub Pages: $RemoteVersion (local: $LocalVersion)"
    } elseif ($LocalVersion -eq $RemoteVersion) {
      Write-Host "Prompt pack is already current: $LocalVersion"
    } else {
      Write-Host "Local prompt pack version ($LocalVersion) is not older than GitHub Pages ($RemoteVersion)."
    }
  } elseif (-not [string]::IsNullOrWhiteSpace($RemoteVersion)) {
    Write-Host "Latest GitHub Pages prompt pack version: $RemoteVersion"
  }
} catch {
  Write-Warning "Could not check remote version at $VersionUrl; continuing with install/update."
}

if (Test-Path $ZipUrl) {
  Copy-Item -Path $ZipUrl -Destination $ZipFile -Force
} else {
  Invoke-WebRequest -Uri $ZipUrl -OutFile $ZipFile
}
Expand-Archive -Path $ZipFile -DestinationPath (Join-Path $StagingDirectory "extracted") -Force

Set-Location (Join-Path $StagingDirectory "extracted\prompt_packs\thesis_review_student_edition")

$Workspace = Join-Path $InstallRoot $Project
$WorkspaceExists = Test-Path $Workspace
$HadPromptPack = Test-Path (Join-Path $Workspace "prompt_pack") -PathType Container
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
$Backup = ""
$UpdateNote = ""
if ($HadPromptPack) {
  $Backup = Join-Path $Workspace "prompt_pack_backup_$Timestamp"
  Move-Item -Path $PromptPackPath -Destination $Backup
  Write-Host "Backed up existing prompt_pack to: $Backup"
} elseif (Test-Path $PromptPackPath) {
  Remove-Item $PromptPackPath -Recurse -Force
}

New-Item -ItemType Directory -Force -Path (Join-Path $Workspace "prompt_pack") | Out-Null
Copy-Item -Path ".\*" -Destination (Join-Path $Workspace "prompt_pack") -Recurse -Force

$InstalledVersion = Get-PackVersion ".\VERSION.md"

if (-not [string]::IsNullOrWhiteSpace($Backup)) {
  $UpdateNote = Join-Path $Workspace "PROMPT_PACK_UPDATE_NOTES_$Timestamp.md"
  $VersionContent = Get-Content ".\VERSION.md" | Select-Object -First 220
  @(
    "# Prompt Pack Update Notes",
    "",
    "- Checked/updated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')",
    "- GitHub Pages version URL: $VersionUrl",
    "- Previous local version: $(if ($LocalVersion) { $LocalVersion } else { 'unknown' })",
    "- Remote version reported before install: $(if ($RemoteVersion) { $RemoteVersion } else { 'unknown' })",
    "- Installed version: $(if ($InstalledVersion) { $InstalledVersion } else { 'unknown' })",
    "- Previous prompt pack backup: $(Split-Path $Backup -Leaf)",
    "",
    "## Preservation Rule",
    "",
    "This update replaced only ``prompt_pack/`` and preserved the previous pack backup.",
    "It did not overwrite thesis/manuscript files, ``04_review_notes/``,",
    "``00_review_instructions/``, or existing workspace ``AGENTS.md`` / ``CLAUDE.md``.",
    "",
    "## How To Adopt New Concepts",
    "",
    "1. Compare ``$(Split-Path $Backup -Leaf)/VERSION.md`` with ``prompt_pack/VERSION.md``.",
    "2. Review new workflow ideas in ``prompt_pack/AGENTS.md``, ``prompt_pack/CLAUDE.md``,",
    "   ``prompt_pack/workspace_template/AGENTS.md``, and focused skill folders.",
    "3. Add only useful new ideas to workspace instructions as a small patch.",
    "4. Keep local/user-used rules when they conflict unless the user explicitly decides to replace them.",
    "",
    "## Installed Changelog"
  ) + $VersionContent | Set-Content -Path $UpdateNote -Encoding UTF8
  Write-Host "Wrote update notes: $UpdateNote"
}

$WorkspaceVersionFile = Join-Path $Workspace "PROMPT_PACK_VERSION.md"
if (Test-Path $WorkspaceVersionFile) {
  @(
    "# Prompt Pack Version",
    "",
    "- Installed prompt pack version: $(if ($InstalledVersion) { $InstalledVersion } else { 'unknown' })",
    "- Previous local prompt pack version: $(if ($LocalVersion) { $LocalVersion } else { 'unknown' })",
    "- GitHub Pages prompt pack version checked: $(if ($RemoteVersion) { $RemoteVersion } else { 'unknown' })",
    "- GitHub Pages version URL: $VersionUrl",
    "- Installed/updated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')",
    "- Install mode: $Mode",
    $(if (-not [string]::IsNullOrWhiteSpace($Backup)) { "- Previous prompt pack backup: $(Split-Path $Backup -Leaf)" }),
    $(if (-not [string]::IsNullOrWhiteSpace($UpdateNote)) { "- Update notes: $(Split-Path $UpdateNote -Leaf)" }),
    "",
    "See ``prompt_pack/VERSION.md`` for package changelog.",
    "Adopt new workflow concepts by reviewing the update notes and patching workspace instructions only after user approval."
  ) | Set-Content -Path $WorkspaceVersionFile -Encoding UTF8
}

if (Test-Path $RemoteVersionFile) {
  Remove-Item $RemoteVersionFile -Force
}
Set-Location $InstallRoot
Remove-Item $StagingDirectory -Recurse -Force

Write-Host ""
Write-Host "Created or updated thesis review workspace:"
Write-Host "  $Workspace"
Write-Host ""
Write-Host "Installed prompt pack version:"
Write-Host "  $(if ($InstalledVersion) { $InstalledVersion } else { 'unknown' })"
Write-Host ""
Write-Host "GitHub Pages version checked:"
Write-Host "  $(if ($RemoteVersion) { $RemoteVersion } else { 'unknown' })"
Write-Host ""
Write-Host "Next steps:"
Write-Host "  1. If this is a new workspace, put thesis, references, PDFs, results, and evidence files in:"
Write-Host "     $Workspace\00_inbox\"
Write-Host "  2. If this is an update, open the workspace and ask the AI:"
Write-Host "     เช็คเวอร์ชัน prompt_pack กับ GitHub Pages และสรุปแนวคิดใหม่ที่ควรรับเข้ามา โดยห้ามทับสิ่งที่ user เคยใช้แล้ว"
Write-Host "  3. For normal review, tell the AI:"
Write-Host "     init workspace จากไฟล์รวม"
Write-Host "     เตรียม instruction จากงานปัจจุบัน"
Write-Host "     ประเมิน"
