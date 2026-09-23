#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
apt-get install -y nfs-kernel-server
mkdir -p /srv/nfs/shared
chown -R nobody:nogroup /srv/nfs/shared
chmod 777 /srv/nfs/shared
echo "/srv/nfs/shared 192.168.56.11(rw,sync,no_subtree_check,no_root_squash)" > /etc/exports
exportfs -a
systemctl restart nfs-kernel-server
