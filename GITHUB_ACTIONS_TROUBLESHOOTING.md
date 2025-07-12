# GitHub Actions LaTeX CI/CD Troubleshooting Guide

## Issue Resolution

This document outlines the changes made to fix the GitHub Actions LaTeX CI/CD release creation failure.

## Root Cause

The original workflow was failing with a 403 error when creating releases due to:
1. Missing explicit permissions for `contents: write` and `pages: write`
2. Using a fixed "latest" tag that could conflict with existing releases
3. No testing mechanism for release functionality in PRs

## Changes Made

### 1. Enhanced PR Workflow (`build-latex-pr.yml`)

- **Added explicit permissions** for testing release and pages functionality
- **Added test release creation** with PR-specific tags (`test-pr-{PR_NUMBER}`)
- **Added test GitHub Pages deployment** to separate directory
- **Changed job name** from `build-pr` to `build-and-test` to reflect new functionality

Key features:
- Creates draft prerelease for testing
- Deploys to test directory in gh-pages branch
- Uses PR number to avoid conflicts

### 2. Updated Master Workflow (`build-latex-master.yml`)

- **Added explicit permissions** required for release and pages operations
- **Implemented date-based tag strategy** to avoid "latest" tag conflicts
- **Added `make_latest: true`** to ensure the newest release is marked as latest

Key improvements:
- Generates unique tags using timestamp: `release-YYYYMMDD-HHMMSS`
- Proper permissions declaration prevents 403 errors
- Maintains compatibility with existing functionality

### 3. Updated .gitignore

- Added exclusion pattern for test artifacts: `test-pr-*/`

## Testing Strategy

1. **PR Testing**: The enhanced PR workflow allows testing release creation without affecting master
2. **Validation**: Each PR will create a draft release and test pages deployment
3. **Clean-up**: Test releases can be manually deleted after validation

## Repository Settings Requirements

For these workflows to function properly, ensure:

1. **Actions Permissions**: Repository Settings → Actions → General
   - "Read and write permissions" should be enabled, OR
   - Workflows declare explicit permissions (which we've added)

2. **GitHub Pages**: Repository Settings → Pages
   - Should be enabled if pages deployment is desired
   - Source should be set to "Deploy from a branch" → "gh-pages"

## Troubleshooting Checklist

If issues persist, verify:
- [ ] Repository has Actions enabled
- [ ] GITHUB_TOKEN has write permissions
- [ ] GitHub Pages is properly configured (if using pages deployment)
- [ ] No branch protection rules prevent releases
- [ ] Action versions are up to date

## Expected Behavior

### PR Workflow
- Compiles LaTeX to PDF
- Uploads PDF as artifact
- Creates draft release with test tag
- Deploys to test directory in gh-pages

### Master Workflow
- Compiles LaTeX to PDF
- Uploads PDF as artifact
- Creates release with date-based tag
- Marks release as latest
- Deploys to root of gh-pages branch

## Rollback Plan

If these changes cause issues, the workflows can be reverted by:
1. Removing the test steps from PR workflow
2. Reverting master workflow to use "latest" tag
3. Removing explicit permissions (if they cause conflicts)