#!/bin/bash
    
# -----------------------------------------------------------------------------------------------------------------
# appearence and power

# disable powersave
gsettings set org.gnome.desktop.session idle-delay 0

# set wallpaper
cp ubuntu-blue.jpeg ~/Pictures/ubuntu-blue.jpeg
gsettings set org.gnome.desktop.background picture-uri ~/Pictures/ubuntu-blue.jpeg

# set color theme 
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-blue-dark'

# icon style 
gsettings set org.gnome.desktop.interface icon-theme 'Yaru-blue-dark'

# -----------------------------------------------------------------------------------------------------------------
# base packages
sudo apt install build-essential -y
sudo apt install npm -y

# -----------------------------------------------------------------------------------------------------------------
# zsh

# install
sudo apt install zsh -y

# install Oh My Zsh 
yes | sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# intall plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

sudo apt-get install fonts-powerline -y

# -----------------------------------------------------------------------------------------------------------------
# alacrityy

# install
sudo add-apt-repository ppa:aslatter/ppa -y
sudo apt install alacritty -y

# set as default terminal
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $(which alacritty) 50
echo -ne '\n' | sudo update-alternatives --config x-terminal-emulator

# -----------------------------------------------------------------------------------------------------------------
# tmux
sudo apt install tmux -y
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# -----------------------------------------------------------------------------------------------------------------
# neovim
sudo apt install ripgrep -y
sudo npm i -g bash-language-server

echo -ne '\n' | sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim -y

# -----------------------------------------------------------------------------------------------------------------
# nerd fonts
source nerd-fonts.sh

# -----------------------------------------------------------------------------------------------------------------
# configuration finish 

# set zsh as default shell
chsh -s $(which zsh)

# copy zsh sittings
cp ../zsh/.zshrc ~

# copy alacritty settings
mkdir ~/.config/alacritty
cp ../alacritty/alacritty.toml ~/.config/alacritty

# copy nvim settings
cp -r ../nvim ~/.config/nvim

# copy tmux sittings
cp ../tmux/.tmux.conf ~

exit

