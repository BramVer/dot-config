#!/bin/bash
# TODO: i3lock-next copy and install
mkdir dot-files
mkdir dot-files/.config
mkdir dot-files/.config/i3
mkdir dot-files/.config/polybar
mkdir dot-files/.config/dunst
mkdir dot-files/.config/terminator

cp -r ~/.config/i3 dot-files/.config/i3
cp -r ~/.config/polybar dot-files/.config/polybar
cp -r ~/.config/dunst dot-files/.config/dunst
cp -r ~/.config/terminator dot-files/.config/terminator
cp -r ~/.cheat dot-files/.cheat

cp ~/.config/compton.conf dot-files/.config/compton.conf
cp ~/.Xresources dot-files/.Xresources
cp ~/.zshrc dot-files/.zshrc