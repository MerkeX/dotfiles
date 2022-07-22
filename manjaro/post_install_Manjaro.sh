#!/bin/bash
echo '>> Executing postInstall script for "Manjaro"...' && sleep 2
echo '>> Updating...' && sleep 2
sudo pacman -Syy
echo '>> Installing yay...' && sleep 2
sudo pacman -S yay --needed
echo '>> Installing other packages...' && sleep 2
yay -S --needed --noconfirm accountsservice acpi acpid aircrack-ng alsa-firmware \
alsa-utils amd-ucode android-tools android-udev apm apparmor arc-dark-xfce4-terminal \
arduino arduino-builder arduino-docs audacity autoconf automake avahi avidemux-cli \
avidemux-qt b43-fwcutter base bash-completion bison blender blueman brasero \
btrfs-progs bzip2 catfish cmake cmatrix cmus code conky conky-i3 cool-retro-term \
coreutils cpupower crda cronie cryptsetup deepin-terminal device-mapper dhclient \
dhcpcd diffutils discord dmidecode dmraid dnsmasq dosbox dosfstools dotnet-host-bin \
dotnet-runtime-bin dotnet-sdk-bin e2fsprogs easymp3gain-gtk2 ecryptfs-utils \
efibootmgr electrum emacs engrampa etcher evince exfat-utils exo f2fs-tools fakeroot \
feh ffmpeg ffmpegthumbnailer file filesystem filezilla findutils firefox firefox-i18n-it \
flex galculator-gtk2 garcon gawk gcc gcc-libs gdb gedit gettext ghex gimp gitkraken \
glava glibc gnome-icon-theme gnome-keyring gnome-themes-extra google-chrome-stable  \
gparted grep grub grub-theme-manjaro grub-theme-vimix gsmartcontrol gst-libav \
gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly gtkhash-thunar \
gufw gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb gzip haveged hexchat \
htop i3-gaps i3blocks i3exit i3lock i3status-manjaro inetutils inkscape inxi iproute2 \
iptables iputils ipw2100-fw ipw2200-fw jdk8-openjdk jfsutils jre8-openjdk \
jre8-openjdk-headless kernel-alive kodi less lib32-gnutls lib32-libcurl-gnutls \
lib32-libva-intel-driver lib32-libva-mesa-driver lib32-libva-vdpau-driver \
lib32-mesa-demos lib32-mesa-vdpau lib32-opencl-mesa lib32-vulkan-intel \
lib32-vulkan-radeon libdvdcss libgsf libopenraw libreoffice-still libva-intel-driver \
libva-mesa-driver libva-vdpau-driver libzip licenses light-locker lightdm \
lightdm-gtk-greeter lightdm-gtk-greeter-settings lightdm-webkit2-greeter \
lightdm-webkit2-theme-obsidian lightdm-webkit2-theme-sapphire \
lightdm-webkit-theme-litarvan links linux-firmware linux510 linux510-headers linux515 \
linux515-headers logrotate lsb-release lvm2 lxappearance m4 make man-db man-pages \
manjaro-alsa manjaro-application-utility manjaro-browser-settings \
manjaro-documentation-en manjaro-firmware manjaro-hello manjaro-hotfixes \
manjaro-printer manjaro-pulse manjaro-release manjaro-settings-manager \
manjaro-settings-manager-notifier manjaro-systems matcha-gtk-theme mdadm \
memtest86+ menulibre mesa-demos mesa-vdpau mhwd mhwd-db microsoft-edge-stable-bin \
mixxx mkinitcpio-openswap mlocate mobile-broadband-provider-info modemmanager \
mousepad mp3gain mpc mpd mtpfs mugshot nano neofetch neovim neovim-qt \
network-manager-applet networkmanager networkmanager-openconnect \
networkmanager-openvpn networkmanager-pptp networkmanager-vpnc nfs-utils \
nikto nmap noto-fonts noto-fonts-cjk nss-mdns ntfs-3g ntp numlockx obconf obmenu3\
openbox opencl-mesa openresolv openssh orage os-prober pahole p7zip \
pacman pamac-gtk patch pavucontrol pciutils pcmanfm perl perl-file-mimeinfo picom \
pkgconf playerctl playonlinux polybar poppler-data poppler-glib powerline powertop \
procps-ng psmisc pulseaudio-bluetooth pulseaudio-ctl pulseaudio-zeroconf python2-requests \
python-pycurl qbittorrent qt4 radeontool rclone reiserfsprogs ristretto rofi rsync \
s-nail samba sed shadow signal-desktop skypeforlinux-stable-bin spectre-meltdown-checker \
speedtest-cli spotify steam-manjaro sudo sysfsutils systemd-fsck-silent systemd-sysvcompat \
tar telegram-desktop terminator terminus-font texinfo texstudio thunar thunar-archive-plugin \
thunar-media-tags-plugin thunar-volman thunderbird timeshift timidity++ tint2 tk tlp \
tf-dejavu ttf-droid ttf-font-awesome ttf-inconsolata ttf-indic-otf ttf-liberation tumbler \
udiskie udisks2 unace unrar usb_modeswitch usbutils util-linux vi vlc vulkan-intel \
wallpapers-2018 wallpapers-juhraya wget which wine wine-gecko wine-mono \
wpa_supplicant xarchiver xclip xcursor-simpleandsoft xcursor-vanilla-dmz-aa \
xdg-user-dirs xdg-utils xf86-input-elographics xf86-input-evdev xf86-input-libinput \
xf86-input-void xf86-video-amdgpu xf86-video-intel xf86-video-vmware xfburn xfce4-appfinder \
xfce4-battery-plugin xfce4-clipman-plugin xfce4-cpufreq-plugin xfce4-cpugraph-plugin \
xfce4-dict xfce4-diskperf-plugin xfce4-fsguard-plugin xfce4-genmon-plugin \
xfce4-mailwatch-plugin xfce4-mount-plugin xfce4-mpc-plugin xfce4-netload-plugin \
xfce4-notes-plugin xfce4-notifyd xfce4-panel xfce4-power-manager xfce4-pulseaudio-plugin \
xfce4-screenshooter xfce4-sensors-plugin xfce4-session xfce4-settings \
xfce4-smartbookmark-plugin xfce4-systemload-plugin xfce4-taskmanager \
xfce4-terminal xfce4-time-out-plugin xfce4-timer-plugin xfce4-verve-plugin \
xfce4-wavelan-plugin xfce4-weather-plugin xfce4-whiskermenu-plugin \
xfce4-xkb-plugin xfconf xfdesktop xfsprogs xfwm4 xiccd xorg-server xorg-twm \
xorg-xinit xorg-xkill yelp zensu zsh

echo ">> Installing fonts..." && sleep 2
cd ./fonts && sudo cp * /usr/local/share/fonts && cd ..

# INSTALLING NEW THEMES
echo '>> Install new themes...' && sleep 2
sudo pacman -S --needed --noconfirm git gtk-engine-murrine gtk-engines sassc \
libcanberra glib2 meson ninja

yay -S --needed --noconfirm arc-gtk-theme arc-maia-icon-theme arc-solid-gtk-theme \
arc-themes-breath arc-themes-maia arc-themes-solid-breath arc-themes-solid-maia \
breeze-icons gtk-theme-macos-mojave kripton-theme-git mcmojave-circle-icon-theme \
mcmojave-cursors mojave-ct-icon-theme mojave-gtk-theme numix-circle-icon-theme-git \
numix-gtk-theme numix-icon-theme-git numix-themes-electric numix-themes-green \
paper-icon-theme tela-icon-theme win10x-icon-theme-git yosemite-gtk-theme

# INSTALL SOME THEMES FOR OPENBOX

git clone https://github.com/addy-dclxvi/openbox-theme-collections
cd openbox-theme-collections && rm *.png *.jpg LICENSE *.md
sudo cp -r * /usr/share/themes && cd .. && rm -rf openbox-theme-collections
git clone https://github.com/fikriomar16/OBTheme-Collections.git
cd OBTheme-Collections && rm *.md && sudo cp -r * /usr/share/themes && cd ..
rm -rf OBTheme-Collections

# INSTALLING ICON THEMES
echo ">> Installing icon packs..." && sleep 2

# OS Catalina icons
git clone https://github.com/MerkeX/Os-Catalina-icons.git
sudo cp -r Os-Catalina-icons /usr/share/icons/Os_Catalina

# Korla (and his variants) theme
git clone https://github.com/MerkeX/korla.git
cd korla && rm *.png *.jpg LICENSE *.md
sudo cp -r * /usr/share/icons/ && cd .. && rm -rf korla/

# Pinbadge theme
git clone https://github.com/MerkeX/pinbadge-icon-theme
cd pinbadge-icon-theme && sudo make install -j${nproc} && cd ..
rm -rf pinbadge-icon-theme

sudo rm -rf ~/temp &&
echo ">> Finished installing icon packs..." && sleep 2
echo ">> Done. Now rebooting..." && sleep 5 && sudo reboot
