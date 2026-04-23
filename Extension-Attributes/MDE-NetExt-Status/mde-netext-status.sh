#!/bin/bash
####################################################################################################
# Extension Attribute - MDE NetExt Status
#
# Checks if Microsoft Defender for Endpoint (MDE) Network Extension (NetExt)
# is installed and activated on the Mac.
#
# Returns:
#   - "Activated"           - NetExt is present and fully activated
#   - "Present Not Activated" - NetExt is installed but not yet activated
#   - "Not Present"         - NetExt is not installed at all
####################################################################################################
OUT=$(/usr/bin/systemextensionsctl list 2>&1)

if echo "$OUT" | /usr/bin/grep -qi "com.microsoft.wdav.netext"; then
    if echo "$OUT" | /usr/bin/grep -qi "activated enabled"; then
        echo "<result>Activated</result>"
    else
        echo "<result>Present Not Activated</result>"
    fi
else
    echo "<result>Not Present</result>"
fi
exit 0
