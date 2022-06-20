sudo apt-add-repository ppa:papirus/papirus -y
sudo add-apt-repository 'deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main' -y
sudo apt-add-repository '[arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' -y
sudo apt-add-repository '[arch=amd64,arm64,armhf] http://packages.microsoft.com/repos/code stable main' -y
sudo apt-add-repository '[signed-by=/usr/share/keyrings/meganz-archive-keyring.gpg] https://mega.nz/linux/repo/xUbuntu_20.04/ ./' -y
sudo apt-add-repository 'http://repository.spotify.com stable non-free' -y
sudo apt-add-repository '[arch=amd64,i386] https://repo.steampowered.com/steam/ stable steam' -y
sudo apt-add-repository 'https://repo.nordvpn.com/deb/nordvpn/debian stable main' -y
sudo apt-add-repository ppa:graphics-drivers/ppa -y
sudo apt-add-repository ppa:sebastian-stenzel/cryptomator -y
sudo apt-add-repository ppa:lutris-team/lutris -y

sudo apt update
sudo apt -y install atom chrome code spotify steam nordvpn