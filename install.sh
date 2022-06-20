#!/bin/bash
echo "------------------------------------------------------------------"
echo "Installation started!"
echo "------------------------------------------------------------------"
echo ""

echo "Adding PPAs..."
echo ""
sudo apt update

chmod +x ./installppa.sh
./installppa.sh

echo "Copying grub bootloader conf..."
sudo rm -f /etc/default/grub
sudo cp -f ./etc/default/grub /etc/default/grub

echo "Copying Mint themes..."
rm -rf ~/.themes
cp -rf ./.themes ~/.themes

echo "Copying splash screen theme..."
sudo rm -rf /usr/share/plymouth/themes/mint-logo
sudo cp -rf ./usr/share/plymouth/themes/mint-logo /usr/share/plymouth/themes/mint-logo

echo "Copying Firefox theme 'Orchis'..."
dir=~/.mozilla/firefox/*.default-release/
rm -rf "$dir"chrome
rm -f "$dir"user.js
cp -rf ./.mozilla/firefox/chrome "$dir"chrome
cp -f ./.mozilla/firefox/user.js "$dir"user.js

echo "Copying wallpapers..."
rm -rf ~/Pictures
cp -rf ./Pictures ~/Pictures

echo "Copying putty sessions..."
rm -rf ~/.putty/sessions
cp -rf ./.putty/sessions ~/.putty/sessions

echo "------------------------------------------------------------------"
echo "Installing logiops (https://github.com/PixlOne/logiops)..."
echo "------------------------------------------------------------------"

echo "Installing logiops dependencies..."
sudo apt install cmake libevdev-dev libudev-dev libconfig++-dev

echo "Fetching logiops build files..."
git clone https://github.com/PixlOne/logiops.git

echo "Building logiops..."
mkdir ./logiops/build
cmake -S ./logiops -B ./logiops/build
make -C ./logiops/build

echo "Installing logiops..."
sudo make -C ./logiops/build install

echo "Copying logiops config..."
sudo cp -f ./logid.cfg /etc/logid.cfg

echo "Enabling logiops service..."
sudo systemctl enable logid

echo "------------------------------------------------------------------"
echo "Finished installing logiops!"
echo "------------------------------------------------------------------"

echo "------------------------------------------------------------------"
echo "Installing applications..."
echo "Software selection >"
echo "Restore... >"
echo "select 'packages.list' in project root directory"
echo "------------------------------------------------------------------"
mintbackup

echo "Copying Cinnamon configs..."
#rm -r ~/.config/dconf/user
#cp -f ./.config/dconf/user ~/.config/dconf/user

rm -rf ~/.cinnamon/configs
cp -rf ./.cinnamon/configs ~/.cinnamon/configs

rm -rf ~/.local/share/cinnamon
cp -rf ./.local/share/cinnamon ~/.local/share/cinnamon

dconf load /org/cinnamon/ < ./cinnamon-dconf

echo "------------------------------------------------------------------"
echo "Running 'update-initramfs -u'..."
echo "------------------------------------------------------------------"
sudo update-initramfs -u

echo "------------------------------------------------------------------"
echo "Running 'update-grub'..."
echo "------------------------------------------------------------------"
sudo update-grub

echo "------------------------------------------------------------------"
echo "Finished!"
echo "REBOOT NOW to finalize changes."
echo "You can safely close this window."
echo "------------------------------------------------------------------"

$SHELL
