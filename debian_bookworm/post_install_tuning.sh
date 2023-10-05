#!/bin/bash
echo '>> Executing postInstall script for "Debian Bookworm"...' && sleep 2
cd ~ &&

echo ">> Restoring configs..." && sleep 2 &&
cp -rf .config .conky .idlerc  ~/ &&
echo ">> Done. Now rebooting..." && sleep 5 && sudo reboot
