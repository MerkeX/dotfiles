#!/bin/bash
echo '>> Executing postInstall script for "OpenSUSE Tumbleweed"...' && sleep 2
echo '>> Updating repositories...' && sleep 2
sudo zypper refresh
echo ">> Removing unnecessary packages..." && sleep 2
sudo zypper -n remove fcitx* firefox mutt parole pidgin pulseaudio quodlibet transmission-gtk 
echo '>> Upgrading...' && sleep 2
sudo zypper -n update
echo '>> Install core software...' && sleep 2
sudo zypper -n install acpi aria2 argon2-devel asciidoc autobuild bison clang cmake curl \
dbus-1-glib-devel dkms dwarves findutils flex gcc gcc13 gcc-c++ gdb git gtk3-devel \
libayatana-indicator3-7 libbotan-devel libc++1 libcap-devel libdbusmenu-gtk3-4 libelf-devel \
gconf2 gconf2-devel libgcrypt20-devel libncurses5 libodbc2 libpcsclite1 libQt5Svg5 \
libQt5X11Extras5 libsensors4-devel libsodium-devel libopenssl-devel libQt5Concurrent-devel \
libQt5Core-devel libQt5DBus-devel libQt5Gui-devel libQt5Network-devel ibqt5-linguist-devel \
libqt5-qtbase-dev libqt5-qtbase-private-headers-devel libqt5-qtbase-devel \
libqt5-qtdeclarative-devel libqt5-qtsvg-devel libqt5-qttools-dev libqt5-qttools \
libusb-1_0-devel libva-drm2 libva-x11-2 libqt5-qtx11extras-devel libstdc++6-devel-gcc13 \
libusb-1_0-devel \libXi-devel libXss1 libXss-devel libykpers-devel libXtst-devel \
libyubikey-devel lightdm-gobject-devel llvm make meson minizip-devel ncurses-devel neofetch \
opi pcsc-lite-devel python3-AnyQt qconf qrencode-devel readline-devel rofi sensors strace \
sudo webkit2gtk3-devel webkit2gtk3-soup2-devel xorg-x11-devel

echo '>> Install essential softwares...' && sleep 2
sudo zypper -n install cmus dosfstools flatpak gedit iosevka-fonts lightdm lightdm-gtk-greeter \
lightdm-gtk-greeter-settings npm-default nodejs-default openbox pcmanfm picom pipewire \
pipewire-pulseaudio playerctl tint2 unrar unzip wireplumber zsh

echo '>> Adding custom repositories...' && sleep 2

# DISCORD
sudo zypper addrepo https://download.opensuse.org/repositories/games:tools/openSUSE_Tumbleweed/games:tools.repo

# FANTASQUE SANS FONT
sudo zypper addrepo https://download.opensuse.org/repositories/home:rroden12/openSUSE_Tumbleweed/home:rroden12.repo

# FIREFOX ESR
sudo zypper addrepo https://download.opensuse.org/repositories/mozilla/openSUSE_Tumbleweed/mozilla.repo

# GOOGLE CHROME
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub > linux_signing_key.pub
sudo rpm --import linux_signing_key.pub
sudo zypper addrepo http://dl.google.com/linux/chrome/rpm/stable/x86_64 Google-Chrome

# GRUB CUSTOMIZER
sudo zypper addrepo https://download.opensuse.org/repositories/home:ecsos/openSUSE_Tumbleweed/home:ecsos.repo

# MICROSOFT EDGE
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo zypper addrepo --refresh https://packages.microsoft.com/yumrepos/edge microsoft-edge

# RUSTDESK
sudo zypper addrepo https://download.opensuse.org/repositories/home:sunweaver:RustDesk/openSUSE_Tumbleweed/home:sunweaver:RustDesk.repo

# SIGNAL DESKTOP 
sudo zypper addrepo https://download.opensuse.org/repositories/network:im:signal/openSUSE_Tumbleweed/network:im:signal.repo

# VSCODIUM
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=gitlab.com_paulcarroty_vscodium_repo\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/zypp/repos.d/vscodium.repo

echo '>> Install other softwares...' && sleep 2
sudo zypper -n install audacious audacity blender breeze5-icons cava cmus codium conky \
cups deepin-terminal discord dosbox emacs evince feh ffmpeg filezilla firefox-esr \
fantasque-sans-fonts galculator ghex gimp google-chrome-stable gparted grub-customizer \
gsmartcontrol hexchat hplip hwinfo inkscape keepassxc kpat libreoffice links lutris \
mangohud menulibre microsoft-edge-stable MozillaThunderbird ntp NetworkManager \
NetworkManager-applet openshot-qt pavucontrol pavumeter plymouth polybar qbittorrent \
rclone rustdesk signal-desktop steam stellarium terminator texlive texstudio tk vlc 
wget https://download.teamviewer.com/download/linux/teamviewer-suse.x86_64.rpm
sudo zypper -n install ./teamviewer-*.rpm
sudo rm teamviewer-*.rpm

echo ">> Installing flatpak and apps..." && sleep 2
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install com.axosoft.GitKraken  com.github.IsmaelMartinez.teams_for_linux \
io.github.mimbrero.WhatsAppDesktop -y

#echo ">> Installing fonts..." && sleep 2
#sudo cp fonts/* /usr/local/share/fonts && sudo fc-cache /usr/local/share/fonts

# INSTALLING NEW THEMES

echo '>> Install new themes...' && sleep 2
sudo zypper -n install gtk2-engine-murrine libcanberra-gtk3-module ninja sassc
sudo mkdir ~/temp

# Kripton theme
cd ~/temp
git clone --depth 1  https://github.com/MerkeX/Kripton.git
sudo cp -r Kripton/ /usr/share/themes && sudo rm -rf Kripton

# Polarnight-KDE
cd ~/temp
git clone --depth 1 https://github.com/yeyushengfan258/Polarnight-dke.git
cd Sunset-kde && sudo ./install.sh

# Sunset-KDE
cd ~/temp
git clone --depth 1 https://github.com/yeyushengfan258/Sunset-kde.git
cd Sunset-kde && sudo ./install.sh

# Windows 11
cd ~/temp
git clone --depth 1 https://github.com/zayronxio/windows-eleven-skin.git
cd windows-eleven-skin
cd ./plasma-themes && sudo cp -r * /usr/share/themes && cd ../
cd ./Icons && sudo cp -r * /usr/share/icons && cd ../
cd ./Aurorae && sudo cp -r * /usr/share/themes/Windows-Eleven-Aurorae && cd ../


# WhiteSur theme
cd ~/temp
git clone https://github.com/MerkeX/WhiteSur-gtk-theme
cd WhiteSur-gtk-theme && sudo ./install.sh -t all -d /usr/share/themes && cd ..
sudo rm -rf WhiteSur-gtk-theme/

# INSTALL SOME THEMES FOR OPENBOX

cd ~/temp
git clone --depth 1 https://github.com/addy-dclxvi/openbox-theme-collections
cd openbox-theme-collections && rm *.png *.jpg LICENSE *.md
sudo cp -r * /usr/share/themes && cd .. && rm -rf openbox-theme-collections
git clone --depth 1 https://github.com/fikriomar16/OBTheme-Collections.git
cd OBTheme-Collections && rm *.md && sudo cp -r * /usr/share/themes && cd ..
rm -rf OBTheme-Collections

# INSTALLING ICON THEMES

echo ">> Installing icon packs..." && sleep 2

# Tela icon
git clone --depth 1 https://github.com/MerkeX/Tela-icon-theme.git
cd Tela-icon-theme && sudo ./install.sh -a && cd .. && rm -rf Tela-icon-theme

# Korla (and his variants) theme
git clone --depth 1 https://github.com/MerkeX/korla.git
cd korla && rm *.png *.jpg LICENSE *.md
sudo cp -r * /usr/share/icons/ && cd .. && rm -rf korla/

# WhiteSur theme
git clone --depth 1 https://github.com/vinceliuice/WhiteSur-icon-theme
cd WhiteSur-icon-theme && sudo ./install.sh -t all -d /usr/share/icons && cd ..
sudo rm -rf WhiteSur-icon-theme/

echo ">> Finished installing icon packs..." && sleep 2
sudo rm -rf ~/temp
echo ">> Done. " #Now rebooting..." && sleep 5 && sudo reboot
