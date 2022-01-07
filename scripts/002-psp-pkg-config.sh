#!/bin/sh
WORKDIR="${PWD}"

mkdir -p "${PSPDEV}/bin"
install -m755 ../patches/psp-pkg-config "${PSPDEV}/bin" || { exit 1; }
cd "${PSPDEV}/bin"
ln -sf "psp-pkg-config" "psp-pkgconf"
echo "psp-pkg-config installation finished"
