[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/pspdev/psptoolchain-extra/CI?label=CI&logo=github&style=for-the-badge)](https://github.com/pspdev/psptoolchain-extra/actions?query=workflow%3ACI)
[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/pspdev/psptoolchain-extra/CI-Docker?label=CI-Docker&logo=github&style=for-the-badge)](https://github.com/pspdev/psptoolchain-extra/actions?query=workflow%3ACI-Docker)

What does this do?
==================

This program will automatically build and install extra tools
used in the creation of homebrew software for the Sony Playstation Portable
handheld videogame system.

These scripts download (`git clone`) and install:

-   [pkgconf](https://github.com/pkgconf/pkgconf "pkgconf")
-   [psp-pacman](https://github.com/pspdev/psp-pacman "psp-pacman")

How do I use it?
==================

1. Set up your environment by installing the following software:

        bg++/gcc-c++, gcc, git, autoconf, automake, python3, py3-pip, cmake, pkgconfig, libarchive, openssl, gpmdev and libtool

2. Set the PSPDEV and PATH environmental variables:

    ```shell
    export PSPDEV=/usr/local/pspdev
    export PATH=$PATH:$PSPDEV/bin
    ```

    The PSPDEV variable is the directory the toolchain will be installed to,
    change this if you wish. If possible the toolchain script will automatically
    add these variables to your systems login scripts, otherwise you will need
    to manually add these variables yourself.

3. Run the toolchain script:
    ```shell
    ./build-all.sh
    ```