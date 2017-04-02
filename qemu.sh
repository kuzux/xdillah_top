set -e
. ./build.sh
 
qemu-system-x86_64 -kernel sysroot/boot/kernel -serial stdio
