# root cannnot use "yaourt"

cd $HOME
# git clone https://github.com/nobuta05/dotfiles
# source $HOME/dotfiles/symlink.sh

files=("ttf-ricty" "google-chrome" "dmenu2" "atom-editor-bin" "rxvt-unicode-256xresources" "i3lock-fancy-git" "epstool" "texlive-localmanager-git" "pyenv" "blockdiag")


for filename in ${files[@]}
do
#    out=""
#    timeout 5 yaourt ${filename} > /var/works/tmp.txt
#    out=`cat /var/works/tmp.txt | awk -f /var/works/yaourt.awk -v INP="${filename}"`
#    if ${out} != ""; then
#	echo $out | yaourt ${filename}
#    fi
    yaourt ${filename}
done

# chsh
# ssh-keygen -t rsa
# ssh-copy-id -i .ssh/id_rsa.pub 203...
# rm /var/works/tmp.txt

curl https://sh.rustup.rs -sSf | sh

# source /var/works/InstallScript5.sh
