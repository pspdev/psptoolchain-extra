#!/bin/sh

mkdir -p "${PSPDEV}/bin"
install -m755 ../patches/psp-pkg-config "${PSPDEV}/bin" || { exit 1; }
ln -srf "${PSPDEV}/bin/psp-pkg-config" "${PSPDEV}/bin/psp-pkgconf"
echo "psp-pkg-config installation finished"

