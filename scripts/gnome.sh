#!/bin/bash

function gnome_default() {
    papirus-folders -C blue --theme Papirus-Light
    gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'

    dconf write /org/gnome/shell/extensions/custom-accent-colors/accent-color "'Default'"
}
function gnome_maia() {
    yay -S papirus-maia-icon-theme-git --noconfirm --needed

    papirus-folders -C teal --theme Papirus-Maia
    gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Maia'

    dconf write /org/gnome/shell/extensions/custom-accent-colors/accent-color "'maia'"

    #Copy files for maia accent colour
    sudo cp -r $install_path/files/custom-accent-colors/prefs.js /usr/share/gnome-shell/extensions/custom-accent-colors@demiskp/prefs.js
    sudo cp -r $install_path/files/custom-accent-colors/extension.js /usr/share/gnome-shell/extensions/custom-accent-colors@demiskp/extension.js
    sudo cp -r $install_path/files/custom-accent-colors/resources/* /usr/share/gnome-shell/extensions/custom-accent-colors@demiskp/resources
}

echo '============================================================================'
echo 'Configuring Gnome Desktop'
echo '============================================================================'

echo 'Installing packages'
yay -S gedit bibata-cursor-theme-bin gnome-browser-connector-git adw-gtk3-git gnome-extensions-cli pamac-tray-icon-plasma ocs-url adw-gtk3-git papirus-icon-theme-git papirus-folders-git gnome-shell-extension-custom-accent-colors-git --noconfirm --needed

# Configure Gnome
echo 'Setting gnome themes'
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3'
gsettings set org.gnome.desktop.interface color-scheme 'default'
gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic'
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'

sudo -u gdm dbus-launch gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic'

# Gnome Weather
echo 'Setting Gnome Weather Locations'
dconf write /org/gnome/shell/weather/locations "[<(uint32 2, <('Exeter', 'EGTE', true, [(0.8854637013606923, -0.05963208859423709)], [(0.88488193076112509, -0.061668294419368802)])>)>]"

# Gedit
echo 'Setting gedit theme'
gsettings set org.gnome.gedit.preferences.editor scheme 'solarized-dark'

# Nautilus
echo 'Hide hidden files'
dconf write /org/gtk/gtk4/settings/file-chooser/show-hidden false

echo 'Set Nautilus icon size'
dconf write /org/gnome/nautilus/icon-view/default-zoom-level "'small-plus'"
  
# Gnome Extentions
echo 'Installing extentions'
gext install 19 307 3193 615 4158 4998

echo 'Configuring extentions'
dconf write /org/gnome/shell/extensions/dash-to-dock/show-apps-at-top true
dconf write /org/gnome/shell/extensions/dash-to-dock/show-mounts false
dconf write /org/gnome/shell/extensions/dash-to-dock/show-trash false

dconf write /org/gnome/shell/extensions/gnome-ui-tune/hide-search false

dconf write /org/gnome/shell/extensions/custom-accent-colors/theme-flatpak true
dconf write /org/gnome/shell/extensions/custom-accent-colors/theme-gtk3 true
dconf write /org/gnome/shell/extensions/custom-accent-colors/theme-shell true
dconf write /org/gnome/shell/extensions/user-theme/name "'Custom-Accent-Colors'"

dconf write /org/gnome/shell/favorite-apps "['firefox.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Terminal.desktop', 'org.manjaro.pamac.manager.desktop']"

dconf write /org/gnome/shell/enabled-extensions "['legacyschemeautoswitcher@joshimukul29.gmail.com', 'dash-to-dock@micxgx.gmail.com', 'gnome-ui-tune@itstime.tech', 'appindicatorsupport@rgcjonas.gmail.com', 'blur-my-shell@aunetx', 'user-theme@gnome-shell-extensions.gcampax.github.com', 'custom-accent-colors@demiskp', 'pamac-updates@manjaro.org']"

echo 'Setup flatpak theming'
flatpak install flathub org.gtk.Gtk3theme.adw-gtk3 -y
flatpak override --env=GTK_THEME=adw-gtk3 --user
sudo flatpak override --filesystem=$HOME/.themes

#Copy files for wallpapers
cp -r $install_path/files/wallpapers* $HOME/Pictures/Wallpapers
cp -r $install_path/files/wallpapers* $HOME/.local/share/backgrounds

dconf write /org/gnome/desktop/background/picture-uri "'file://$HOME/.local/share/backgrounds/Nature%20sky%20sunset%20illustration.png'"
dconf write /org/gnome/desktop/screensaver/primary-color "'#000000000000'"
dconf write /org/gnome/desktop/screensaver/secondary-color "'#000000000000'"

echo 'Setting Accent Color'
case $color in
    'default') gnome_default ;;
    'maia') gnome_maia ;;
    *) echo -e $red"Invalid color selection."$clear; WrongCommand;;
esac
