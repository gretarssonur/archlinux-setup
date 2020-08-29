#!/bin/bash


if [ $# -ne 2 ]; then 
	echo "Usage:"
	echo "./allow-remote-desktop --enable <mac address>"
	echo "./allow-remote-desktop --disable <mac address>"
	exit 1
fi


if [ "$1" = "--enable" ]; then
	sudo iptables -A INPUT -p tcp --destination-port 5900 -m mac --mac-source $2 -j ACCEPT
fi


if [ "$1" = "--disable" ]; then
	sudo iptables -D INPUT -p tcp --destination-port 5900 -m mac --mac-source $2 -j ACCEPT
fi

