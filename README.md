# log2ram
Like ramlog for systemd on debian 8 jessie

This code is originally based on: https://github.com/azlux/log2ram

The Armbian version (which supports zram) was then merged from: https://github.com/armbian/build/tree/master/packages/bsp/common/usr/lib/armbian

The code was then altered to use overlayfs which allows us to only keep unmodified files in RAM

The default code uses zram for the filesystem, but I prefer using a zram swap (https://github.com/novaspirit/rpi_zram) along with tmpfs as this
provides a more efficient RAM usage (no filesystem overhead, deleted files are gauranteed to be freed from memory,...)
