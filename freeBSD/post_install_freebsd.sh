pkg update &&
pkg install gedit xfce-4.16 git chromium mousepad firefox gimp ghex plank feh libreoffice evince ristretto\
 gcc gdb cmake node npm libgnome-keyring ffmpeg emacs conky audacity qbittorrent vscode xfce4-goodies\
 bash radeontop radeontool dosbox autoconf automake brasero bzip2 fakeroot gawk links wget\
 gnugrep inxi gvfs gzip htop slim slim-themes lxappearance openbox picom obconf obconf-qt  tint2 mixxx e2fsprogs-libblkid\
 nano neofetch cmatrix avidemux-qt5 gsmartcontrol p7zip nikto nmap aircrack-ng playerctl unrar unzip\
 rclone gsed gtar sudo vim vlc vice py37-menulibre wine wine-mono wine-gecko winetricks cmus curl opencl-clang\
 xorg xf86-video-ati pavucontrol pavumeter audacious rpm4 emulators/linux_base-c7 fusefs-ntfs electron11\
 lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings drm-kmod numix-gtk-theme numix-icon-theme\ 
 numix-icon-theme-circle galculator xed blender inkscape\
 cheese kodi hexchat telegram-desktop texstudio

echo "Enabling lightdm..."
sudo echo 'dbus_enable="YES"' >> /etc/rc.conf
sudo echo '#slim_enable="YES"' >> /etc/rc.conf
sudo echo 'lightdm_enable="YES"' >> /etc/rc.conf
sudo echo 'linux_enable="YES"' >> /etc/rc.conf
sudo echo 'kld_list="fusefs"' >> /etc/rc.conf
sudo echo '#kld_list="/boot/modules/radeonkms.ko"' >> /etc/rc.conf
sudo echo 'kld_list="radeonkms"' >> /etc/rc.conf

sudo echo "add path 'dri/*' mode 0666 group video" >> /etc/devfs.conf
sudo echo "add path 'drm/*' mode 0666 group video" >> /etc/devfs.conf


echo "Initializing LCL (Linux Compatibility Layer)..." && sleep 2
sudo mkdir -p /var/lib/rpm
sudo /usr/local/bin/rpm --initdb

# Installing ATOM
#echo 'Installing atom...'
#sudo portsnap fetch && sudo
#git clone https://github.com/tagattie/FreeBSD-Atom && cd FreeBSD-Atom/editors/atom && make install clean

#echo ">> Installing ATOM packages" && sleep 2
#apm install gitlab-integration gitlab ide-python atom-python-run ide-c-cpp monokai gruvbox gruvbox-dark-ui dracula-ui markdown-preview git-plus

# INSTALLING NEW THEMES
echo '>> Install prerequisites...' && sleep 2
sudo pkg install git gtk-engines2 sassc sudo libcanberra-gtk3 glib meson ninja

# Mojave-gtk-theme
echo '>> Install new themes...' && sleep 2
mkdir ~/temp && cd ~/temp
git clone https://github.com/MerkeX/Mojave-gtk-theme.git
cd Mojave-gtk-theme && sudo ./install.sh -d /usr/local/share/themes && cd .. && rm -rf Mojave-gtk-theme

# Yosemite GTK
git clone https://github.com/MerkeX/Yosemite-gtk-theme.git
cd Yosemite-gtk-theme/ && sudo ./Install  -d /usr/local/share/themes && cd .. && rm -rf Yosemite-gtk-theme/

# macOS Dark
git clone https://github.com/MerkeX/macOS-Dark.git && sudo cp -r macOS-Dark/ /usr/local/share/themes

#WhiteSur theme
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
cd WhiteSur-gtk-theme && sudo ./install.sh -d /usr/local/share/themes && cd .. && rm -rf WhiteSur-gtk-theme/

# INSTALL SOME THEMES FOR OPENBOX

git clone https://github.com/addy-dclxvi/openbox-theme-collections
cd openbox-theme-collections && rm *.png *.jpg LICENSE *.md && sudo cp -r * /usr/local/share/themes && cd .. && rm -rf openbox-theme-collections
git clone https://github.com/fikriomar16/OBTheme-Collections.git
cd OBTheme-Collections && rm *.md && sudo cp -r * /usr/local/share/themes && cd .. && rm -rf OBTheme-Collections

# INSTALLING ICON THEMES
echo ">> Installing icon packs..." && sleep 2

# Breeze-Splendent icons
git clone https://github.com/MerkeX/Breeze-Splendent-Icons.git
cd Breeze-Splendent-Icons && rm README.md LICENSE && sudo cp -r * /usr/share/icons && cd .. && rm -rf Breeze-Splendent-Icons/

# Breeze-Honeyicons
git clone https://github.com/MerkeX/Breeze-Honey-Icons.git
cd Breeze-Honey-Icons && rm README.md LICENSE && sudo cp -r * /usr/share/icons && cd .. && rm -rf Breeze-Honey-Icons/

# Breeze-Noir-Themes (Black-blue & White-Blue) icons
git clone https://github.com/MerkeX/Breeze-Noir-Icons.git
cd Breeze-Noir-Icons && rm README.md LICENSE && sudo cp -r * /usr/share/icons && cd .. && rm -rf Breeze-Noir-Icons/

# Mojave-CT icon
git clone https://github.com/MerkeX/Mojave-CT.git && sudo cp -r Mojave-CT /usr/share/icons

# McMojave Circle
git clone https://github.com/MerkeX/McMojave-circle.git
cd McMojave-circle && sudo ./install.sh --all -d /usr/share/icons && cd .. && rm -rf McMojave-circle

# MacOs-icons theme (Cinnamon Edition)
git clone https://github.com/MerkeX/McOS-Mint-Cinnamon-Edition.git &&
cd McOS-Mint-Cinnamon-Edition && rm README.md && sudo cp -r * /usr/share/icons && cd .. && rm -rf McOS-Mint-Cinnamon-Edition/

# OS Catalina icons
git clone https://github.com/MerkeX/Os-Catalina-icons.git && sudo cp -r Os-Catalina-icons /usr/share/icons/Os_Catalina

# Tela icon
git clone https://github.com/MerkeX/Tela-icon-theme.git
cd Tela-icon-theme && sudo ./install.sh -a && cd .. && rm -rf Tela-icon-theme

# Korla (and his variants) theme
git clone https://github.com/MerkeX/korla.git
cd korla && rm *.png *.jpg LICENSE *.md && sudo cp -r * /usr/share/icons/ && cd .. && rm -rf korla/

# Pinbadge theme
git clone https://github.com/MerkeX/pinbadge-icon-theme
cd pinbadge-icon-theme && sudo make install && cd .. && rm -rf pinbadge-icon-theme

# Paper theme
git clone https://github.com/MerkeX/paper-icon-theme.git
cd paper-icon-theme && meson "build" --prefix=/usr && sudo ninja -C "build" install && cd .. && rm -rf paper-icon-theme/

#WhiteSur theme
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
cd WhiteSur-icon-theme && sudo ./install.sh && cd .. && rm -rf WhiteSur-icon-theme/

cd ~ && rm -rf temp/
