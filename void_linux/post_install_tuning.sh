#!/bin/bash
echo '>> Executing postInstall script for "Void Linux"...' && sleep 2
cd ~ &&
echo ">> Installing and configuring 'xbps-src'..." && sleep 2
cd /opt/void-packages && ./xbps-src binary-bootstrap &&
echo "XBPS_ALLOW_RESTRICTED=yes" >> etc/conf

# GOOGLE CHROME
./xbps-src pkg google-chrome && sudo xi google-chrome -y

echo ">> Restoring configs..." && sleep 2 &&
cp -rf .config .conky .idlerc  ~/ &&
echo ">> Done. Now rebooting..." && sleep 5 && sudo reboot
