# Android Studio
sudo apt -y install openjdk-17-jdk # Active support until 30 Sep 2026
sudo add-apt-repository ppa:maarten-fonville/android-studio -y

# Atom Editor
wget https://packagecloud.io/AtomEditor/atom/gpgkey -O- | sudo apt-key add -
sudo add-apt-repository 'deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main' -y

# BlueMail
wget https://download.bluemail.me/BlueMail/deb/BlueMail.deb
sudo apt -y install ./BlueMail.deb

# Chrome
chrome=google-chrome-stable_current_amd64.deb
wget https://dl.google.com/linux/direct/"$chrome"
sudo apt -y install ./"$chrome"

# Cryptomator
sudo apt-add-repository ppa:sebastian-stenzel/cryptomator -y

# Graphics drivers (NVIDIA)
sudo apt-add-repository ppa:graphics-drivers/ppa -y

# IntelliJ IDEA Community
idea=ideaIC-2022.1.2.tar.gz
wget https://download.jetbrains.com/idea/"$idea"
sudo mkdir /opt/idea
sudo tar -xzf ./"$idea" -C /opt/idea --strip-components=1
/opt/idea/bin/idea.sh

# Lutris
sudo apt-add-repository ppa:lutris-team/lutris -y

# MEGA Sync
mega=megasync-xUbuntu_20.04_amd64.deb
wget https://mega.nz/linux/repo/xUbuntu_20.04/amd64/"$mega"
sudo apt -y install ./"$mega"

# NordVPN
nordvpn=nordvpn-release_1.0.0_all.deb
wget https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/"$nordvpn"
sudo apt -y install ./"$nordvpn"

# Papirus icons
sudo apt-add-repository ppa:papirus/papirus -y

# Spotify
wget -O- https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
sudo add-apt-repository 'deb http://repository.spotify.com stable non-free' -y

# Steam
# Included in Linux Mint 20 standard repositories

# VS Code
wget -O vscode.deb https://update.code.visualstudio.com/latest/linux-deb-x64/stable
sudo apt -y install ./vscode.deb

# Install applications
sudo apt update
sudo apt -y install android-studio atom google-chrome-stable nordvpn spotify-client steam code
sudo apt -y --fix-broken install

# Cleanup
rm -f ./BlueMail.deb ./"$chrome" ./"$idea" ./"$mega" ./"$nordvpn" ./vscode.deb