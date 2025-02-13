#!/bin/bash
echo ':: Executing postInstall script for "Debian 11 (Bullseye)"...' && sleep 2
echo ':: Adding i386 architecture and updating repositories...' && sleep 2
sudo dpkg --add-architecture i386 && apt-get update
echo ':: Install core software...' && sleep 2
sudo apt-get install acpi apt-transport-https asciidoctor bison build-essential clang cmake \
curl debhelper dkms dwarves find flex g++ gcc gdb gdebi git inxi libargon2-dev libbotan-2-dev  \
libayatana-indicator7 libcap-dev libdbusmenu-gtk4 libelf-dev libgconf-2-4 libgcrypt20-dev \
libminizip-dev libodbc1 libpcsclite-dev libqrencode-dev libqt5svg5-dev libqt5x11extras5-dev \
libquazip5-dev libreadline-dev  libsensors-dev libsodium-dev libssl-dev libusb-1.0-0-dev \
libva-drm2 libva-x11-2 libxi-dev libxss1 libykpers-1-dev libxtst-dev libyubikey-dev \
linux-headers-$(uname -r) locate make meson python3-pyqt5 qmlscene qt5-qmake \
qtdeclarative5-dev qtbase5-dev qtbase5-private-dev qttools5-dev qttools5-dev-tools \
rofi software-properties-common strace sudo zlib1g-dev -y

echo ':: Install essential softwares...' && sleep 2
sudo apt-get install aria2 cmus dhcpcd5 dosfstools fonts-fantasque-sans gedit gmtp npm nodejs \
openbox pcmanfm picom pipewire-bin pipewire playerctl tint2 ttf-mscorefonts-installer unrar \
unzip xarchiver xfce4 xfce4-goodies zsh -y

echo ":: Removing unnecessary packages..." && sleep 2
sudo apt-get remove --purge bluetooth bluez bluez-cups bluez-obexd exfalso fcitx* \
goldendict ibus im-config mc minicom mlterm mlterm-tiny mozc-data mutt parole \
quodlibet transmission-gtk xiterm+thai -y
sudo apt-get autoremove -y

echo ":: Adding 'contrib' and 'non-free' component(s) to sources.list..." && sleep 2
sudo apt-add-repository --component contrib non-free -y

echo ':: Adding custom repositories...' && sleep 2

# DOTNET 5.0
wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

# GOOGLE CHROME
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | \
sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | \
sudo tee /etc/apt/sources.list.d/google-chrome.list

# LUTRIS
echo "deb [signed-by=/etc/apt/keyrings/lutris.gpg] \
https://download.opensuse.org/repositories/home:/strycore/Debian_11/ ./" \
| sudo tee /etc/apt/sources.list.d/lutris.list > /dev/null
wget -q -O- https://download.opensuse.org/repositories/home:/strycore/Debian_11/Release.key | \
gpg --dearmor | sudo tee /etc/apt/keyrings/lutris.gpg > /dev/null

# MICROSOFT EDGE
curl https://packages.microsoft.com/keys/microsoft.asc | \
gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" >\
 /etc/apt/sources.list.d/microsoft-edge-stable.list'
sudo rm microsoft.gpg

# MICROSOFT TEAMS - PREVIEW
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo sh -c 'echo "#deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" >\
/etc/apt/sources.list.d/teams.list'

# TEAMS FOR LINUX 
sudo mkdir -p /etc/apt/keyrings
sudo wget -qO /etc/apt/keyrings/teams-for-linux.asc /etc/apt/keyrings/teams-for-linux.asc https://repo.teamsforlinux.de/teams-for-linux.asc 
echo "deb [signed-by=/etc/apt/keyrings/teams-for-linux.asc arch=$(dpkg --print-architecture)] https://repo.teamsforlinux.de/debian/ stable main" | \
sudo tee /etc/apt/sources.list.d/teams-for-linux-packages.list

# SPOTIFY
curl -sS https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg | \
sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | \
sudo tee /etc/apt/sources.list.d/spotify.list

# SKYPEFORLINUX
curl https://repo.skype.com/data/SKYPE-GPG-KEY | sudo apt-key add -
dpkg -s apt-transport-https > /dev/null || bash -c sudo apt-get update; \
echo "#deb [arch=amd64] https://repo.skype.com/deb stable main" | \
sudo tee /etc/apt/sources.list.d/skypeforlinux.list

# SIGNAL DESKTOP
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee /etc/apt/sources.list.d/signal-xenial.list

# TEAMVIEWER
wget -O - https://linux.teamviewer.com/pubkey/currentkey.asc | sudo apt-key add -
sudo sh -c 'echo "#deb https://linux.teamviewer.com/deb stable main" >\
/etc/apt/sources.list.d/teamviewer.list'

# VS CODIUM
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list

echo ':: Install other softwares...' && sleep 2
sudo apt-get install android-tools-adb arduino arduino-core audacious audacity blender \
breeze-icon-theme cava cmatrix cmus codium conky cups deepin-terminal dosbox \
emacs evince feh ffmpeg filezilla fonts-fork-awesome fonts-ibm-plex \
galculator ghex gimp google-chrome-stable goverlay gparted grub-customizer gsmartcontrol hexchat \
hplip hwinfo i3 idle idle3 inkscape kpat libreoffice lightdm lightdm-gtk-greeter \
lightdm-gtk-greeter-settings links lutris lxtask mangohud menulibre microsoft-edge-stable \
neofetch ntp network-manager-gnome numix-gtk-theme numix-icon-theme numix-icon-theme-circle \
openshot-qt pavucontrol pavumeter pdfsam playonlinux qbittorrent radeontop \
rclone signal-desktop spotify-client steam stellarium synaptic teams-for-linux \
terminator texlive-fonts-extra texlive-latex-extra texlive-lang-italian texlive-lang-english \
texlive-publishers texlive-science texstudio thunderbird tk vlc xscreensaver-data-extra \
xscreensaver-gl xscreensaver-gl-extra xscreensaver-screensaver-bsod xscreensaver-screensaver-dizzy -y

echo ":: Copying pipewire configs" && sleep 2
ln -s /usr/share/applications/pipewire.desktop /etc/xdg/autostart/pipewire.desktop
mkdir -p /etc/pipewire/pipewire.conf.d
ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d/

echo ":: Installing flatpak and apps..." && sleep 2
sudo apt-get install flatpak -y
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install com.discordapp.Discord org.telegram.desktop -y

echo ":: Installing fonts..." && sleep 2
sudo cp fonts/* /usr/local/share/fonts && sudo fc-cache /usr/local/share/fonts

echo 'PATH="/sbin/:/usr/sbin/:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"' > /etc/environment
sudo source /etc/environment

# INSTALLING NEW THEMES
echo ':: Install new themes...' && sleep 2
sudo apt-get install gtk2-engines-murrine gtk2-engines-pixbuf libcanberra-gtk-module \
libglib2.0-dev ninja-build sassc -y

# Mojave-gtk-theme
mkdir ~/temp && cd ~/temp
git clone --depth 1 https://github.com/MerkeX/Mojave-gtk-theme.git
cd Mojave-gtk-theme && sudo ./install.sh -d /usr/share/themes && cd ..
rm -rf Mojave-gtk-theme

# Mojave dark
cd ~/temp
git clone --depth 1 https://github.com/MerkeX/Mojave-kvantum.git
cd Mojave-kvantum && rm *.png LICENSE *.md
 sudo cp -r * /usr/share/themes && cd .. && rm -rf Mojave-kvantum

# Yosemite GTK
cd ~/temp
git clone --depth 1 https://github.com/MerkeX/Yosemite-gtk-theme.git
cd Yosemite-gtk-theme/ && sudo ./Install && cd .. && rm -rf Yosemite-gtk-theme/

# Kripton theme
cd ~/temp
git clone --depth 1 https://github.com/MerkeX/Kripton.git
sudo cp -r Kripton/ /usr/share/themes && sudo rm -rf Kripton

# WhiteSur theme
cd ~/temp
git clone --depth 1 https://github.com/MerkeX/WhiteSur-gtk-theme
 cd WhiteSur-gtk-theme && sudo ./install.sh -t all -d /usr/share/themes && cd ..
 sudo rm -rf WhiteSur-gtk-theme/

# INSTALL SOME THEMES FOR OPENBOX

git clone --depth 1 https://github.com/addy-dclxvi/openbox-theme-collections
cd openbox-theme-collections && rm *.png *.jpg LICENSE *.md
sudo cp -r * /usr/share/themes && cd .. && rm -rf openbox-theme-collections
git clone --depth 1 https://github.com/fikriomar16/OBTheme-Collections.git
cd OBTheme-Collections && rm *.md && sudo cp -r * /usr/share/themes && cd ..
rm -rf OBTheme-Collections

# INSTALLING ICON THEMES
echo ":: Installing icon packs..." && sleep 2

# Win10 Icon Theme
git clone --depth 1 https://github.com/MerkeX/We10X-icon-theme.git
cd We10X-icon-theme
sudo ./install.sh -a -d /usr/share/icons && cd .. && sudo rm -rf We10X-icon-theme/

# Breeze-Splendent icons
git clone --depth 1 https://github.com/MerkeX/Breeze-Splendent-Icons.git
cd Breeze-Splendent-Icons && rm README.md LICENSE
sudo cp -r * /usr/share/icons && cd .. && rm -rf Breeze-Splendent-Icons/

# Breeze-Honeyicons
git clone --depth 1 https://github.com/MerkeX/Breeze-Honey-Icons.git
cd Breeze-Honey-Icons && rm README.md LICENSE
sudo cp -r * /usr/share/icons && cd .. && rm -rf Breeze-Honey-Icons/

# Breeze-Noir-Themes (Black-blue & White-Blue) icons
git clone --depth 1 https://github.com/MerkeX/Breeze-Noir-Icons.git
cd Breeze-Noir-Icons && rm README.md LICENSE
sudo cp -r * /usr/share/icons && cd .. && rm -rf Breeze-Noir-Icons/

# Mojave-CT icon
git clone --depth 1 https://github.com/MerkeX/Mojave-CT.git
sudo cp -r Mojave-CT /usr/share/icons

# McMojave Circle
git clone --depth 1 https://github.com/MerkeX/McMojave-circle.git &&
cd McMojave-circle && sudo ./install.sh --all && cd .. && rm -rf McMojave-circle

# MacOs-icons theme (Cinnamon Edition)
git clone --depth 1 https://github.com/MerkeX/McOS-Mint-Cinnamon-Edition.git &&
cd McOS-Mint-Cinnamon-Edition && rm README.md
sudo cp -r * /usr/share/icons && cd .. && rm -rf McOS-Mint-Cinnamon-Edition/

# OS Catalina icons
git clone --depth 1 https://github.com/MerkeX/Os-Catalina-icons.git
sudo cp -r Os-Catalina-icons /usr/share/icons/Os_Catalina

# Tela icon
git clone --depth 1 https://github.com/MerkeX/Tela-icon-theme.git
cd Tela-icon-theme && sudo ./install.sh -a && cd .. && rm -rf Tela-icon-theme

# Korla (and his variants) theme
git clone --depth 1 https://github.com/MerkeX/korla.git
cd korla && rm *.png *.jpg LICENSE *.md
sudo cp -r * /usr/share/icons/ && cd .. && rm -rf korla/

# Pinbadge theme
git clone --depth 1 https://github.com/MerkeX/pinbadge-icon-theme
cd pinbadge-icon-theme && sudo make install -j${nproc} && cd ..
rm -rf pinbadge-icon-theme

# Paper theme
git clone --depth 1 https://github.com/MerkeX/paper-icon-theme.git
cd paper-icon-theme && meson "build" --prefix=/usr
sudo ninja -C "build" install && cd .. && rm -rf paper-icon-theme/

# WhiteSur theme
git clone --depth 1 https://github.com/vinceliuice/WhiteSur-icon-theme
cd WhiteSur-icon-theme && sudo ./install.sh -t all -d /usr/share/icons && cd ..
sudo rm -rf WhiteSur-icon-theme/

echo ":: Finished installing icon packs..." && sleep 2
sudo rm -rf ~/temp
echo ":: Done. Now rebooting..." && sleep 5 && sudo reboot
