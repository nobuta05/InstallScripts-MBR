echo -e "$2 server\n10.8.0.9 house" >> /etc/hosts
echo -e "\n\n[archlinuxfr]\nSigLevel = Never\nServer = http://repo.archlinux.fr/\$arch" >> /etc/pacman.conf
echo -e "NOCONFIRM=1\nBUILD_NOCONFIRM=1\nEDITFILES=0\nSUDONOVERIF=1" > $HOME/.yaourtrc
pacman -Syy

yes "" | pacman -S yaourt tmux emacs-nox zsh git xorg-xmodmap openssh python python-pip
useradd -m -g wheel nobuta05
echo "nobuta05:$1" | chpasswd

yes "" | pacman -S xorg-server xorg-server-utils xorg-xinit xorg-xclock xterm
## Confirm Driver
# lspci | grep VGA
## Example
yes "" | pacman -S xf86-video-intel

yes "" | pacman -S networkmanager network-manager-applet openvpn syncthing

yes "" | pacman -S i3-wm i3status
# .xinitrc exec i3
yes "" | pacman -S unzip xsel screenfetch xclip
yes "" | pacman -S fcitx-im fcitx-mozc fcitx-configtool
# yes "" | pacman -S texlive-bibtexextra texlive-core texlive-fontsextra texlive-formatsextra texlive-genericextra texlive-htmlxml texlive-humanities texlive-latexextra texlive-pictures texlive-plainextra texlive-pstricks texlive-publishers texlive-science texlive-langjapanese
yes "" | pacman -S feh volumeicon evince alsa-utils xf86-input-synaptics fig2dev pstoedit graphviz npm docker tcl tk

# yes "" | pacman -S octave gnuplot slack-desktop

git config --global user.email "nobuta05@gmail.com"
git config --global user.name "nobuta05"

sudo -u nobuta05 /var/works/InstallScript4.sh
