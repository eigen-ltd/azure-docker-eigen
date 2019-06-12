#!/bin/bash
# This script is necessary to set up the data disk that will
# be passed into the docker instance and used as the
# mount point for the data.

# The ARM script only mounts a single data disk.  It is safe
# to assume that on a new VM, this data disk is located at /dev/sdc.

# If you have a more complicated setup, then do examine what this
# script is doing and modify accordingly.

# Install the LVM utilities
yum install lvm2

# Prepare the physical volumes
pvcreate /dev/sdc

# Create a volume group. In this example we are calling the volume group data-vg01:
vgcreate dockervg /dev/sdc

dockervg
# Create the logical volume logical volume called data-lv01 
#lvcreate --extents 100%FREE  --name data-lv01 data-vg01
lvcreate -n docker--storage -L 20G dockervg
lvcreate -n docker--workspaces -L 10G dockervg

# Format the logical volume
mkfs -t ext4 /dev/data-vg01/dockervg

# Create the desired mount point for your new file system
mkdir /var/lib/docker-workspaces
# mount the disk
# mount /dev/sdc1 /data/
mount /dev/dockervg/docker--storage /var/lib/docker
mount /dev/dockervg/docker--workspaces /var/lib/docker-workspaces

# add mount to /etc/fstab to persist across reboots
#echo "/dev/data-vg01/data-lv01    /data/    ext4    defaults 0 2" >> /etc/fstab
echo "/dev/dockervg/docker--storage    /var/lib/docker    ext4    defaults,nofail 1 2" >> /etc/fstab
echo "/dev/dockervg/docker--workspaces     /var/lib/docker-workspaces    ext4    defaults,nofail 1 2" >> /etc/fstab
