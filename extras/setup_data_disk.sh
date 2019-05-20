#!/bin/bash

# This script is necessary to set up the data disk that will
# be passed into the docker instance and used as the 
# mount point for the data.

# The ARM script only mounts a single data disk.  It is safe 
# to assume that on a new VM, this data disk is located at /dev/sdc.

# If you have a more complicated setup, then do examine what this
# script is doing and modify accordingly.

# create a partition table for the disk
parted -s /dev/sdc mklabel msdos

# create a single large partition
parted -s /dev/sdc mkpart primary ext4 0\% 100\%

# install the file system
mkfs.ext4 /dev/sdc1

# create the mount point
mkdir /docker-storage

# mount the disk
sudo mount /dev/sdc1 /docker-storage/

# add mount to /etc/fstab to persist across reboots
echo "/dev/sdc1    /docker-storage/    ext4    defaults 0 0" >> /etc/fstab

# create a partition table for the disk
parted -s /dev/sdc mklabel msdos

# create a single large partition
parted -s /dev/sdc mkpart primary ext4 0\% 100\%

# install the file system
mkfs.ext4 /dev/sdc2

# create the mount point
mkdir /docker-workspaces

# mount the disk
sudo mount /dev/sdc1 /docker-workspaces/

# add mount to /etc/fstab to persist across reboots
echo "/dev/sdc2    /docker-workspaces/    ext4    defaults 0 0" >> /etc/fstab