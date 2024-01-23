#!/usr/bin/env bash

#Install essential packages
install_cmd="pacman --noconfirm install" #NOTE: change to match the distribution
packages=(make cmake gcc build-essentials curl stow zsh kitty hyprland hyprpaper)

for package in ${packages[@]}
do
    echo $package
    #eval "$install_cmd $package"
    $install_cmd $package
done

#Curl nerd font symbols and firacode monospaced font
curl https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/NerdFontsSymbolsOnly.zip
curl https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip
#TODO: move fonts to directory they need to be in

#set default terminal to zsh
chsh -s $(which zsh)

#Rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

#build nvim from source
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
cd ../

#Pull dotfiles and stow them
git clone https://github.com/christian-the-code-crafsman/.dotfiles.git
#Stow .dotfiles
cd .dotfiles
stow nvim
stow zsh
stow kitty
stow hyprland
cd ../
