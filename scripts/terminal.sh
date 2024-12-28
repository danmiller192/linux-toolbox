#!/bin/bash

echo '============================================================================'
echo 'Configuring Terminal'
echo '============================================================================'

# Setup Terminal
echo 'Installing packages'
yay -S zsh gnome-terminal zsh-theme-powerlevel10k-git ttf-meslo-nerd-font-powerlevel10k oh-my-zsh-git zsh-syntax-highlighting zsh-autosuggestions autojump --noconfirm --needed

echo 'Setting zsh as default'
sudo usermod --shell /bin/zsh $USER

echo 'Configuring terminal style'
dconf write /org/gtk/settings/color-chooser/selected-color '(true, 0.86274509803921573, 0.91372549019607852, 0.92156862745098034, 1.0)'
dconf write /org/gtk/settings/color-chooser/selected-color '(true, 0.10588235294117647, 0.13333333333333333, 0.14117647058823529, 1.0)'
dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/background-color "'rgb(27,34,36)'"
dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/foreground-color "'rgb(220,233,235)'"
dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/use-theme-colors false

echo 'Copy zsh config'
sudo cp -r $install_path/files/zsh/.p10k.zsh $HOME/.p10k.zsh
sudo cp -r $install_path/files/zsh/.zshrc $HOME/.zshrc
