#!/bin/bash

set -e

ln -s $(pwd)/dot-files/.config/ranger          	$HOME/.config
ln -s $(pwd)/dot-files/.config/i3               $HOME/.config
ln -s $(pwd)/dot-files/.config/polybar          $HOME/.config
ln -s $(pwd)/dot-files/.config/dunst            $HOME/.config
ln -s $(pwd)/dot-files/.config/terminator       $HOME/.config 
ln -s $(pwd)/dot-files/.config/compton.conf     $HOME/.config/compton.conf 
ln -s $(pwd)/dot-files/.config/sublime-text-3/Packagers/User   $HOME/.config/sublime-text-3/Packages

ln -s $(pwd)/dot-files/.cheat                   $HOME/.cheat 
ln -s $(pwd)/dot-files/.Xresources              $HOME/.Xresources
ln -s $(pwd)/dot-files/.zshrc                   $HOME/.zshrc

xrdb $HOME/.Xresources
