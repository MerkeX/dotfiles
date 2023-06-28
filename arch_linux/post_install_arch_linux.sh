#!/bin/bash
echo '>> Executing postInstall script for "Arch Linux"...' && sleep 2
echo '>> Updating...' && sleep 2
sudo pacman -Syy
echo '>> Installing yay...' && sleep 2
sudo pacman -S --needed --noconfirm yay
echo ">> Upgrading..." && sleep 2
sudo pacman -Syyu --noconfirm
echo '>> Installing other packages...' && sleep 2
yay -S --needed $(cat list_packages.list)

echo ">> Installing fonts..." && sleep 2
cd ./fonts && sudo cp * /usr/local/share/fonts && cd ..

# INSTALLING NEW THEMES
echo '>> Install new themes...' && sleep 2
yay -S --needed git gtk-engines-murrine \
gdk-pixbuf2 libcanberra meson ninja sassc

# Mojave dark
git clone https://github.com/MerkeX/Mojave-kvantum.git
cd Mojave-kvantum && rm *.png LICENSE *.md && sudo cp -r * /usr/share/themes
cd .. && rm -rf Mojave-kvantum

# Yosemite GTK
git clone https://github.com/MerkeX/Yosemite-gtk-theme.git
cd Yosemite-gtk-theme/ && sudo ./Install && cd .. && rm -rf Yosemite-gtk-theme/

# INSTALL SOME THEMES FOR OPENBOX

git clone https://github.com/addy-dclxvi/openbox-theme-collections
cd openbox-theme-collections && rm *.png *.jpg LICENSE *.md
sudo cp -r * /usr/share/themes && cd .. && rm -rf openbox-theme-collections
git clone https://github.com/fikriomar16/OBTheme-Collections.git
cd OBTheme-Collections && rm *.md && sudo cp -r * /usr/share/themes
cd .. && rm -rf OBTheme-Collections

# INSTALLING ICON THEMES
echo ">> Installing icon packs..." && sleep 2

# Win10 Icon Theme
git clone https://github.com/MerkeX/We10X-icon-theme.git
cd We10X-icon-theme
sudo ./install.sh -a -d /usr/share/icons && cd .. && sudo rm -rf We10X-icon-theme/

# MacOs-icons theme (Cinnamon Edition)
git clone https://github.com/MerkeX/McOS-Mint-Cinnamon-Edition.git
cd McOS-Mint-Cinnamon-Edition && rm README.md
sudo cp -r * /usr/share/icons && cd .. && rm -rf McOS-Mint-Cinnamon-Edition/

# OS Catalina icons
git clone https://github.com/MerkeX/Os-Catalina-icons.git
sudo cp -r Os-Catalina-icons /usr/share/icons/Os_Catalina


# Vibrancy colors
wget http://download1640.mediafire.com/9e0fqjgl776g/i25blth6npp23h5/Vibrancy-Colors-GTK-Icon-Theme-v-2-7.tar.gz
sudo cp -r Vibrancy-Colors-GTK-Icon-Theme-v-2-7.tar.gz /usr/share/icons
cd /usr/share/icons/
sudo tar xf Vibrancy-Colors-GTK-Icon-Theme-v-2-7.tar.gz
sudo rm 'Copyrights&Licenses.txt' README-Manual.txt *.tar.gz && cd ~/temp
sudo rm -rf ~/temp
echo ">> Finished installing icon packs..." && sleep 2
echo ">> Done. Now rebooting..." && sleep 5 && sudo reboot
