#!/bin/bash


echo '============================================================================'
echo 'Configuring Messaging Applications'
echo '============================================================================'

echo 'Installing Discord'
yay -S discord --noconfirm --needed

echo 'Installing Slack'
flatpak install slack

echo '============================================================================'
echo 'Configuring Software Development Applications'
echo '============================================================================'

echo 'Installing Vscodium'
yay -S vscodium-bin --noconfirm --needed

vscodium
sleep 5

mkdir -p $HOME/.config/VSCodium/User
cp -r -f $install_path/files/vscodium/* $HOME/.config/VSCodium/User

echo 'Installing Github Desktop'
yay -S github-desktop-bin --noconfirm --needed

echo 'Installing GitKraken'
yay -S gitkraken --noconfirm --needed

echo 'Installing gitg'
sudo pacman -S gitg --noconfirm --needed

echo 'Installing poetry'
sudo pacman -S python-poetry --noconfirm --needed

echo 'Installing nvm'
yay -S nvm --noconfirm --needed

echo 'Installing LmStudio'
yay -S lmstudio --noconfirm --needed

echo 'Installing PyCharm'
yay -S pycharm-community-edition --noconfirm --needed

echo 'Installing Intellij'
yay -S intellij-idea-community-edition --noconfirm --needed

echo 'Installing Podman'
yay -S podman podman-compose podman-desktop-bin podman-docker --noconfirm --needed

echo '============================================================================'
echo 'Configuring Media Applications'
echo '============================================================================'

echo 'Installing Handbrake'
sudo pacman -S handbrake  --noconfirm --needed

echo 'Installing MakeMkv'
yay -S makemkv --noconfirm --needed

echo 'Installing VLC'
sudo pacman -S vlc  --noconfirm --needed

echo 'Installing VLC'
sudo pacman -S vlc  --noconfirm --needed

echo 'Installing Kooha'
sudo pacman -S kooha  --noconfirm --needed

echo 'Installing K3b'
sudo pacman -S k3b  --noconfirm --needed

echo 'Installing Jellyfin Media Player'

if [ "$select_os" = "manjaro" ]; then
    yay -S jellyfin-media-player  --noconfirm --needed
fi

if [ "$select_os" = "endevouros" ]; then
    sudo pacman -S jellyfin-media-player  --noconfirm --needed
fi

if [ "$select_os" = "cachyos" ]; then
    yay -S jellyfin-media-player  --noconfirm --needed
fi

echo 'Installing Feishin'
yay -S feishin-bin --noconfirm --needed

echo '============================================================================'
echo 'Configuring Gaming Applications'
echo '============================================================================'

echo 'Installing Steam'
sudo pacman -S steam  --noconfirm --needed
yay -S game-devices-udev  --noconfirm --needed

echo 'Installing Game Mode'
yay -S gamemode lib32-gamemode --noconfirm --needed

echo 'Installing Game Mode Extention'
yay -S gamemode-shell-extension-gamemode --noconfirm --needed

echo '============================================================================'
echo 'Configuring Utilities'
echo '============================================================================'

echo 'Installing Logs'
sudo pacman -S gnome-logs  --noconfirm --needed

echo 'Installing OpenRGB'
sudo pacman -S openrgb  --noconfirm --needed

echo 'Installing Disk Analyzer'
sudo pacman -S baobab  --noconfirm --needed

echo '============================================================================'
echo 'Configuring Misc Applications'
echo '============================================================================'

echo 'Installing Veracrypt'
sudo pacman -S veracrypt  --noconfirm --needed

echo '============================================================================'
echo 'Configuring App Picker Layout'
echo '============================================================================'

gsettings set org.gnome.desktop.app-folders folder-children "['Utilities', 'Media', 'Development', 'Settings', 'System']"
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Utilities/ name "Utilities"
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Media/ name "Media"
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Development/ name "Development Tools"
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Settings/ name "Settings"
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/System/ name "System"

gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Utilities/ apps "['org.gnome.Weather.desktop', 'org.gnome.Calculator.desktop', 'org.gnome.clocks.desktop', 'org.gnome.FileRoller.desktop', 'org.gnome.Loupe.desktop', 'org.gnome.Evince.desktop', 'org.gnome.Screenshot.desktop', 'org.gnome.baobab.desktop', 'stoken-gui.desktop', 'stoken-gui-small.desktop']"

gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Media/ apps "['vlc.desktop', 'io.github.seadve.Kooha.desktop', 'org.kde.k3b.desktop', 'mpv.desktop', 'feishin.desktop', 'com.github.iwalton3.jellyfin-media-player.desktop']"

gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Development/ apps "['cmake-gui.desktop', 'codium.desktop', 'yad-settings.desktop', 'org.gnome.gitg.desktop']"

gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Settings/ apps "['org.gnome.Settings.desktop', 'org.gnome.Extensions.desktop', 'timeshift-gtk.desktop', 'firewall-config.desktop', 'pavucontrol.desktop', 'org.gnome.PowerStats.desktop', 'org.gnome.tweaks.desktop', 'OpenRGB.desktop']"

gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/System/ apps "['org.gnome.SystemMonitor.desktop', 'org.gnome.DiskUtility.desktop', 'gnome-nettool.desktop', 'org.gnome.Logs.desktop', 'bssh.desktop', 'welcome.desktop', 'bvnc.desktop', 'avahi-discover.desktop', 'eos-quickstart.desktop', 'eos-apps-info.desktop', 'eos-log-tool.desktop', 'eos-update.desktop', 'qv4l2.desktop', 'qvidcap.desktop', 'reflector-simple.desktop', 'yad-icon-browser.desktop', 'xterm.desktop', 'uxterm.desktop', 'org.gnome.Usage.desktop']"

dconf write /org/gnome/shell/app-picker-layout "[{'steam.desktop': <{'position': <0>}>, 'codium-wayland.desktop': <{'position': <1>}>, 'veracrypt.desktop': <{'position': <2>}>, 'org.gnome.Totem.desktop': <{'position': <3>}>, 'org.gnome.gedit.desktop': <{'position': <4>}>, 'github-desktop.desktop': <{'position': <5>}>, 'GitKraken.desktop': <{'position': <6>}>, 'fr.handbrake.ghb.desktop': <{'position': <7>}>, 'makemkv.desktop': <{'position': <8>}>, 'org.gnome.Meld.desktop': <{'position': <9>}>, 'Utilities': <{'position': <10>}>, 'Settings': <{'position': <11>}>, 'Development': <{'position': <12>}>, 'System': <{'position': <13>}>}]"
