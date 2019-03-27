.PHONY: dotfiles \
	bash \
	bin \
	dunst \
	git \
	i3 \
	nvim \
	polybar \
	pyls \
	rofi \
	shell \
	termite \
	tmux \
	udev \
	wget \
	yapf \
	zsh

arch-base:
	sudo pacman -S netowrkmanager
	sudo pacman -S nm-applet
	systemctl disable dhcpcd.service
	systemctl enable NetworkManager.service
	sudo pacman -S xdg-user-dirs
	xdg-user-dirs-update
	sudo pacman -S git
	mkdir ~/src
	cd ~/src
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si

init:
	cd $HOME
	sudo pacman -S git
	git clone https://github.com/benshu/dotfiles.git
	cd dotfiles
	sudo pacman -S stow

install:
	sudo pacman -S \
		zsh \
		tmux \
		termite \
		i3-gaps \
		dunst \
		neovim \
		rofi
	yay -S \
		polybar \
		ttf-fira-code \
		ttf-fira-mono \
		nerd-fonts-fira-mono
	mkdir -p $HOME/Pictures/wallpapers
	curl -L http://i.imgur.com/Z6kdWmA.jpg > $HOME/Pictures/wallpapers/jamie.jpg

dotfiles: zsh
	stow zsh
	stow bash
	stow termite
	stow dunst
	stow git
	stow i3
	stow nvim
	stow polybar
	stow rofi
	stow shell
	stow termite
	stow tmux
	stow udev
	stow yapf

zsh:
	echo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	echo git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
	echo ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
	echo mv ~/.zshrc ~/.zshrc_old
