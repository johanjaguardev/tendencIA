#!/bin/bash

echo "📋 Creando issues para tendencIA..."
echo ""

# =============================================
# MILESTONE 1: Infrastructure & Setup
# =============================================

# Issue 1.1
gh issue create --title "Configure AnythingLLM on Ally X" \
  --body "## Description
Install and configure AnythingLLM on the ROG Ally X (Windows 11) to serve as the RAG interface for document management.

## Tasks
- [ ] Download AnythingLLM Desktop from official website
- [ ] Install on Windows 11 (standard setup)
- [ ] Configure to connect to local Ollama (\`http://localhost:11434\`)
- [ ] Select \`qwen2.5:7b\` as default model
- [ ] Test basic chat functionality
- [ ] Verify connection works from ThinkPad via Tailscale

## Acceptance Criteria
- AnythingLLM launches without errors on Ally X
- Model selection shows \`qwen2.5:7b\` as available
- Test prompt returns coherent response
- Remote access validated from ThinkPad" \
  --label "infrastructure,ai-models" \
  --milestone "Phase 1 - Infrastructure & Setup"

# Issue 1.2
gh issue create --title "Create SENA Workspace in AnythingLLM" \
  --body "## Description
Create a dedicated workspace in AnythingLLM for all SENA-related document processing and academic work.

## Tasks
- [ ] Open AnythingLLM on Ally X
- [ ] Create new workspace named \"SENA\"
- [ ] Set \`qwen2.5:7b\` as default model for workspace
- [ ] Configure workspace settings (temperature, context length)
- [ ] Test workspace with sample prompt
- [ ] Document workspace configuration

## Acceptance Criteria
- Workspace \"SENA\" exists and is selectable
- Default model is \`qwen2.5:7b\`
- Test prompt works within workspace context
- Settings documented for future reference" \
  --label "ai-models,documentation" \
  --milestone "Phase 1 - Infrastructure & Setup"

# Issue 1.3
gh issue create --title "Setup Document Flow Prompts" \
  --body "## Description
Define and configure the system prompts for the 4-artifact document automation flow in AnythingLLM.

## Tasks
- [ ] Define prompts for each artifact type:
  - [ ] Partial Word document (APA format)
  - [ ] PDF export from Word
  - [ ] Consolidated PDF artifact
  - [ ] Technical Wiki (English translation)
- [ ] Configure APA 7th edition formatting rules
- [ ] Create prompt templates for each output
- [ ] Test with sample content
- [ ] Document prompts in repository

## Acceptance Criteria
- All 4 prompt templates defined
- APA formatting rules applied consistently
- Test output matches expected format
- Prompts documented in \`docs/prompts/\`" \
  --label "ai-models,documentation" \
  --milestone "Phase 1 - Infrastructure & Setup"

# Issue 1.4
gh issue create --title "Validate Connectivity ThinkPad ↔ Ally X" \
  --body "## Description
Verify that all connections between ThinkPad and Ally X are working correctly for development workflow.

## Tasks
- [ ] SSH connection: ThinkPad → Ally X (\`ssh johan-gaming@100.108.163.6\`)
- [ ] Ollama API: \`curl http://100.108.163.6:11434/api/generate\`
- [ ] AnythingLLM access: test web interface from ThinkPad
- [ ] Tailscale connection status: \`tailscale status\`
- [ ] Document connectivity details
- [ ] Create quick reference cheat sheet

## Acceptance Criteria
- SSH works without password (key-based)
- Ollama responds to API calls
- AnythingLLM accessible via browser
- Tailscale shows direct connection
- Cheat sheet created in \`/docs\`" \
  --label "infrastructure,documentation" \
  --milestone "Phase 1 - Infrastructure & Setup"

# =============================================
# MILESTONE 2: Content & Documentation
# =============================================

# Issue 2.1
gh issue create --title "Structure Base Catalog (10-15 Products)" \
  --body "## Description
Define the initial product catalog for the fashion e-commerce store.

## Tasks
- [ ] Define product categories (e.g., shirts, pants, accessories)
- [ ] Create 10-15 product entries with:
  - [ ] Product name
  - [ ] Description (Spanish + English)
  - [ ] Price (COP)
  - [ ] Category
  - [ ] Images (placeholder URLs)
  - [ ] Stock quantity
- [ ] Document catalog structure in JSON/CSV
- [ ] Upload catalog to repository (\`/data/catalog.json\`)
- [ ] Validate against Shopify Storefront API schema

## Acceptance Criteria
- At least 10 products defined
- Catalog stored in structured format
- Products ready for Shopify import
- Documentation includes category hierarchy" \
  --label "content" \
  --milestone "Phase 2 - Content & Documentation"

# Issue 2.2
gh issue create --title "Generate Consolidated APA Artifact" \
  --body "## Description
Consolidate all project documentation into a single APA-formatted document.

## Tasks
- [ ] Gather all existing documentation:
  - [ ] Project context
  - [ ] Bitácoras (session logs)
  - [ ] Technical decisions
  - [ ] Team roles
  - [ ] Timeline
- [ ] Structure document per APA 7th edition
- [ ] Add title page, abstract, introduction
- [ ] Generate Word document (.docx)
- [ ] Export to PDF
- [ ] Upload to repository (\`/docs/artifacts/\`)
- [ ] Link from README

## Acceptance Criteria
- Complete APA document with all sections
- Word and PDF versions available
- Proper citations and references
- Document linked from README" \
  --label "documentation" \
  --milestone "Phase 2 - Content & Documentation"

# Issue 2.3
gh issue create --title "Create Technical Wiki in English" \
  --body "## Description
Set up and populate the GitHub Wiki with technical documentation in English.

## Pages needed
- [ ] Home - Project overview
- [ ] Setup Guide - Environment configuration
- [ ] Architecture - System design
- [ ] Deployment - How to deploy
- [ ] API Reference - Storefront API usage
- [ ] AI Integration - Ollama + AnythingLLM
- [ ] Troubleshooting - Common issues
- [ ] Contributing - How to contribute

## Acceptance Criteria
- Wiki is created in GitHub repository
- All 8 pages populated with content
- Clear navigation between pages
- Links to relevant code and resources" \
  --label "documentation" \
  --milestone "Phase 2 - Content & Documentation"

# Issue 2.4
gh issue create --title "Define Artifact Generation Prompts" \
  --body "## Description
Create the prompt templates that will be used by AnythingLLM to generate the 4 artifacts automatically.

## Prompts needed
- [ ] 1. Word Partial (Spanish, APA format)
  - Template: \`/prompts/word-partial.md\`
- [ ] 2. PDF Partial (from Word)
  - Template: \`/prompts/pdf-export.md\`
- [ ] 3. Consolidated PDF (master document)
  - Template: \`/prompts/consolidated-pdf.md\`
- [ ] 4. Technical Wiki (English translation)
  - Template: \`/prompts/wiki-english.md\`

## Acceptance Criteria
- All 4 prompts defined in separate files
- Stored in \`/prompts/\` directory
- Tested with sample content
- Documented for repeatable use" \
  --label "ai-models,documentation" \
  --milestone "Phase 2 - Content & Documentation"

echo ""
echo "✅ Todos los issues creados exitosamente!"
echo "📊 Verlos en: https://github.com/johanjaguardev/tendencIA/issues"