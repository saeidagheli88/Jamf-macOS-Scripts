# Extension Attribute - MDE NetExt Status

## Overview

This Jamf Pro Extension Attribute checks whether the **Microsoft Defender for Endpoint (MDE) Network Extension (NetExt)** is installed and activated on a Mac. It uses the macOS `systemextensionsctl` tool to inspect the system extension status and reports the result to Jamf Pro under the **General** section of the computer inventory record.

This is critical for ensuring MDE Network Protection is fully operational across your fleet.

---

## Configuration Details

| Field | Value |
|---|---|
| **Display Name** | MDE NetExt Status |
| **Description** | Checks if Microsoft Defender Network Protection (NetExt) is enabled |
| **Data Type** | String |
| **Inventory Display** | General |
| **Input Type** | Script |
| **Language** | Shell/Bash |
| **Enabled** | Yes |

---

## How It Works

1. Runs `systemextensionsctl list` to get all installed system extensions
2. Checks if `com.microsoft.wdav.netext` is present in the output
3. If present, checks whether it shows `activated enabled`
4. Returns one of three status values to Jamf Pro

---

## Possible Results

| Result | Meaning |
|---|---|
| `Activated` | MDE Network Extension is installed and fully active |
| `Present Not Activated` | MDE Network Extension is installed but not yet activated |
| `Not Present` | MDE Network Extension is not installed on this device |

---

## Jamf Pro Setup

### Step 1 — Create the Extension Attribute
1. Go to **Settings → Computer Management → Extension Attributes**
2. Click **New**
3. Fill in the following:
   - **Display Name:** `MDE NetExt Status`
   - **Description:** `Checks if Microsoft Defender Network Protection (NetExt) is enabled`
   - **Data Type:** `String`
   - **Inventory Display:** `General`
   - **Input Type:** `Script`
   - **Language:** `Shell/Bash`
4. Paste the contents of `mde-netext-status.sh` into the script field
5. Click **Save**

### Step 2 — Trigger Inventory Update
1. Go to **Computers → Policies**
2. Create or use an existing policy with **Inventory Collection** payload
3. Scope to target computers and run

---

## Use Cases

- **Compliance** — verify MDE Network Protection is active on all managed Macs
- **Smart Groups** — group devices by NetExt status for targeted remediation
- **Reporting** — audit MDE deployment health across your fleet
- **Troubleshooting** — identify devices where NetExt is present but not activated

---

## Smart Group Examples

**Devices where NetExt is not activated:**

| Criteria | Operator | Value |
|---|---|---|
| MDE NetExt Status | is not | Activated |

**Devices where NetExt is missing entirely:**

| Criteria | Operator | Value |
|---|---|---|
| MDE NetExt Status | is | Not Present |

---

## Remediation Tips

If a device reports **Present Not Activated**:
- Check that the **System Extension** approval profile has been deployed via Jamf Pro
- Go to **System Settings → Privacy & Security** and look for a blocked extension
- Ensure the PPPC (Privacy Preferences Policy Control) profile allows MDE full disk access

If a device reports **Not Present**:
- Verify the MDE installation package has been deployed via Jamf Pro policy
- Check policy logs for installation errors
- Re-scope the MDE deployment policy to the affected device

---

## Notes

- Uses `systemextens
cat > ~/Desktop/Jamf-macOS-Scripts/Extension-Attributes/MDE-NetExt-Status/README.md << 'EOF'
# Extension Attribute - MDE NetExt Status

## Overview

This Jamf Pro Extension Attribute checks whether the **Microsoft Defender for Endpoint (MDE) Network Extension (NetExt)** is installed and activated on a Mac. It uses the macOS `systemextensionsctl` tool to inspect the system extension status and reports the result to Jamf Pro under the **General** section of the computer inventory record.

This is critical for ensuring MDE Network Protection is fully operational across your fleet.

---

## Configuration Details

| Field | Value |
|---|---|
| **Display Name** | MDE NetExt Status |
| **Description** | Checks if Microsoft Defender Network Protection (NetExt) is enabled |
| **Data Type** | String |
| **Inventory Display** | General |
| **Input Type** | Script |
| **Language** | Shell/Bash |
| **Enabled** | Yes |

---

## How It Works

1. Runs `systemextensionsctl list` to get all installed system extensions
2. Checks if `com.microsoft.wdav.netext` is present in the output
3. If present, checks whether it shows `activated enabled`
4. Returns one of three status values to Jamf Pro

---

## Possible Results

| Result | Meaning |
|---|---|
| `Activated` | MDE Network Extension is installed and fully active |
| `Present Not Activated` | MDE Network Extension is installed but not yet activated |
| `Not Present` | MDE Network Extension is not installed on this device |

---

## Jamf Pro Setup

### Step 1 — Create the Extension Attribute
1. Go to **Settings → Computer Management → Extension Attributes**
2. Click **New**
3. Fill in the following:
   - **Display Name:** `MDE NetExt Status`
   - **Description:** `Checks if Microsoft Defender Network Protection (NetExt) is enabled`
   - **Data Type:** `String`
   - **Inventory Display:** `General`
   - **Input Type:** `Script`
   - **Language:** `Shell/Bash`
4. Paste the contents of `mde-netext-status.sh` into the script field
5. Click **Save**

### Step 2 — Trigger Inventory Update
1. Go to **Computers → Policies**
2. Create or use an existing policy with **Inventory Collection** payload
3. Scope to target computers and run

---

## Use Cases

- **Compliance** — verify MDE Network Protection is active on all managed Macs
- **Smart Groups** — group devices by NetExt status for targeted remediation
- **Reporting** — audit MDE deployment health across your fleet
- **Troubleshooting** — identify devices where NetExt is present but not activated

---

## Smart Group Examples

**Devices where NetExt is not activated:**

| Criteria | Operator | Value |
|---|---|---|
| MDE NetExt Status | is not | Activated |

**Devices where NetExt is missing entirely:**

| Criteria | Operator | Value |
|---|---|---|
| MDE NetExt Status | is | Not Present |

---

## Remediation Tips

If a device reports **Present Not Activated**:
- Check that the **System Extension** approval profile has been deployed via Jamf Pro
- Go to **System Settings → Privacy & Security** and look for a blocked extension
- Ensure the PPPC (Privacy Preferences Policy Control) profile allows MDE full disk access

If a device reports **Not Present**:
- Verify the MDE installation package has been deployed via Jamf Pro policy
- Check policy logs for installation errors
- Re-scope the MDE deployment policy to the affected device

---

## Notes

- Uses `systemextens
cat > ~/Desktop/Jamf-macOS-Scripts/Extension-Attributes/MDE-NetExt-Status/README.md << 'EOF'
# Extension Attribute - MDE NetExt Status

## Overview

This Jamf Pro Extension Attribute checks whether the **Microsoft Defender for Endpoint (MDE) Network Extension (NetExt)** is installed and activated on a Mac. It uses the macOS `systemextensionsctl` tool to inspect the system extension status and reports the result to Jamf Pro under the **General** section of the computer inventory record.

This is critical for ensuring MDE Network Protection is fully operational across your fleet.

---

## Configuration Details

| Field | Value |
|---|---|
| **Display Name** | MDE NetExt Status |
| **Description** | Checks if Microsoft Defender Network Protection (NetExt) is enabled |
| **Data Type** | String |
| **Inventory Display** | General |
| **Input Type** | Script |
| **Language** | Shell/Bash |
| **Enabled** | Yes |

---

## How It Works

1. Runs `systemextensionsctl list` to get all installed system extensions
2. Checks if `com.microsoft.wdav.netext` is present in the output
3. If present, checks whether it shows `activated enabled`
4. Returns one of three status values to Jamf Pro

---

## Possible Results

| Result | Meaning |
|---|---|
| `Activated` | MDE Network Extension is installed and fully active |
| `Present Not Activated` | MDE Network Extension is installed but not yet activated |
| `Not Present` | MDE Network Extension is not installed on this device |

---

## Jamf Pro Setup

### Step 1 — Create the Extension Attribute
1. Go to **Settings → Computer Management → Extension Attributes**
2. Click **New**
3. Fill in the following:
   - **Display Name:** `MDE NetExt Status`
   - **Description:** `Checks if Microsoft Defender Network Protection (NetExt) is enabled`
   - **Data Type:** `String`
   - **Inventory Display:** `General`
   - **Input Type:** `Script`
   - **Language:** `Shell/Bash`
4. Paste the contents of `mde-netext-status.sh` into the script field
5. Click **Save**

### Step 2 — Trigger Inventory Update
1. Go to **Computers → Policies**
2. Create or use an existing policy with **Inventory Collection** payload
3. Scope to target computers and run

---

## Use Cases

- **Compliance** — verify MDE Network Protection is active on all managed Macs
- **Smart Groups** — group devices by NetExt status for targeted remediation
- **Reporting** — audit MDE deployment health across your fleet
- **Troubleshooting** — identify devices where NetExt is present but not activated

---

## Smart Group Examples

**Devices where NetExt is not activated:**

| Criteria | Operator | Value |
|---|---|---|
| MDE NetExt Status | is not | Activated |

**Devices where NetExt is missing entirely:**

| Criteria | Operator | Value |
|---|---|---|
| MDE NetExt Status | is | Not Present |

---

## Remediation Tips

If a device reports **Present Not Activated**:
- Check that the **System Extension** approval profile has been deployed via Jamf Pro
- Go to **System Settings → Privacy & Security** and look for a blocked extension
- Ensure the PPPC (Privacy Preferences Policy Control) profile allows MDE full disk access

If a device reports **Not Present**:
- Verify the MDE installation package has been deployed via Jamf Pro policy
- Check policy logs for installation errors
- Re-scope the MDE deployment policy to the affected device

---

## Notes

- Uses `systemextensionsctl list` which is available on macOS 10.15 Catalina and later
- The extension identifier `com.microsoft.wdav.netext` is specific to Microsoft Defender for Endpoint
- Results are updated every time a Jamf inventory recon runs
- No API credentials or script parameters are required

---

## Author

Saeid Agheli — Jamf Administrator
https://github.com/saeidagheli88
