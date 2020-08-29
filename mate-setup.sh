#!/bin/bash

if [ $EUID = 0 ]; then
	echo "Can not be root"
	exit 1
fi

pacman -Qi yay &> /dev/null
if [ $? -ne 0 ]; then
	echo yay needs to be installed
	exit 1
fi

DIR="`dirname $0`"

mkdir -p ~/.themes
cp $DIR/Gnome-Dark ~/.themes -rf
gsettings set org.mate.interface gtk-theme Gnome-Dark

pacman -Qi brisk-menu &> /dev/null
if [ $? -ne 0 ]; then
	yay -S brisk-menu
fi
gsettings set com.solus-project.brisk-menu dark-theme true

mkdir -p ~/.local/share/backgrounds
cp -f ${DIR}/archlinux-background.jpg ~/.local/share/backgrounds/archlinux-background.jpg
gsettings set org.mate.background picture-filename ~/.local/share/backgrounds/archlinux-background.jpg


