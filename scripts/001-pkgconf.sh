#!/bin/bash
# pkgconf.sh by fjtrujy

## Download the source code.
REPO_URL="https://github.com/pkgconf/pkgconf"
REPO_FOLDER="pkgconf"
BRANCH_NAME="pkgconf-1.8.0"
if test ! -d "$REPO_FOLDER"; then
	git clone --depth 1 -b $BRANCH_NAME $REPO_URL && cd $REPO_FOLDER || { exit 1; }
else
	cd $REPO_FOLDER && git fetch origin && git reset --hard origin/${BRANCH_NAME} || { exit 1; }
fi

TARGET="psp"
TARG_XTRA_OPTS=""

# Configure the build.
./autogen.sh
./configure \
    --quiet \
    --prefix="$PSPDEV" \
    --program-prefix="$TARGET-" \
    --with-pkg-config-dir="$PSPDEV"/psp/lib/pkgconfig
    $TARG_XTRA_OPTS || { exit 1; }

# Compile and install.
make --quiet -j $PROC_NR clean || { exit 1; }
make --quiet -j $PROC_NR || { exit 1; }
make --quiet -j $PROC_NR install-strip || { exit 1; }
make --quiet -j $PROC_NR clean || { exit 1; }

# Create a symbolic link because some project search by psp-pkg-confif
ln -sf "$PSPDEV/bin/psp-pkgconf" "$PSPDEV/bin/psp-pkg-config" || { exit 1; }