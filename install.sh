#!/bin/bash
# Reimbursement Workflow Skills Installer
# Run: curl -fsSL https://raw.githubusercontent.com/SPARKLE-W/reimbursement-workflow-skills/main/install.sh | bash

SKILLS_DIR="${HOME}/.claude/skills"
REPO="SPARKLE-W/reimbursement-workflow-skills"
RAW_URL="https://raw.githubusercontent.com/${REPO}/main"

echo "Installing Reimbursement Workflow Skills..."
echo "Skills directory: ${SKILLS_DIR}"

# Create skills directory if not exists
mkdir -p "${SKILLS_DIR}"

# Download skill files
SKILL_FILES=(
    "reimbursement-workflow.skill"
    "invoice-renaming.skill"
    "payment-screenshot-renaming.skill"
    "shopping-screenshot-renaming.skill"
    "invoice-matching.skill"
    "docx-generation.skill"
    "verification.skill"
)

for file in "${SKILL_FILES[@]}"; do
    echo "Downloading $file..."
    curl -fsSL "${RAW_URL}/${file}" -o "${SKILLS_DIR}/${file}" && echo "  OK: $file" || echo "  FAIL: $file"
done

echo ""
echo "Installation complete!"
echo "Restart Claude Code to use the skills."
