#!/bin/bash
# psp-pacman.sh by fjtrujy

## Download the source code.
REPO_URL="https://github.com/fjtrujy/psp-pacman"
REPO_FOLDER="psp-pacman"
BRANCH_NAME="master"
if test ! -d "$REPO_FOLDER"; then
	git clone --depth 1 -b $BRANCH_NAME $REPO_URL && cd $REPO_FOLDER || { exit 1; }
else
	cd $REPO_FOLDER && git fetch origin && git reset --hard origin/${BRANCH_NAME} || { exit 1; }
fi

## Determine the maximum number of processes that Make can work with.
PROC_NR=$(getconf _NPROCESSORS_ONLN)

# TODO: Fix PACMAN compilation issues for Windows
OSVER=$(uname)
if [ "${OSVER:0:5}" == MINGW ]; then
	exit 0;
fi

## Compile and install.
./pacman.sh || { exit 1; }
