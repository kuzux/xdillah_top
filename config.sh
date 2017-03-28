SYSTEM_HEADER_PROJECTS="libc kernel"
PROJECTS="libc kernel"
INITRD_PROJECTS=""

export MAKE=${MAKE:-make}
export HOST=${HOST:x86_64-elf}
 
export AR=~/opt/cross/bin/${HOST}-ar
export AS=~/opt/cross/bin/${HOST}-as
export CC=~/opt/cross/bin/${HOST}-gcc
 
export PREFIX=/usr
export EXEC_PREFIX=$PREFIX
export BOOTDIR=/boot
export LIBDIR=$EXEC_PREFIX/lib
export INCLUDEDIR=$PREFIX/include
export BINDIR=$PREFIX/bin

export XDILLAH_VERSION="0.2-DEV"
export XDILLAH_COMPILE_DATE=`date +%Y-%m-%d:%H:%M:%S`
export XDILLAH_COMPILE_ENV=`uname -a`
export XDILLAH_AUTHOR="kuzux"

export CFLAGS='-O2 -g'
export CPPFLAGS=''
 
# Configure the cross-compiler to use the desired system root.
export CC="$CC --sysroot=$PWD/sysroot"
 
# Work around that the -elf gcc targets doesn't have a system include directory
# because configure received --without-headers rather than --with-sysroot.
if echo "$HOST" | grep -Eq -- '-elf($|-)'; then
  export CC="$CC -isystem=$INCLUDEDIR"
fi
