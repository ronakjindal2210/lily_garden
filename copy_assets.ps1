# copy_assets.ps1
# Script to copy video files for Eternal Bloom application

$sourceDir = "C:\Users\prave\Downloads"
$targetDir = "C:\Users\prave\.gemini\antigravity\scratch\eternal-bloom\videos"

# Ensure the target directory exists
if (-not (Test-Path $targetDir)) {
    New-Item -ItemType Directory -Force -Path $targetDir | Out-Null
    Write-Host "Created directory: $targetDir" -ForegroundColor Green
}

# List of scenes
$scenes = 1..15 | ForEach-Object { "scene$_.mp4" }

# Copy each scene
foreach ($scene in $scenes) {
    $sourceFile = Join-Path $sourceDir $scene
    $targetFile = Join-Path $targetDir $scene
    
    if (Test-Path $sourceFile) {
        Copy-Item -Path $sourceFile -Destination $targetFile -Force
        Write-Host "Successfully copied: $scene" -ForegroundColor Green
    } else {
        Write-Host "Warning: Source file not found: $sourceFile" -ForegroundColor Yellow
    }
}

Write-Host "Asset copy process completed." -ForegroundColor Cyan
