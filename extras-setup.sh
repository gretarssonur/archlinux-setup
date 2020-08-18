#!/bin/bash

DIR=`dirname $0`
cp -f ${DIR}/.bashrc ~

git config --global core.editor 'vim'


gsettings set org.mate.Marco.window-keybindings toggle-maximized '<Alt>f'
gsettings set org.mate.Marco.window-keybindings tile-to-side-e '<Mod4>Right'
gsettings set org.mate.Marco.window-keybindings tile-to-side-w '<Mod4>Left'
