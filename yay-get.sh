#!/bin/bash

sudo pacman -S base-devel

git clone https://aur.archlinux.org/yay.git yay
cd yay
makepkg -si
cd ..
rm -r yay -f
