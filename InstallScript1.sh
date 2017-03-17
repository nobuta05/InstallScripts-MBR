#!/bin/bash

loadkeys jp106

# /boot: /dev/sda1
# /: /dev/sda2
sfdisk /dev/sda < disk.layout

# cryptsetup
cryptsetup luksFormat /dev/sda2
cryptsetup open --type luks /dev/sda2 lvm

pvcreate /dev/mapper/lvm
vgcreate arch /dev/mapper/lvm
lvcreate -L 2G arch -n swap
lvcreate -l 100%FREE arch -n root

mkfs.ext4 /dev/sda1
mkfs.ext4 /dev/mapper/arch-root
mkswap /dev/mapper/arch-swap
swapon /dev/mapper/arch-swap
mount /dev/mapper/arch-root /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

cp /etc/pacman.d/mirrorlist ~/mirror.bak
grep jp ~/mirror.bak > ~/mirror
cat ~/mirror.bak >> ~/mirror
mv ~/mirror /etc/pacman.d/mirrorlist

timedatectl set-ntp true

yes "" | pacstrap -i /mnt base base-devel
genfstab -U /mnt >> /mnt/etc/fstab

if [ ! -e /mnt/var/works ]; then
    mkdir -p /mnt/var/works
fi
cp InstallScript2.sh InstallScript3.sh InstallScript4.sh InstallScript5.sh /mnt/var/works
cp yaourt.awk grub.awk mkinit.awk /mnt/var/works
arch-chroot /mnt /var/works/InstallScript2.sh $1 $2
