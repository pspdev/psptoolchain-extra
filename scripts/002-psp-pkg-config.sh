#!/bin/sh

mkdir -p "${PSPDEV}/bin"
install -m755 ../patches/psp-pkg-config "${PSPDEV}/bin" || { exit 1; }
cd "${PSPDEV}/bin"
ln -sf "psp-pkg-config" "psp-pkgconf" || { exit 1; }
echo "psp-pkg-config installation finished"
