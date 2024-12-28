#!/bin/bash

echo '============================================================================'
echo 'Configuring Grub'
echo '============================================================================'

# Create theme directory
mkdir $HOME/.grub-theme/
cd $HOME/.grub-theme/

# Download theme
git clone https://github.com/vinceliuice/grub2-themes.git
cd ./grub2-themes

# Install
sudo ./install.sh -t stylish -s 4k

echo '============================================================================'
echo 'Configuring Timeshift'
echo '============================================================================'

# Install packages
yay -S timeshift timeshift-autosnap --noconfirm --needed

# Enable cron service
sudo systemctl enable --now cronie.service

# Install the grub btrfs package
sudo pacman -S grub-btrfs  --noconfirm --needed

sudo systemctl edit --full grub-btrfsd

# Change
# ExecStart=/usr/bin/grub-btrfsd --syslog /.snapshots
# to
# ExecStart=/usr/bin/grub-btrfsd --syslog --timeshift-auto

# Make grub config
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Enable grub service
sudo systemctl enable --now grub-btrfsd