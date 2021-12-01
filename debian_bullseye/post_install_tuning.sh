#!/bin/bash
echo '>> Executing postInstall script for "Debian Bullseye"...' && sleep 2
cd ~ &&

# INSTALLIG ATOM PACKAGES
echo ">> Installing ATOM packages" && sleep 2
apm install gitlab-integration gitlab ide-python atom-python-run ide-c-cpp \
monokai gruvbox gruvbox-dark-ui dracula-ui  sync-settings

echo ">> Restoring configs..." && sleep 2 &&
cp -rf .config .conky .idlerc  ~/ &&
echo ">> Done. Now rebooting..." && sleep 5 && sudo reboot
