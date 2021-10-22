#!/bin/sh
# check-pspdev.sh by Naomi Peori (naomi@peori.ca)

## Check if $PSPDEV is set.
if test ! "$PSPDEV"; then { echo "ERROR: Set \$PSPDEV before continuing."; exit 1; } fi
