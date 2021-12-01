pkg update
pkg install aircrack-ng alacritty audacious audacity autoconf automake avidemux-qt5 \
bash blender brasero bzip2 cheese chromium cmake cmatrix cmus conky curl dosbox \
drm-kmod e2fsprogs-libblkid electron12 emacs emulators/linux_base-c7 evince \
fakeroot feh ffmpeg firefox fusefs-ntfs galculator gawk gcc gdb gedit ghex gimp git \
gnugrep gsed gsmartcontrol gtar gvfs gzip hexchat hplip htop inkscape inxi ipmitool \
keepassxc kodi libgnome-keyring libreoffice lightdm lightdm-gtk-greeter \
lightdm-gtk-greeter-settings links lxappearance mangohud mate-base mate-desktop \
mate-utils mixxx mousepad nano neofetch nikto nmap node npm obconf obconf-qt openbox \
opencl-clang-llvm12 p7zip pavucontrol pavumeter picom plank playerctl qbittorrent \
radeontool radeontop rclone ristretto rpm4 slim slim-themes sudo telegram-desktop \
texstudio thunderbird tint2 unrar unzip vim vlc vscode wget wine wine-gecko wine-mono \
winetricks xed xf86-video-amdgpu xfce4-goodies xfce-4.16 xorg zsh
echo "Enabling services at boot..."
sudo echo 'dbus_enable="YES"' >> /etc/rc.conf
sudo echo '#slim_enable="YES"' >> /etc/rc.conf
sudo echo 'lightdm_enable="YES"' >> /etc/rc.conf
sudo echo 'linux_enable="YES"' >> /etc/rc.conf
sudo echo 'kld_list="fusefs"' >> /etc/rc.conf
sudo echo '#kld_list="radeonkms"' >> /etc/rc.conf
sudo echo 'kld_list="amdgpu"' >> /etc/rc.conf
sudo echo '#kld_list="i915"' >> /etc/rc.conf

sudo echo "add path 'dri/*' mode 0666 group video" >> /etc/devfs.conf
sudo echo "add path 'drm/*' mode 0666 group video" >> /etc/devfs.conf

sudo echo 'amdtemp_load="YES"' >> /boot/loader.conf

echo "Initializing LCL (Linux Compatibility Layer)..." && sleep 2
sudo mkdir -p /var/lib/rpm
sudo /usr/local/bin/rpm --initdb

# INSTALLING NEW THEMES
echo '>> Install prerequisites...' && sleep 2
sudo pkg install git gtk-engines2 sassc sudo libcanberra-gtk3 glib meson ninja
sudo pkg install numix-gtk-theme numix-icon-theme numix-icon-theme-circle

# Mojave-gtk-theme
echo '>> Install new themes...' && sleep 2
mkdir ~/temp && cd ~/temp
git clone https://github.com/MerkeX/Mojave-gtk-theme.git
cd Mojave-gtk-theme && sudo ./install.sh -d /usr/local/share/themes
cd .. && rm -rf Mojave-gtk-theme

# Yosemite GTK
git clone https://github.com/MerkeX/Yosemite-gtk-theme.git
cd Yosemite-gtk-theme/ && sudo ./Install  -d /usr/local/share/themes
cd .. && rm -rf Yosemite-gtk-theme/

# WhiteSur theme
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
cd WhiteSur-gtk-theme && sudo ./install.sh -d /usr/local/share/themes
cd .. && rm -rf WhiteSur-gtk-theme/

# INSTALL SOME THEMES FOR OPENBOX

git clone https://github.com/addy-dclxvi/openbox-theme-collections
cd openbox-theme-collections && rm *.png *.jpg LICENSE *.md
sudo cp -r * /usr/local/share/themes && cd .. && rm -rf openbox-theme-collections
git clone https://github.com/fikriomar16/OBTheme-Collections.git
cd OBTheme-Collections && rm *.md && sudo cp -r * /usr/local/share/themes
cd .. && rm -rf OBTheme-Collections

# INSTALLING ICON THEMES
echo ">> Installing icon packs..." && sleep 2

# Breeze-Splendent icons
git clone https://github.com/MerkeX/Breeze-Splendent-Icons.git
cd Breeze-Splendent-Icons && rm README.md LICENSE
sudo cp -r * /usr/local/share/icons && cd .. && rm -rf Breeze-Splendent-Icons/

# Breeze-Honeyicons
git clone https://github.com/MerkeX/Breeze-Honey-Icons.git
cd Breeze-Honey-Icons && rm README.md LICENSE
sudo cp -r * /usr/local/share/icons && cd .. && rm -rf Breeze-Honey-Icons/

# Breeze-Noir-Themes (Black-blue & White-Blue) icons
git clone https://github.com/MerkeX/Breeze-Noir-Icons.git
cd Breeze-Noir-Icons && rm README.md LICENSE
sudo cp -r * /usr/local/share/icons && cd .. && rm -rf Breeze-Noir-Icons/

# Mojave-CT icon
git clone https://github.com/MerkeX/Mojave-CT.git
sudo cp -r Mojave-CT /usr/local/share/icons

# McMojave Circle
git clone https://github.com/MerkeX/McMojave-circle.git
cd McMojave-circle && sudo ./install.sh --all -d /usr/local/share/icons
cd .. && rm -rf McMojave-circle

# MacOs-icons theme (Cinnamon Edition)
git clone https://github.com/MerkeX/McOS-Mint-Cinnamon-Edition.git
cd McOS-Mint-Cinnamon-Edition && rm README.md
sudo cp -r * /usr/local/share/icons && cd .. && rm -rf McOS-Mint-Cinnamon-Edition/

# OS Catalina icons
git clone https://github.com/MerkeX/Os-Catalina-icons.git
sudo cp -r Os-Catalina-icons /usr/local/share/icons/Os_Catalina

# Tela icon
git clone https://github.com/MerkeX/Tela-icon-theme.git
cd Tela-icon-theme && sudo ./install.sh -a -d /usr/local/share/icons
cd .. && rm -rf Tela-icon-theme

# Korla (and his variants) theme
git clone https://github.com/MerkeX/korla.git
cd korla && rm *.png *.jpg LICENSE *.md && sudo cp -r * /usr/local/share/icons/
cd .. && rm -rf korla/

# Pinbadge theme
git clone https://github.com/MerkeX/pinbadge-icon-theme
cd pinbadge-icon-theme && sudo make install -j${nproc} && cd ..
rm -rf pinbadge-icon-theme

# Paper theme
git clone https://github.com/MerkeX/paper-icon-theme.git
cd paper-icon-theme && meson "build" --prefix=/usr
sudo ninja -C "build" install && cd .. && rm -rf paper-icon-theme/

# WhiteSur theme
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
cd WhiteSur-icon-theme && sudo ./install.sh -d /usr/local/share/icons
cd .. && rm -rf WhiteSur-icon-theme/

cd ~ && rm -rf temp/
