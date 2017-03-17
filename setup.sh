if [ $# != 2 ]; then
    echo "input nobuta05 password and Server IP-address"
    exit
fi

files=("disk.layout" "grub.awk" "InstallScript1.sh" "InstallScript2.sh" "InstallScript3.sh" "InstallScript4.sh" "InstallScript5.sh" "mkinit.awk" "yaourt.awk")

chmod +x *sh
source InstallScript1.sh $1 $2
