#!/bin/bash

echo '============================================================================'
echo 'Setup Hardware and Drivers'
echo '============================================================================'

echo 'AMD GPU Drivers and Libraries'
pacman -S lib32-mesa --noconfirm --needed
pacman -S lib32-vulkan-radeon --noconfirm --needed
pacman -S libva-mesa-driver --noconfirm --needed
pacman -S mesa --noconfirm --needed
pacman -S mesa-utils --noconfirm --needed
pacman -S mesa-vdpau --noconfirm --needed
pacman -S vulkan-radeon --noconfirm --needed
pacman -S xf86-video-amdgpu --noconfirm --needed

