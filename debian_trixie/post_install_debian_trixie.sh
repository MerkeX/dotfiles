#!/bin/bash
echo ':: Executing postInstall script for "Debian 13 (Trixie)"...' && sleep 2
echo ":: Commenting 'deb-src' repositories..." && sleep 2
sudo sed -i 's/deb-src/#deb-src/g' /etc/apt/sources.list
echo ':: Adding i386 architecture and updating repositories...' && sleep 2
sudo dpkg --add-architecture i386 && apt-get update
echo ':: Install core software...' && sleep 2
sudo apt-get install acpi apt-transport-https asciidoctor bison build-essential clang cmake \
curl debhelper dkms dwarves findutils flex g++ gcc gdb gdebi git inxi libargon2-dev libbotan-2-dev \
libayatana-indicator3-7 libcap-dev libelf-dev libgcrypt20-dev libminizip-dev libodbc2 libpcsclite-dev \
libqrencode-dev libqt5svg5-dev libqt5x11extras5-dev libquazip5-dev libreadline-dev libsensors-dev \
libsodium-dev libssl-dev libusb-1.0-0-dev libva-drm2 libva-x11-2 libxi-dev libxss1 libykpers-1-dev \
libxtst-dev libyubikey-dev linux-headers-$(uname -r) locate make meson python3-pyqt5 qmlscene \
qt5-qmake qtdeclarative5-dev qtbase5-dev qtbase5-private-dev qttools5-dev qttools5-dev-tools \
rofi strace sudo zlib1g-dev -y

echo ':: Install essential softwares...' && sleep 2
sudo apt-get install aria2 btop cmus dhcpcd5 dosfstools fonts-fantasque-sans gedit gmtp \
htop npm nodejs openbox pcmanfm picom pipewire-bin pipewire playerctl task-lxqt-desktop \
thunar tint2 ttf-mscorefonts-installer unrar unzip wireplumber xarchiver zsh -y

echo ":: Removing unnecessary packages..." && sleep 2
sudo apt-get remove --purge bluetooth bluez bluez-cups bluez-obexd exfalso fcitx* \
goldendict ibus im-config mc minicom mlterm mlterm-tiny mozc-data mutt parole \
quodlibet transmission-gtk xiterm+thai xterm -y
sudo apt-get autoremove -y

echo ":: Adding 'contrib', 'non-free' and 'non-free-firmware' component(s) to sources.list..." && sleep 2
sed -i 's/main/main contrib non-free/' /etc/apt/sources.list

echo ':: Adding custom repositories...' && sleep 2

# ANYDESK
sudo apt install ca-certificates curl apt-transport-https
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://keys.anydesk.com/repos/DEB-GPG-KEY -o /etc/apt/keyrings/keys.anydesk.com.asc
sudo chmod a+r /etc/apt/keyrings/keys.anydesk.com.asc
echo "deb [signed-by=/etc/apt/keyrings/keys.anydesk.com.asc] https://deb.anydesk.com all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list > /dev/null

# GOOGLE CHROME
curl -fSsL https://dl.google.com/linux/linux_signing_key.pub |\
 sudo gpg --dearmor | sudo tee /usr/share/keyrings/google-chrome.gpg >> /dev/null
echo deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main \
| sudo tee /etc/apt/sources.list.d/google-chrome.list

# MICROSOFT EDGE
curl https://packages.microsoft.com/keys/microsoft.asc | \
gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" >\
 /etc/apt/sources.list.d/microsoft-edge.list'
sudo rm microsoft.gpg

# ONLY OFFICE
mkdir -p -m 700 ~/.gnupg
curl -fsSL https://download.onlyoffice.com/GPG-KEY-ONLYOFFICE | \
gpg --no-default-keyring --keyring gnupg-ring:/tmp/onlyoffice.gpg --import
chmod 644 /tmp/onlyoffice.gpg
sudo chown root:root /tmp/onlyoffice.gpg
sudo mv /tmp/onlyoffice.gpg /usr/share/keyrings/onlyoffice.gpg
echo 'deb [signed-by=/usr/share/keyrings/onlyoffice.gpg] https://download.onlyoffice.com/repo/debian squeeze main' | \
sudo tee -a /etc/apt/sources.list.d/onlyoffice.list

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

# SIGNAL DESKTOP
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee /etc/apt/sources.list.d/signal-xenial.list

# VS CODIUM
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list

echo ':: Updating repo(s)...' && sleep 2
sudo apt update

echo ':: Install other softwares...' && sleep 2
sudo apt-get install adb arduino audacious audacity blender breeze-icon-theme cava cmatrix cmus \
codium conky-all cups deepin-terminal dosbox emacs evince fastfetch feh ffmpeg filezilla \
fonts-fork-awesome fonts-ibm-plex galculator ghex gimp google-chrome-stable goverlay gparted \
grub-customizer gsmartcontrol hexchat hplip hwinfo idle inkscape kde-config-sddm kpat \
libreoffice libreoffice-gtk3 libreoffice-qt6 lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings \
links lutris lxtask mangohud menulibre microsoft-edge-stable ntpsec-ntpdate network-manager-gnome \
numix-gtk-theme numix-icon-theme numix-icon-theme-circle openshot-qt pavucontrol pdfsam \
polybar qbittorrent qdirstat rclone sddm signal-desktop spotify-client steam stellarium synaptic \
teams-for-linux terminator texlive-fonts-extra texlive-latex-extra texlive-lang-italian texlive-lang-english \
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
sudo apt-get install gtk2-engines-murrine gnome-themes-extra gtk2-engines-pixbuf \
libcanberra-gtk-module libglib2.0-dev ninja-build sassc -y
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


# Win11 - GTK
cd ~/temp
git clone --depth 1 https://github.com/MerkeX/Win11-gtk-theme.git
cd Win11-gtk-theme && sudo ./install.sh && cd ..
sudo rm -rf Win11-gtk-theme

# Win11 - KDE
cd ~/temp
git clone --depth 1 https://github.com/MerkeX/Win11OS-kde.git
cd Win11OS-kde && sudo ./install.sh && cd ..
sudo rm -rf Win11OS-kde


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

# Win11 theme
git clone --depth 1 https://github.com/MerkeX/Win11-icon-theme.git
cd Win11-icon-theme && sudo ./install.sh -t all && cd ..
sudo rm -rf Win11-icon-theme



echo ":: Finished installing icon packs..." && sleep 2
sudo rm -rf ~/temp
echo ":: Done. Now rebooting..." && sleep 5 && sudo reboot
