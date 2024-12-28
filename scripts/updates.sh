#!/bin/bash

echo '============================================================================'
echo 'Running Updates'
echo '============================================================================'



if [ "$select_os" = "manjaro" ]; then
    ColorBlue 'Updating Manjaro\n'
    yay -Syyu
    ColorGreen 'Manjaro Updates Completed\n'
fi

if [ "$select_os" = "endevouros" ]; then
    ColorBlue 'Updating EndevourOS\n'
    eos-update --aur --noconfirm --needed
    yay -Syyu
    ColorGreen 'EndevourOS Updates Completed\n'
fi

if [ "$select_os" = "cachyos" ]; then
    ColorBlue 'Updating CachyOS\n'
    yay -Syyu
    ColorGreen 'CachyOS Updates Completed\n'
fi

ColorBlue 'Updating Packages\n'
yay --noconfirm --needed
ColorGreen 'Package Updates Completed\n'