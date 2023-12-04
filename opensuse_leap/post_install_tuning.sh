#!/bin/bash
echo '>> Executing postInstall script for "OpenSUSE Leap 15.x"...' && sleep 2
cd ~ &&

echo ">> Restoring configs..." && sleep 2 &&
cp -rf .config .conky .idlerc  ~/ &&
echo ">> Done."
