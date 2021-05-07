#!/bin/bash
echo '>> Executing postInstall script for "Arch Linux"...' && sleep 2 &&
echo '>> Updating...' && sleep 2 &&
sudo pacman -Syy &&
echo '>> Installing yay...' && sleep 2 &&
sudo pacman -S yay &&
echo ">> Upgrading..." && sleep 2 &&
sudo pacman -Syyu &&
echo '>> Installing other packages...' && sleep 2 &&
yay -S --needed $(cat list_packages.list) &&

# INSTALLIG ATOM PACKAGES
echo ">> Installing ATOM packages" && sleep 2 &&
apm install gitlab-integration gitlab ide-python atom-python-run ide-c-cpp monokai gruvbox gruvbox-dark-ui dracula-ui markdown-preview git-plus

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
