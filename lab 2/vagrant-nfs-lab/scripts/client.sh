#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
apt-get install -y nfs-common
mkdir -p /mnt/nfs_shared
mount -t nfs 192.168.56.10:/srv/nfs/shared /mnt/nfs_shared
echo "192.168.56.10:/srv/nfs/shared /mnt/nfs_shared nfs defaults 0 0" >> /etc/fstab
echo "Hello from NFS client on $(date)" > /mnt/nfs_shared/client_test_file.txt
