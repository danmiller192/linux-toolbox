#!/bin/bash

echo '============================================================================'
echo 'Configuring Package Management'
echo '============================================================================'

# Install Yay

install_yay() {
	echo 'Installing Yay'
	sudo pacman -S --needed --noconfirm git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm --needed 

	yay -Y --gendb
	yay -Syu --devel --noconfirm
	yay -Y --devel --save --noconfirm
} 

install_pamac() {
    echo 'Installing pamac'
    yay -S pamac-aur flatpak --noconfirm --needed
} 

# try yay
try
(
	( yay --help)
)
catch ||
{ 
	try
	(
		( install_yay)
	)
}

# try pamac
try
(
	( pamac --help)
)
catch ||
{ 
	try
	(
		( install_pamac)
	)
}

pamac update --force-refresh

sudo sed -Ei '/EnableAUR/s/^#//' /etc/pamac.conf
sudo sed -Ei '/CheckAURUpdates/s/^#//' /etc/pamac.conf