#!/bin/bash
folder=$1

mv ~/.config/$folder ~/dotfiles/config/$folder

mkdir ~/.config/$folder

for file in $(ls ~/dotfiles/config/$folder/); do
    ln -s /home/hagay/dotfiles/config/$folder/$file /home/hagay/.config/$folder/$file
done
