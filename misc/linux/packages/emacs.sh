#!/usr/bin/env bash

# BUILD EMACS
# -----------

# Exit on error and print out commands before executing them.
set -euxo pipefail

# Let's set the number of jobs to something reasonable; keep 2 cores
# free to avoid choking the computer during compilation.
JOBS=$(nproc --ignore=2)

# Clone repo locally and get into it.
git clone --depth 1 --branch emacs-29 git://git.savannah.gnu.org/emacs.git
pushd emacs

# Get essential dependencies.
sudo apt install -y build-essential \
    texinfo \
    cmake \
    libtool \
    libgnutls28-dev \
    libjpeg-dev \
    libpng-dev \
    libvterm-dev \
    libtiff5-dev \
    libgif-dev \
    libxpm-dev \
    libncurses-dev \
    libgtk-3-dev \
    libtree-sitter-dev \
    libmagick++-dev
#libwebkit2gtk-4.1-dev

# Get dependencies for gcc-10 and the build process.
sudo apt update -y
sudo apt install -y gcc-11 \
    g++-11 \
    libgccjit0 \
    libgccjit-11-dev \
    autoconf

# Get dependencies for fast JSON.
sudo apt install -y libjansson4 libjansson-dev

# Get GNU Mailutils (protocol-independent mail framework).
sudo apt install -y mailutils

# Enable source packages and get dependencies for whatever
# Emacs version Ubuntu supports by default.
#
# Taken from here:
# https://www.masteringemacs.org/article/speed-up-emacs-libjansson-native-elisp-compilation
#sudo sed -i 's/# deb-src/deb-src/' /etc/apt/sources.list \
#    && apt update \
#    && apt build-dep -y emacs

# Stop debconf from complaining about postfix nonsense.
DEBIAN_FRONTEND=noninteractive

# Needed for compiling libgccjit or we'll get cryptic error messages.
export CC=/usr/bin/gcc-11 CXX=/usr/bin/g++-11

# Configure and run.
# NOTE: binaries should go to /usr/local/bin by default.
#
# Options:
#    --with-native-compilation  ->  use the libgccjit native compiler
#    --with-pgtk                ->  better font rendering
#    --with-x-toolkit=gtk3      ->  widgets toolkit
#    --with-tree-sitter         ->  syntax parsing
#    --with-wide-int            ->  larger file size limit
#    --with-json                ->  fast JSON
#    --with-gnutls              ->  TLS/SSL
#    --without-pop              ->  no pop3 (insecure channels)
#    --with-cairo               ->  vector graphics backend
#    --with-imagemagick         ->  raster images backend
./autogen.sh &&
    ./configure \
        --with-native-compilation \
        --with-pgtk \
        --with-x-toolkit=gtk3 \
        --with-tree-sitter \
        --with-wide-int \
        --with-json \
        --with-modules \
        --with-gnutls \
        --with-cairo \
        --with-imagemagick \
        --without-dbus \
        --without-pop

# Other interesting compilation options:
#
#--prefix=""                    # output binaries location
#--with-mailutils               # e-mail
#--with-x-toolkit=lucid         # supposedly more stable
#--with-xwidgets

# Compiler flags:
# -O2                   ->  Turn on a bunch of optimization flags. There's also -O3, but it increases
#                           the instruction cache footprint, which may end up reducing performance.
# -pipe                 ->  Reduce temporary files to the minimum.
# -mtune=native         ->  Optimize code for the local machine (under ISA constraints).
# -march=native         ->  Enable all instruction subsets supported by the local machine.
# -fomit-frame-pointer  ->  Small functions don't need a frame pointer (optimization).
#
# https://lemire.me/blog/2018/07/25/it-is-more-complicated-than-i-thought-mtune-march-in-gcc/
CFLAGS="-O2 -pipe -mtune=native -march=native -fomit-frame-pointer"

# Build.
# NOTE(abi): NATIVE_FULL_AOT=1 ensures native compilation ahead-of-time for all
#            elisp files included in the distribution.
make -j${JOBS} NATIVE_FULL_AOT=1 &&
    make install

# Return to the original path.
popd

sudo rm -r emacs
