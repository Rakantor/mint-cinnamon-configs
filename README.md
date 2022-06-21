# mint-cinnamon-configs
Installs predefined user configurations, themes, applications and application configurations to a fresh install of Linux Mint 20.3 Cinnamon Edition.

### Themes
- [Orchis](https://github.com/vinceliuice/Orchis-theme)
- [WhiteSur](https://github.com/vinceliuice/WhiteSur-gtk-theme)
- [Papirus Icons](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)

### Applications
- Android Studio
- Atom (editor)
- BlueMail
- Chrome (browser)
- Cryptomator
- Filezilla
- Gimp
- IntelliJ IDEA Community
- [Logiops](https://github.com/PixlOne/logiops)
- Lutris
- MEGA Sync
- Node.js
- NordVPN
- Putty
- qBittorrent
- Spotify
- Steam
- VLC media player
- VS Code

## Prerequisites
1. [Install Linux Mint 20.3 Cinnamon Edition](https://linuxmint-installation-guide.readthedocs.io/en/latest/)
2. Install initial updates via the Update Manager, then reboot
3. Fetch project files:
```sh
sudo apt -y install build-essential git
git clone https://github.com/Rakantor/mint-cinnamon-configs.git
```

## (Optional) Surface devices: Install [Surface Linux](https://github.com/linux-surface/linux-surface)
Run the following command in a terminal and follow the instructions on screen:
```sh
./install-surface-linux.sh
```

## Installation
1. Run the following command in a terminal and follow the instructions on screen:
```sh
./install.sh
```
2. Run `Android Studio` and `IDEA` to create Desktop entries (Welcome screen > ⚙️ > Create Desktop Entry...)

## Post-Installation
Configure `nordvpn`, `megasync` and `bluemail`.
