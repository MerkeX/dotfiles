#!/bin/bash
echo '>> Executing postInstall script for "Linux Mint 20"...' && sleep 2 &&
echo '>> Adding i386 architecture and updating repositories...' && sleep 2 &&
sudo dpkg --add-architecture i386 && apt-get update &&
echo '>> Install core software...' && sleep 2 &&
sudo apt-get install linux-headers-$(uname -r) build-essential snapd apt-transport-https gdb execstack debhelper dkms gdebi \
sudo software-properties-common gcc git libxss1 libappindicator1 libindicator7 qmlscene qt5-qmake qt5-default qtdeclarative5-dev -y &&
echo '>> Adding custom repositories...' && sleep 2 &&
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - &&
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list &&
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 78BD65473CB3BD13 &&
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - &&
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list &&
sudo apt-get remove --purge pix xplayer thunderbird transmission-gtk bluetooth bluez bluez-cups bluez-obexd -y &&
echo ">> Re-updating repos and upgrading..." && sleep 2 &&
sudo apt-get update && apt-get upgrade -y &&
echo '>> Install essential softwares...' && sleep 2 &&
sudo apt-get install compton compton-conf chromium openbox tint2 dosfstools xarchiver playerctl cmus gmtp xfce4 \
 xfce4-goodies unrar unzip dhcpcd5 gedit ttf-mscorefonts-installer -y &&
echo '>> Install other softwares...' && sleep 2 &&
sudo apt-get install idle idle3 vlc feh grub-customizer filezilla stellarium ffmpeg hexchat conky skypeforlinux neofetch \
qbittorrent texlive-fonts-extra texlive-latex-extra audacious libreoffice steam spotify-client deepin-terminal ntp \
tk texmaker gimp gparted google-chrome-stable cups android-tools-adb hplip inkscape evince gsmartcontrol kpat hwinfo \
telegram-desktop breeze-icon-theme playonlinux emacs ghex audacity links terminator cmatrix dosbox wmmatrix libgconf-2-4 \
numix-icon-theme-circle xscreensaver-data-extra lxtask synaptic xscreensaver-gl xscreensaver-gl-extra \
xscreensaver-screensaver-bsod xscreensaver-screensaver-dizzy pulseaudio pavucontrol pavumeter -y &&
wget https://release.axocdn.com/linux/gitkraken-amd64.deb && sudo dpkg -i gitkraken-amd64.deb &&
wget https://atom-installer.github.com/v1.57.0/atom-amd64.deb?s=1610567452&ext=.deb && sudo dpkg -i atom-amd64.deb &&
wget https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.3.00.30857_amd64.deb &&
sudo dpkg -i teams_1.3.00.30857_amd64.deb &&
wget https://dl.teamviewer.com/download/linux/version_15x/teamviewer_15.14.5_amd64.deb && sudo dpkg -i teamviewer_15.14.5_amd64.deb &&
wget https://github.com/Foundry376/Mailspring/releases/download/1.8.0/mailspring-1.8.0-amd64.deb &&
sudo dpkg -i mailspring-1.8.0-amd64.deb && s
sudo apt-get -f install &&

# INSTALLIG ATOM PACKAGES
echo ">> Installing ATOM packages" && sleep 2 &&
apm install gitlab-integration gitlab ide-python atom-python-run ide-c-cpp monokai \
gruvbox gruvbox-dark-ui dracula-ui markdown-preview &&

echo ">> Installing fonts..." && sleep 2 &&
cd ./fonts && sudo cp * /usr/local/share/fonts && cd .. &&

# INSTALLING NEW THEMES
echo '>> Install new themes...' && sleep 2 &&
sudo apt-get install git gtk2-engines-murrine gtk2-engines-pixbuf sassc libcanberra-gtk-module libglib2.0-dev meson ninja &&

# Mojave-gtk-theme
mkdir ~/temp && cd ~/temp &&
git clone https://github.com/MerkeX/Mojave-gtk-theme.git &&
cd Mojave-gtk-theme && sudo ./install.sh -d /usr/share/themes && cd .. && rm -rf Mojave-gtk-theme

# Mojave dark
git clone https://github.com/MerkeX/Mojave-kvantum.git &&
cd Mojave-kvantum && rm *.png LICENSE *.md && sudo cp -r * /usr/share/themes && cd .. && rm -rf Mojave-kvantum &&

# Yosemite GTK
git clone https://github.com/MerkeX/Yosemite-gtk-theme.git &&
cd Yosemite-gtk-theme/ && sudo ./Install && cd .. && rm -rf Yosemite-gtk-theme/ &&

# macOS Dark
git clone https://github.com/MerkeX/macOS-Dark.git && sudo cp -r macOS-Dark/ /usr/share/themes &&

# Kripton theme
git clone https://github.com/MerkeX/Kripton.git && sudo cp -r * /usr/share/themes

# INSTALL SOME THEMES FOR OPENBOX

git clone https://github.com/addy-dclxvi/openbox-theme-collections &&
cd openbox-theme-collections && rm *.png *.jpg LICENSE *.md && sudo cp -r * /usr/share/themes && cd .. && rm -rf openbox-theme-collections
git clone https://github.com/fikriomar16/OBTheme-Collections.git &&
cd OBTheme-Collections && rm *.md && sudo cp -r * /usr/share/themes && cd .. && rm -rf OBTheme-Collections &&

# INSTALLING ICON THEMES
echo ">> Installing icon packs..." && sleep 2 &&
# Numix icon theme
cd ~/temp &&
git clone https://github.com/MerkeX/numix-icon-theme.git &&
cd numix-icon-theme/ &&
rm license readme.md && sudo cp -r * Numix Numix-Light /usr/share/icons && cd .. && rm -rf numix-icon-theme/

# Numix circle theme
git clone https://github.com/MerkeX/numix-icon-theme-circle.git &&
cd numix-icon-theme-circle/ &&
rm LICENSE README.md && sudo cp -r * /usr/share/icons && cd .. && rm -rf numix-icon-theme-circle/

# Win10 Icon Theme
git clone https://github.com/MerkeX/We10X-icon-theme.git &&
cd We10X-icon-theme &&
sudo ./install.sh -a -d /usr/share/icons && cd .. && sudo rm -rf We10X-icon-theme/

# Breeze-Splendent icons
git clone https://github.com/MerkeX/Breeze-Splendent-Icons.git &&
cd Breeze-Splendent-Icons && rm README.md LICENSE && sudo cp -r * /usr/share/icons && cd .. && rm -rf Breeze-Splendent-Icons/

# Breeze-Honeyicons
git clone https://github.com/MerkeX/Breeze-Honey-Icons.git &&
cd Breeze-Honey-Icons && rm README.md LICENSE && sudo cp -r * /usr/share/icons && cd .. && rm -rf Breeze-Honey-Icons/

# Breeze-Noir-Themes (Black-blue & White-Blue) icons
git clone https://github.com/MerkeX/Breeze-Noir-Icons.git &&
cd Breeze-Noir-Icons && rm README.md LICENSE && sudo cp -r * /usr/share/icons && cd .. && rm -rf Breeze-Noir-Icons/

# Mojave-CT icon
git clone https://github.com/MerkeX/Mojave-CT.git && sudo cp -r Mojave-CT /usr/share/icons

# McMojave Circle
git clone https://github.com/MerkeX/McMojave-circle.git &&
cd McMojave-circle && sudo ./install.sh --all && cd .. && rm -rf McMojave-circle

# MacOs-icons theme (Cinnamon Edition)
git clone https://github.com/MerkeX/McOS-Mint-Cinnamon-Edition.git &&
cd McOS-Mint-Cinnamon-Edition && rm README.md && sudo cp -r * /usr/share/icons && cd .. && rm -rf McOS-Mint-Cinnamon-Edition/

# OS Catalina icons
git clone https://github.com/MerkeX/Os-Catalina-icons.git && sudo cp -r Os-Catalina-icons /usr/share/icons/Os_Catalina

# Tela icon
git clone https://github.com/MerkeX/Tela-icon-theme.git &&
cd Tela-icon-theme && sudo ./install.sh -a && cd .. && rm -rf Tela-icon-theme &&

# Korla (and his variants) theme
git clone https://github.com/MerkeX/korla.git
cd korla && rm *.png *.jpg LICENSE *.md && sudo cp -r * /usr/share/icons/ && cd .. && rm -rf korla/

# Pinbadge theme
git clone https://github.com/MerkeX/pinbadge-icon-theme &&
cd pinbadge-icon-theme && sudo make install && cd .. && rm -rf pinbadge-icon-theme

# Paper theme
git clone https://github.com/MerkeX/paper-icon-theme.git &&
cd paper-icon-theme && meson "build" --prefix=/usr && sudo ninja -C "build" install && cd .. && rm -rf paper-icon-theme/

# Vibrancy colors
wget http://download1640.mediafire.com/9e0fqjgl776g/i25blth6npp23h5/Vibrancy-Colors-GTK-Icon-Theme-v-2-7.tar.gz &&
sudo cp -r Vibrancy-Colors-GTK-Icon-Theme-v-2-7.tar.gz /usr/share/icons && cd /usr/share/icons/ &&
sudo tar xf Vibrancy-Colors-GTK-Icon-Theme-v-2-7.tar.gz && sudo rm 'Copyrights&Licenses.txt' README-Manual.txt *.tar.gz && cd ~/temp &&
sudo rm -rf ~/temp &&

echo ">> Finished installing icon packs..." && sleep 2 &&
echo ">> Restoring configs..." && sleep 2 &&
cp -rf .config .conky .idlerc  ~/ &&
echo ">> Done. Now rebooting..." && sleep 5 && sudo reboot
