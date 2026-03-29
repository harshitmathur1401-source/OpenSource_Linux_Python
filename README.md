# Python Open Source Audit

## Overview
This repository contains the required artifacts for "The Open Source Audit" Capstone Project, focused entirely on Python. It includes automated shell auditing scripts and a comprehensive technical report documenting Python's origins, licensing, governance, Linux system integration, and ecosystem.

## Repository Structure

- `report.md`: The primary analytical report (16-page target equivalent) on the Python ecosystem.
- `scripts/`: Directory containing 5 robust shell scripts written strictly for Linux.
  - `system_identity.sh`
  - `python_inspector.sh`
  - `python_env_auditor.sh`
  - `pip_log_analyzer.sh`
  - `philosophy_gen.sh`

## Linux Execution Instructions

To execute the audit scripts, follow these step-by-step instructions.

### Prerequisites
These scripts are designed **strictly for Linux architectures**. Running them on macOS or Windows (without WSL) will result in missing paths (like `/usr/lib/python3`). If you are on an incompatible OS, we recommend running a lightweight Linux container via Docker or utilizing a Virtual Machine.

1. **Clone the repository** (if not already local):
   ```bash
   git clone <repo_url>
   cd oss-audit-python
   ```

2. **Navigate to the scripts directory**:
   ```bash
   cd scripts
   ```

3. **Ensure scripts are executable**:
   The scripts have execution permissions, but if they lack them, run:
   ```bash
   chmod +x *.sh
   ```

4. **Run the Audits sequentially**:
   - For System Details: `./system_identity.sh`
   - For Python 3 validation & PEP 20: `./python_inspector.sh`
   - For Environment File Scans (requires root if assessing restricted directories, but standard directories are accessible): `./python_env_auditor.sh`
   - For Log parsing: `./pip_log_analyzer.sh`
   - For Interactive Manifesto Generation: `./philosophy_gen.sh`

## Artifact Verification
All technical outputs and script logs have been analyzed and securely embedded at the conclusion of the `report.md` output as **Walkthrough Artifacts**.
