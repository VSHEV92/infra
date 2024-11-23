#!/bin/bash

# -----------------------------------------------------------------------------------------------------------------
# appearence and power
gsettings set org.gnome.desktop.session idle-delay 0                           # disable powersave
gsettings set org.gnome.desktop.background picture-uri `pwd`/ubuntu-blue.jpeg  # set wallpaper
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-blue-dark'           # set color theme 
gsettings set org.gnome.desktop.interface icon-theme 'Yaru-blue-dark'          # icon style 

# -----------------------------------------------------------------------------------------------------------------
# zsh

# install
sudo apt install zsh -y

# set zsh as default shell
chsh -s $(which zsh)

# install Oh My Zsh 
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# intall plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

sudo apt-get install fonts-powerline

# -----------------------------------------------------------------------------------------------------------------
# alacrityy

# install
sudo add-apt-repository ppa:aslatter/ppa -y
sudo apt install alacritty

# set as default terminal
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $(which alacritty) 50
sudo update-alternatives --config x-terminal-emulator

# -----------------------------------------------------------------------------------------------------------------
# tmux
sudo apt install tmux -y

# -----------------------------------------------------------------------------------------------------------------
# neovim
sudo apt install neovim -y


