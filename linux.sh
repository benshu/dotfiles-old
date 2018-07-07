#! /usr/bin/env bash

# Set Caps Lock as escape
#echo "setxkbmap -option caps:escape" 

# Add required repositories
#sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' >> /etc/apt/sources.list.d/arc-theme.list"
#sudo sh -c "echo 'deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe' >> /etc/apt/sources.list"
#sudo add-apt-repository ppa:moka/daily
sudo add-apt-repository ppa:no1wantdthisname/ppa
sudo add-apt-repository ppa:george-edison55/cmake-3.x
sudo apt-get install software-properties-common

#sudo apt-get --allow-unauthenticated install sur5r-keyring
# Update all repos
sudo apt-get update
sudo apt-get upgrade


sudo apt-get install git
sudo apt-get install tmux
sudo apt-get install vim
sudo apt-get install exuberant-ctags
#sudo apt-get install xpdf
#sudo apt-get install lynx
sudo apt-get install moreutils
sudo apt-get install python-pip
sudo apt-get install python-pip3
sudo apt-get install build-essential
sudo apt-get install python-dev python3-dev
sudo apt-get install htop
sudo apt-get install cmake
sudo apt-get install figlet
sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#        _                      _   _   _                 
# __   _(_)_ __ ___    ___  ___| |_| |_(_)_ __   __ _ ___ 
# \ \ / / | '_ ` _ \  / __|/ _ \ __| __| | '_ \ / _` / __|
#  \ V /| | | | | | | \__ \  __/ |_| |_| | | | | (_| \__ \
#   \_/ |_|_| |_| |_| |___/\___|\__|\__|_|_| |_|\__, |___/
#                                               |___/     

mkdir ~/.vim
cd ~/.vim
mkdir swaps colors backups bundle undo

# Download powerline fonts
mkdir ~/.fonts
cd ~/.fonts
git clone https://github.com/powerline/fonts.git powerline-fonts
cd powerline-fonts && ./install.sh

#  ____  _      _             
# |  _ \(_) ___(_)_ __   __ _ 
# | |_) | |/ __| | '_ \ / _` |
# |  _ <| | (__| | | | | (_| |
# |_| \_\_|\___|_|_| |_|\__, |
#                       |___/ 

# Instal i3 window manager
#sudo apt-get install i3
#sudo apt-get install i3blocks
# Download nice font...
mkdir ~/.fonts && cd ~/.fonts && curl -fsSL https://raw.github.com/supermarin/YosemiteSanFranciscoFont/master/install
#sudo apt-get install fontconfig-infinality
#sudo apt-get install rofi
#sudo apt-get install arc-theme
#sudo apt-get install lxappearance

# Numix icon and theme

sudo add-apt-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get install numix-gtk-theme numix-icon-theme-circle

## Install Moka icon theme
#sudo apt-get update
#sudo apt-get install moka-icon-theme
#sudo apt-get install compton
## Better font rendering on linux
#sudo apt-get update
#sudo apt-get install fontconfig-infinality

# TODO

# * Install virtualbox guest-additions
# Set caps lock as escape 
# Should be done premenantly via
setxkbmap -option caps:escape

