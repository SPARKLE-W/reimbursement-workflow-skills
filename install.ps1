# Reimbursement Workflow Skills Installer
# Run in PowerShell: irm https://raw.githubusercontent.com/SPARKLE-W/reimbursement-workflow-skills/main/install.ps1 | iex

$skillsDir = "$env:USERPROFILE\.claude\skills"
$repo = "SPARKLE-W/reimbursement-workflow-skills"

Write-Host "Installing Reimbursement Workflow Skills..." -ForegroundColor Cyan
Write-Host "Skills directory: $skillsDir"

# Create skills directory if not exists
if (-not (Test-Path $skillsDir)) {
    New-Item -ItemType Directory -Path $skillsDir -Force | Out-Null
}

# Download skill files
$skillFiles = @(
    "reimbursement-workflow.skill",
    "invoice-renaming.skill",
    "payment-screenshot-renaming.skill",
    "shopping-screenshot-renaming.skill",
    "invoice-matching.skill",
    "docx-generation.skill",
    "verification.skill"
)

foreach ($file in $skillFiles) {
    $url = "https://raw.githubusercontent.com/$repo/main/$file"
    $dest = Join-Path $skillsDir $file
    Write-Host "Downloading $file..."
    try {
        Invoke-WebRequest -Uri $url -OutFile $dest -UseBasicParsing
        Write-Host "  OK: $file" -ForegroundColor Green
    } catch {
        Write-Host "  FAIL: $file - $_" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "Installation complete!" -ForegroundColor Green
Write-Host "Restart Claude Code to use the skills."
