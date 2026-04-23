# Script - Install Rosetta 2

## Overview

This script silently installs **Rosetta 2** on Macs with Apple Silicon (M1, M2, M3, M4 chips). Rosetta 2 is a translation layer built by Apple that allows Intel-based apps to run on Apple Silicon Macs. It is required for many legacy applications that have not yet been updated with native Apple Silicon support.

The script includes smart checks, retry logic, and full logging to ensure reliable deployment via Jamf Pro.

---

## Key Features

- Checks if the Mac is running **Apple Silicon** before attempting install
- Skips installation if **Rosetta 2 is already installed** — safe to run multiple times
- Retries installation up to **5 times** if the first attempt fails
- Requires **macOS 11 Big Sur or later**
- Logs all activity to `/Library/Logs/install_rosetta.log`
- Accepts `--help` flag for usage information

---

## How It Works

1. Checks macOS version is 11 or later
2. Detects if the Mac has an Apple Silicon processor via `sysctl`
3. Checks if Rosetta 2 is already installed via `pkgutil`
4. If not installed, runs `softwareupdate --install-rosetta --agree-to-license`
5. Retries up to 5 times if installation fails
6. Logs success or failure to `/Library/Logs/install_rosetta.log`

---

## Requirements

| Requirement | Details |
|---|---|
| **Platform** | macOS 11 Big Sur or later |
| **Processor** | Apple Silicon (M1, M2, M3, M4) |
| **Network** | Internet connection required to download Rosetta 2 |
| **Privileges** | Must run as root (Jamf Pro runs scripts as root by default) |

---

## Jamf Pro Setup

### Step 1 — Add the Script
1. Go to **Settings → Computer Management → Scripts**
2. Click **New**
3. Give it the name `Install Rosetta 2`
4. Paste the contents of `install-rosetta.sh`
5. Click **Save**

### Step 2 — Create a Policy
1. Go to **Computers → Policies** → **New**
2. Under **Scripts**, add `Install Rosetta 2`
3. Set the **Trigger** — recommended options:
   - `Enrollment Complete` — installs Rosetta right after device enrollment
   - `Recurring Check-in` — ensures Rosetta stays installed
4. Set **Execution Frequency** to `Once per computer` (unless using as a check)
5. Scope to **Apple Silicon Macs only** using a Smart Group

### Step 3 — Scope to Apple Silicon Macs (Smart Group)
Create a Smart Group to target only Apple Silicon devices:

| Criteria | Operator | Value |
|---|---|---|
| CPU Type | contains | Apple |

Scope the policy to this Smart Group to avoid running on Intel Macs.

---

## Log File

All activity is logged to:
cat > ~/Desktop/Jamf-macOS-Scripts/Scripts/Install-Rosetta/README.md << 'EOF'
# Script - Install Rosetta 2

## Overview

This script silently installs **Rosetta 2** on Macs with Apple Silicon (M1, M2, M3, M4 chips). Rosetta 2 is a translation layer built by Apple that allows Intel-based apps to run on Apple Silicon Macs. It is required for many legacy applications that have not yet been updated with native Apple Silicon support.

The script includes smart checks, retry logic, and full logging to ensure reliable deployment via Jamf Pro.

---

## Key Features

- Checks if the Mac is running **Apple Silicon** before attempting install
- Skips installation if **Rosetta 2 is already installed** — safe to run multiple times
- Retries installation up to **5 times** if the first attempt fails
- Requires **macOS 11 Big Sur or later**
- Logs all activity to `/Library/Logs/install_rosetta.log`
- Accepts `--help` flag for usage information

---

## How It Works

1. Checks macOS version is 11 or later
2. Detects if the Mac has an Apple Silicon processor via `sysctl`
3. Checks if Rosetta 2 is already installed via `pkgutil`
4. If not installed, runs `softwareupdate --install-rosetta --agree-to-license`
5. Retries up to 5 times if installation fails
6. Logs success or failure to `/Library/Logs/install_rosetta.log`

---

## Requirements

| Requirement | Details |
|---|---|
| **Platform** | macOS 11 Big Sur or later |
| **Processor** | Apple Silicon (M1, M2, M3, M4) |
| **Network** | Internet connection required to download Rosetta 2 |
| **Privileges** | Must run as root (Jamf Pro runs scripts as root by default) |

---

## Jamf Pro Setup

### Step 1 — Add the Script
1. Go to **Settings → Computer Management → Scripts**
2. Click **New**
3. Give it the name `Install Rosetta 2`
4. Paste the contents of `install-rosetta.sh`
5. Click **Save**

### Step 2 — Create a Policy
1. Go to **Computers → Policies** → **New**
2. Under **Scripts**, add `Install Rosetta 2`
3. Set the **Trigger** — recommended options:
   - `Enrollment Complete` — installs Rosetta right after device enrollment
   - `Recurring Check-in` — ensures Rosetta stays installed
4. Set **Execution Frequency** to `Once per computer` (unless using as a check)
5. Scope to **Apple Silicon Macs only** using a Smart Group

### Step 3 — Scope to Apple Silicon Macs (Smart Group)
Create a Smart Group to target only Apple Silicon devices:

| Criteria | Operator | Value |
|---|---|---|
| CPU Type | contains | Apple |

Scope the policy to this Smart Group to avoid running on Intel Macs.

---

## Log File

All activity is logged to:
---

## Possible Outcomes

| Outcome | Meaning |
|---|---|
| `Exit 0` + "Already installed" | Rosetta 2 was already present — no action needed |
| `Exit 0` + "Done!" | Rosetta 2 installed successfully |
| `Exit 1` + "Failed after 5 attempts" | Installation failed — check network and logs |
| `Exit 1` + "Not Apple Silicon" | Script ran on an Intel Mac — check your Smart Group scope |
| `Exit 1` + "macOS version" | macOS is older than 11 — upgrade required |

---

## Notes

- The script automatically agrees to the Rosetta license with `--agree-to-license` — suitable for enterprise deployment
- Safe to run on devices that already have Rosetta installed — it will exit cleanly
- Original script authored by **Kamal Taynaz (@GreatKemo)**, licensed under MIT

---

## Author

Original Script: Kamal Taynaz (@GreatKemo) — ktaynaz@gmail.com
Documented by: Saeid Agheli — Jamf Administrator
https://github.com/saeidagheli88
