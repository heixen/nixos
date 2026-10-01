#!/usr/bin/env bash
set -e

mkdir -p .config images nixos

cp -a ~/.config/. .config/
cp -a ~/wallpapers/. images/
sudo cp -a /etc/nixos/. nixos/

echo "Backup complete."
