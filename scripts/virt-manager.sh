#!/bin/bash

echo '============================================================================'
echo 'Configuring Virt Manager'
echo '============================================================================'

sudo pacman -Syu --needed virt-manager qemu-desktop libvirt edk2-ovmf dnsmasq vde2 bridge-utils iptables-nft dmidecode --noconfirm --needed

sudo systemctl enable --now libvirtd.service

sudo virsh net-autostart default