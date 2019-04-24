#!/bin/sh

#  Created by John Boiles on 9/21/15.
#
#  This script sets :NSAppTransportSecurity:NSAllowsArbitraryLoads to true in the Info.plist file if NSAPPTRANSPORTSECURITY_ALLOWS_ARBITRARY_LOADS==YES.
#  This enables debugging from https proxies such as Charles.

INFO_PLIST="${TARGET_BUILD_DIR}/${INFOPLIST_PATH}"
PLISTBUDDY="/usr/libexec/PlistBuddy"

if [ "${CONFIGURATION}" == "Debug" ]; then
    $PLISTBUDDY -c "Add :NSAppTransportSecurity dict" "${INFO_PLIST}" || true
    $PLISTBUDDY -c "Add :NSAppTransportSecurity:NSAllowsArbitraryLoads bool true" "${INFO_PLIST}" || true
    $PLISTBUDDY -c "Set :NSAppTransportSecurity:NSAllowsArbitraryLoads true" "${INFO_PLIST}"
else
    $PLISTBUDDY -c "Delete :NSAppTransportSecurity:NSAllowsArbitraryLoads" "${INFO_PLIST}" || true
fi

ALLOWS_ARBITRARY_LOADS_ENABLED=$($PLISTBUDDY -c "Print :NSAppTransportSecurity:NSAllowsArbitraryLoads" "${INFO_PLIST}")
if [ "${ALLOWS_ARBITRARY_LOADS_ENABLED}" == "true" ]; then
    echo "Warning: :NSAppTransportSecurity:NSAllowsArbitraryLoads set to true (potentially insecure)."
fi