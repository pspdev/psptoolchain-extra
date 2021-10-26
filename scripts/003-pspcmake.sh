#!/bin/bash
# pspcmake.sh by fjtrujy

## Compile and install.
mkdir -p $PSPDEV/psp/share || { exit 1; }
cp ../pspdev.cmake $PSPDEV/psp/share/pspdev.cmake || { exit 1; }
