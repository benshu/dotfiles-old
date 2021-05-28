sudo sed -i s/^#Color$/Color/ /etc/pacman.conf
sudo pacman -S \
	alacritty \
	bind \
	bluez \
	bluez-utils \
	compton \
	copyq \
	diff-so-fancy \
	docker \
	dunst \
	feh \
	flameshot \
	fzf \
	github-cli \
	graphviz \
	htop \
	i3-gaps \
	iwd \
	meld \
	neovim \
	network-manager-applet \
	pavucontrol \
	pulseaudio \
	pulseaudio-alsa \
	pulseaudio-bluetooth \
	python \
	python-pip \
	ranger \
	rclone \
	rofi \
	stow \
	strace \
	tmux \
	udisks2 \
	xorg \
	xorg-xinit \
	xsel \
	zsh \
	fd \
	picom-git




yay -S \
	polybar \
	ttf-fira-code \
	ttf-fira-mono \
	nerd-fonts-fira-mono \
	keepassxc \
	visual-studio-code-insiders \
	fpp-git \
	google-chrome \
	universal-ctags-git \
	docker-compose-bin \

work_aur = (
	robo3t-bin
	zoom
)
