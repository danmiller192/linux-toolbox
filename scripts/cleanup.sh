#!/bin/bash

echo '============================================================================'
echo 'Cleanup unwanted packages'
echo '============================================================================'

packages=("gnome-console" "gnome-text-editor")

for package in ${packages[@]}; do
	try
	(
		( sudo pacman -R $package --noconfirm)
    )
    catch ||
    { # try yay
		try
		(
			( yay -R $package --noconfirm)
		)
    }
done