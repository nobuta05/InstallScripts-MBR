rm /etc/localtime
ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
echo -e "en_US.UTF-8 UTF-8\nja_JP.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
echo KEYMAP=jp106 > /etc/vconsole.conf
echo nobuta-arch > /etc/hostname
hwclock --systohc --utc

# mkinitcpio
cat /etc/mkinitcpio.conf | awk -f /var/works/mkinit.awk > /var/works/mkinitcpio.conf
mv /var/works/mkinitcpio.conf /etc/mkinitcpio.conf
mkinitcpio -p linux

# GRUB
yes "" | pacman -S grub wget
grub-install --recheck --debug /dev/sda
cat /etc/default/grub | awk -f /var/works/grub.awk > /var/works/grub
mv /var/works/grub /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable dhcpcd.service

source /var/works/InstallScript3.sh $1 $2

exit
