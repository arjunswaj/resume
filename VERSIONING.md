# Semantic Versioning Guide

This repository now uses semantic versioning for the resume PDF and GitHub Pages site.

## How Versioning Works

The version is stored in `version.txt` and follows semantic versioning (MAJOR.MINOR.PATCH):

- **MAJOR** version: Increment for major changes to resume content (e.g., new job, significant restructuring)
- **MINOR** version: Increment for minor updates (e.g., adding skills, small content updates)
- **PATCH** version: Increment for bug fixes, typos, or formatting improvements

## How to Update Version

1. Edit `version.txt` to the new version (e.g., change `1.0.0` to `1.1.0`)
2. Commit and push the change to the master branch
3. GitHub Actions will automatically:
   - Generate PDF named `resume-v{NEW_VERSION}.pdf`
   - Update the website to show the new version
   - Display the actual last commit date

## Automatic Features

- **PDF Naming**: The compiled PDF is automatically renamed to `resume-v{VERSION}.pdf`
- **Website Display**: The website shows the current version and actual last commit date
- **Consistent Deployment**: Both master and PR workflows handle versioning consistently

## Example

If `version.txt` contains `1.2.3`:
- PDF will be named: `resume-v1.2.3.pdf`
- Website will show: "Version: 1.2.3"
- Download link will point to: `resume-v1.2.3.pdf`
- "Last updated" will show the actual date of the last commit