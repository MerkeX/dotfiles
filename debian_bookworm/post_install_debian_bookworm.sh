#!/bin/bash
echo ':: Executing postInstall script for "Debian 12 (Bookworm)"...' && sleep 2
echo ':: Adding i386 architecture and updating repositories...' && sleep 2
sudo dpkg --add-architecture i386 && apt-get update
echo '>> Install core software...' && sleep 2
sudo apt-get install acpi apt-transport-https asciidoctor bison build-essential clang cmake \
curl debhelper dkms dwarves findutils flex g++ gcc gdb gdebi git inxi libargon2-dev libbotan-2-dev  \
libayatana-indicator7 libcap-dev libdbusmenu-gtk4 libelf-dev libgconf-2-4 libgcrypt20-dev \
libminizip-dev libodbc1 libpcsclite-dev libqrencode-dev libqt5svg5-dev libqt5x11extras5-dev \
libquazip5-dev libreadline-dev libsensors-dev libsodium-dev libssl-dev libusb-1.0-0-dev \
libva-drm2 libva-x11-2 libxi-dev libxss1 libykpers-1-dev libxtst-dev libyubikey-dev \
linux-headers-$(uname -r) locate make meson python3-pyqt5 qmlscene qt5-qmake \
qtdeclarative5-dev qtbase5-dev qtbase5-private-dev qttools5-dev qttools5-dev-tools \
rofi software-properties-common strace sudo zlib1g-dev -y

echo ':: Install essential softwares...' && sleep 2
sudo apt-get install aria2 cmus dhcpcd5 dosfstools fonts-fantasque-sans gedit gmtp npm nodejs openbox \
pcmanfm picom pipewire-bin pipewire playerctl tint2 ttf-mscorefonts-installer unrar unzip \
wireplumber xarchiver xfce4 xfce4-goodies zsh -y

echo ":: Removing unnecessary packages..." && sleep 2
sudo apt-get remove --purge bluetooth bluez bluez-cups bluez-obexd exfalso fcitx* \
goldendict ibus im-config mc minicom mlterm mlterm-tiny mozc-data mutt parole \
quodlibet transmission-gtk xiterm+thai -y
sudo apt-get autoremove -y

echo ":: Adding 'contrib', 'non-free' and 'non-free-firmware' component(s) to sources.list..." && sleep 2
sudo apt-add-repository --component contrib non-free non-free-firmware -y

echo ':: Adding custom repositories...' && sleep 2

# GOOGLE CHROME
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | \
sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | \
sudo tee /etc/apt/sources.list.d/google-chrome.list

# LUTRIS
echo "deb [signed-by=/etc/apt/keyrings/lutris.gpg] \
https://download.opensuse.org/repositories/home:/strycore/Debian_12/ ./" | \
sudo tee /etc/apt/sources.list.d/lutris.list > /dev/null
wget -q -O- https://download.opensuse.org/repositories/home:/strycore/Debian_12/Release.key | \
gpg --dearmor | sudo tee /etc/apt/keyrings/lutris.gpg > /dev/null
sudo apt update
sudo apt install lutris

# MICROSOFT EDGE
curl https://packages.microsoft.com/keys/microsoft.asc | \
gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" >\
 /etc/apt/sources.list.d/microsoft-edge-stable.list'
sudo rm microsoft.gpg

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
hplip hwinfo idle idle3 inkscape kpat libreoffice lightdm lightdm-gtk-greeter \
lightdm-gtk-greeter-settings links lutris lxtask mangohud menulibre microsoft-edge-stable \
neofetch ntp network-manager-gnome numix-gtk-theme numix-icon-theme numix-icon-theme-circle \
openshot-qt pavucontrol pavumeter pdfsam playonlinux polybar qbittorrent radeontop \
rclone signal-desktop spotify-client steam stellarium synaptic teams-for-linux \
terminator texlive-fonts-extra texlive-latex-extra texlive-lang-italian texlive-lang-english \
texlive-publishers texlive-science texstudio thunderbird tk vlc xscreensaver-data-extra \
xscreensaver-gl xscreensaver-gl-extra xscreensaver-screensaver-bsod xscreensaver-screensaver-dizzy -y

echo ":: Installing 'Swaywm' and extras..." && sleep 2
sudo apt install sway swaylock swayimg swaybg sway-backgrounds grimshot -y
sudo apt install foot libplayerctl-dev lxpolkit waybar wofi wlogout -y

# DOTNET 5.0
echo ":: Installing .NET Suite..." && sleep 2
wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
chmod +x ./dotnet-install.sh
./dotnet-install.sh --version latest --runtime aspnetcore

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
mkdir ~/temp

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
