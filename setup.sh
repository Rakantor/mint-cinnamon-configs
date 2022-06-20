#!/bin/bash
echo "------------------------------------------------------------------"
echo "Export of config files started!"
echo "------------------------------------------------------------------"
echo ""

echo "Copying grub bootloader conf..."
rm -rf ./etc
mkdir -p ./etc/default
cp -f /etc/default/grub ./etc/default/grub

echo "Copying Mint themes..."
rm -rf ./.themes
cp -rf ~/.themes ./.themes

echo "Copying splash screen theme..."
rm -rf ./usr
mkdir -p ./usr/share/plymouth/themes
cp -rf /usr/share/plymouth/themes/mint-logo ./usr/share/plymouth/themes/mint-logo

echo "Copying Firefox theme 'Orchis'..."
rm -rf ./.mozilla
mkdir -p ./.mozilla/firefox
cp -rf ~/.mozilla/firefox/*.default-release/chrome ./.mozilla/firefox/chrome
cp -f ~/.mozilla/firefox/*.default-release/user.js ./.mozilla/firefox/user.js

echo "Copying wallpapers..."
rm -rf ./Pictures
cp -rf ~/Pictures ./Pictures

echo "Copying Cinnamon configs..."
#rm -rf ./.config/dconf
#mkdir -p ./.config/dconf
#cp -f ~/.config/dconf/user ./.config/dconf/user

rm -rf ./.cinnamon
mkdir -p ./.cinnamon
cp -rf ~/.cinnamon/configs ./.cinnamon/configs

rm -rf ./.local
mkdir -p ./.local/share
cp -rf ~/.local/share/cinnamon ./.local/share/cinnamon

dconf dump /org/cinnamon/ > ./cinnamon-dconf

echo "Copying putty sessions..."
rm -rf ./.putty
mkdir -p ./.putty
cp -rf ~/.putty/sessions ./.putty/sessions

echo "Copying logiops config..."
rm -f ./logid.cfg
cp -f /etc/logid.cfg ./logid.cfg

echo "Generating PPA install script..."
# Script to get all the PPA installed on a system
# https://askubuntu.com/a/148968
for APT in `find /etc/apt/ -name \*.list`; do
    grep -Po "(?<=^deb\s).*?(?=#|$)" $APT | while read ENTRY ; do
        HOST=`echo $ENTRY | cut -d/ -f3`
        USER=`echo $ENTRY | cut -d/ -f4`
        PPA=`echo $ENTRY | cut -d/ -f5`
        #echo sudo apt-add-repository ppa:$USER/$PPA
        if [ "ppa.launchpad.net" = "$HOST" ]; then
            echo sudo apt-add-repository ppa:$USER/$PPA -y
        else
            echo sudo apt-add-repository \'${ENTRY}\' -y
        fi
    done
done > ./installppa.sh


echo "------------------------------------------------------------------"
echo "All done! You can safely close this window."
echo "------------------------------------------------------------------"

$SHELL
