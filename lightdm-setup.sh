#!/bin/bash

if [ $EUID -ne 0 ]; then
	echo "You must be root"
	exit 1
fi

pacman -Qi git >& /dev/null
if [ $? -ne 0 ]; then
	echo git has to be installed
	exit 1
fi
DIR=`dirname $0`
packages=""

pacman -Qi xorg-server &> /dev/null
if [ $? -ne 0 ]; then
	echo "Adding xorg to downloads"
	packages="$packages xorg"
fi

pacman -Qi lightdm &> /dev/null
if [ $? -ne 0 ]; then
	echo "Adding lightdm to downloads"
	packages="$packages lightdm"
fi

pacman -Qi lightdm-webkit2-greeter &> /dev/null
if [ $? -ne 0 ]; then
	echo "Adding lightdm-webkit2-greeter to downloads"
	packages="$packages lightdm-webkit2-greeter"

	if [ $? -ne 0 ]; then echo "Failure downloading packages"; exit 0; fi
fi

if [ -n "$packages" ]; then 
	pacman -S $packages
fi

systemctl enable lightdm -f

echo "Downloading theme"
git clone https://github.com/paysonwallach/aqua-lightdm-webkit-theme aqua
cp -rf aqua /usr/share/lightdm-webkit/themes
rm -r aqua

echo "Configuring lightdm theme"
sed -i -E 's/^\#?greeter-session=.*$/greeter-session=lightdm-webkit2-greeter/' /etc/lightdm/lightdm.conf
sed -i -E 's/webkit_theme\s*.*$/webkit_theme = aqua/' /etc/lightdm/lightdm-webkit2-greeter.conf
sed -i -E 's/^\#?user-session=.*$/user-session=mate/' /etc/lightdm/lightdm.conf

cp ${DIR}/arch-wallpaper.png /usr/share/backgrounds/current.png
sed -i 's/\/usr\/share\/backgrounds\/current/\/usr\/share\/backgrounds\/current.png/' /usr/share/lightdm-webkit/themes/aqua/resources/css/style.css
