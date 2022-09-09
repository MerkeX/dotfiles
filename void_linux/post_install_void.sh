#!/bin/bash
echo '>> Executing postInstall script for "Void Linux"...' && sleep 2
cd ~ &&
echo ">> Upgrading package manager..." && sleep 2
xbps-install -Su xbps
echo ">> Adding 'non-free' repo..." && sleep 2
sudo xbps-install -Syv void-repo-nonfree void-repo-multilib{,-nonfree}
echo '>> Updating...' && sleep 2
sudo xbps-install -S
echo ">> Installing and configuring 'xbps-src'..." && sleep 2
sudo git clone git://github.com/void-linux/void-packages.git /opt/void-packages
sudo chmod 777 -R /opt/void-packages
echo '>> Install essential softwares...' && sleep 2
sudo xbps-install acpi alsa-lib alsa-plugins alsa-oss alsa-pipewire alsa-firmware alsa-utils \
apulse aria2 autoconf avahi bison cmake cmus cups cups-filters cups-pdf curl dosfstools \
doxygen fakeroot ffmpeg flatpak flex font-adobe-source-code-pro font-adobe-75dpi \
font-adobe-100dpi font-awesome5 gedit git gmtp i3lock i3status i3-gaps libcups-filters \
libelf libgcc-32bit libstdc++-32bit libdrm-32bit libglapi libglvnd-32bit libusb-devel \
libutf8proc lightdm lightdm-gtk3-greeter lightdm-gtk-greeter-settings lightdm-webkit2-greeter \
lm_sensors make mesa-vmwgfx-dri mesa-vulkan-intel mesa-vulkan-overlay-layer \
mesa-dri-32bit ncurses ncurses-devel neofetch net-tools ntp ntfs-3g openbox pavucontrol \
picom playerctl polybar rsync system-config-printer tint2 tint2conf unrar unzip \
Vulkan-Headers Vulkan-Tools wget wine wine-32bit wine-gecko wine-mono wine-tools \
winetricks xarchiver xboxdrv xfce4 xpadneo xscreensaver xtools -y && sleep 2
echo '>> Install other softwares...' && sleep 2
sudo xbps-install alacritty android-tools arduino audacious audacious-plugins audacity \
blender cmatrix codelite cool-retro-term conky dosbox droidcam emacs evince \
feh filezilla firefox-esr firefox-esr-i18n-it galculator-gtk3 ghex gimp gparted grub grub-customizer \
gsmartcontrol hexchat hplip-gui htop idle-python3 inkscape keepassxc kodi libreoffice links \
lutris lxappearance MangoHud  menulibre nano neovim neovim-qt nodejs obconf \
open-vm-tools playonlinux plymouth pulseaudio pycharm-community qbittorrent qt5-core \
qt5-devel qt5-tools qt5-tools-devel rclone rofi Signal-Desktop skype steam stellarium \
stellarium-data telegram-desktop terminator texlive-bin texlive-latexextra texlive-fontsextra \
texlive-science texlive-publishers texstudio thunderbird tk vala-panel vlc vscode  -y

echo ">> Enabling 'flatpak' repo..." && sleep 2
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install com.axosoft.Gitkraken  -y

echo ">> Installing fonts..." && sleep 2
cd fonts/ && sudo cp * /usr/share/fonts/TTF
sudo fc-cache  /usr/share/fonts/TTF && cd ..

# INSTALLING NEW THEMES
echo '>> Install new themes...' && sleep 2
sudo xbps-install arc-theme archlabs-themes breeze-amber-cursor-theme \
breeze-blue-cursor-theme breeze-contrast-cursor-theme \
breeze-gtk breeze-hacked-cursor-theme breeze-obsidian-cursor-theme numix-themes \
breeze-purple-cursor-theme breeze-red-cursor-theme breeze-snow-cursor-theme \
gtk2-engine-murrine sassc libcanberra-gtk libcanberra-gtk3 meson ninja

# Mojave-gtk-theme
mkdir ~/temp && cd ~/temp
git clone https://github.com/MerkeX/Mojave-gtk-theme.git
cd Mojave-gtk-theme && sudo ./install.sh -d /usr/share/themes && cd ..
rm -rf Mojave-gtk-theme

# Mojave dark
cd ~/temp
git clone https://github.com/MerkeX/Mojave-kvantum.git /usr/share/themes/Mojave-kvantum

# Yosemite GTK
cd ~/temp
git clone https://github.com/MerkeX/Yosemite-gtk-theme.git &&
cd Yosemite-gtk-theme/ && sudo ./Install && cd .. && rm -rf Yosemite-gtk-theme/

# Kripton theme
cd ~/temp
git clone https://github.com/MerkeX/Kripton.git /usr/share/themes/Kripton

# WhiteSur theme
cd ~/temp
git clone https://github.com/MerkeX/WhiteSur-gtk-theme
cd WhiteSur-gtk-theme && sudo ./install.sh -t all -d /usr/share/themes && cd ..
sudo rm -rf WhiteSur-gtk-theme/

# INSTALL SOME THEMES FOR OPENBOX

git clone https://github.com/addy-dclxvi/openbox-theme-collections /usr/share/themes

# INSTALLING ICON THEMES

echo ">> Installing icon packs..." && sleep 2
sudo xbps-install arc-icon-theme breeze-icons faenza-icon-theme \
paper-icon-theme papirus-icon-theme -y

# Numix icon theme
cd ~/temp
git clone https://github.com/MerkeX/numix-icon-theme.git
cd numix-icon-theme/
rm license readme.md && sudo cp -r * Numix Numix-Light /usr/share/icons
cd .. && rm -rf numix-icon-theme/

# Numix circle theme
git clone https://github.com/MerkeX/numix-icon-theme-circle.git
cd numix-icon-theme-circle/ &&
rm LICENSE README.md && sudo cp -r * /usr/share/icons && cd ..
rm -rf numix-icon-theme-circle/

# Win10 Icon Theme
git clone https://github.com/MerkeX/We10X-icon-theme.git &&
cd We10X-icon-theme &&
sudo ./install.sh -a -d /usr/share/icons && cd .. && sudo rm -rf We10X-icon-theme/

# Mojave-CT icon
git clone https://github.com/MerkeX/Mojave-CT.git /usr/share/icons/Mojave-CT

# McMojave Circle
git clone https://github.com/MerkeX/McMojave-circle.git
cd McMojave-circle && sudo ./install.sh --all && cd .. && rm -rf McMojave-circle

# MacOs-icons theme (Cinnamon Edition)
git clone https://github.com/MerkeX/McOS-Mint-Cinnamon-Edition.git
cd McOS-Mint-Cinnamon-Edition && rm README.md
sudo cp -r * /usr/share/icons && cd .. && rm -rf McOS-Mint-Cinnamon-Edition/

# OS Catalina icons
git clone https://github.com/MerkeX/Os-Catalina-icons.git /usr/share/icons/OS-Catalina

# Tela icon
git clone https://github.com/MerkeX/Tela-icon-theme.git
cd Tela-icon-theme && sudo ./install.sh -a && cd .. && rm -rf Tela-icon-theme

# Korla (and his variants) theme
git clone https://github.com/MerkeX/korla.git
cd korla && rm *.png *.jpg LICENSE *.md
sudo cp -r * /usr/share/icons/ && cd .. && rm -rf korla/

# Pinbadge theme
git clone https://github.com/MerkeX/pinbadge-icon-theme
cd pinbadge-icon-theme && sudo make install -j${nproc} && cd ..
rm -rf pinbadge-icon-theme

# WhiteSur theme
git clone https://github.com/vinceliuice/WhiteSur-icon-theme
cd WhiteSur-icon-theme && sudo ./install.sh -t all -d /usr/share/icons
cd .. && sudo rm -rf WhiteSur-icon-theme/


echo ">> Finished installing icon packs..." && sleep 2

echo ">> Setting 'LightDM' as login manager..." && sleep 2
sudo xbps-remove lxdm -y
sudo ln -s /etc/sv/dbus /var/service/dbus
sudo ln -s /etc/sv/lightdm /var/service/lightdm

echo ">> Done. Now rebooting..." && sleep 5 && sudo reboot
