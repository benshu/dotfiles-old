#!/bin/bash
folder=$1

mv ~/.config/$folder ~/dotfiles/config/$folder

mkdir ~/.config/$folder

for file in $(ls ~/dotfiles/config/$folder/); do
    ln -s $HOME/dotfiles/config/$folder/$file $HOME/.config/$folder/$file
done
