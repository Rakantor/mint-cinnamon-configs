#!/bin/bash
echo "------------------------------------------------------------------"
echo "Linux-Surface installation started!"
echo "(https://github.com/linux-surface/linux-surface)"
echo "------------------------------------------------------------------"
echo ""

echo "Installing apt fix..."
sudo add-apt-repository ppa:gpxbv/apt-urlfix -y
sudo apt-get update
sudo apt -y install apt

echo "Importing signing keys..."
wget -qO - https://raw.githubusercontent.com/linux-surface/linux-surface/master/pkg/keys/surface.asc \
  | gpg --dearmor | sudo dd of=/etc/apt/trusted.gpg.d/linux-surface.gpg

echo "Adding repository configuration..."
echo "deb [arch=amd64] https://pkg.surfacelinux.com/debian release main" \
	| sudo tee /etc/apt/sources.list.d/linux-surface.list

sudo apt update

echo "Installing linux-surface kernel..."
sudo apt -y install linux-image-surface linux-headers-surface iptsd libwacom-surface

echo "Enabling iptsd service for touchscreen support..."
sudo systemctl enable iptsd

echo "------------------------------------------------------------------"
echo "Installation Secure Boot key..."
echo "IMPORTANT: Follow package instructions!"
echo "------------------------------------------------------------------"
echo ""
sudo apt -y install linux-surface-secureboot-mok

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
