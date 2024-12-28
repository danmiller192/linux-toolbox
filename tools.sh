#!/bin/bash

app_name="RedHotBadgers Linux Toolbox"
install_path=$HOME/repos/linux-toolbox

# Ensure we are running under bash
if [ "$BASH_SOURCE" = "" ]; then
    /bin/bash "$0"
    exit 0
fi

source $install_path/scripts/options.sh
source $install_path/scripts/functions.sh
source $install_path/menu/bash-menu.sh
source $install_path/menu/menu-functions.sh

main_menu() {
    menuTitle="RedHotBadgers Linux Toolbox - Main Menu"
    menuFooter=" Enter=Select, Navigate via Up/Down/First number/letter"
    menuWidth=60
    menuLeft=25
    menuHighlight=$DRAW_COL_YELLOW

    menuItems=(
        "1. Updates"
        "2. Setup"
        "3. Restart"
        "Q. Exit"
    )

    menuActions=(
        update_menu
        setup_menu
        restart
        quit
    )

    menuInit
    menuLoop
}

update_menu() {
    menuTitle="RedHotBadgers Linux Toolbox - Updates"
    menuFooter=" Enter=Select, Navigate via Up/Down/First number/letter"
    menuWidth=60
    menuLeft=25
    menuHighlight=$DRAW_COL_YELLOW

    menuItems=(
        "1. List Updates"
        "2. Run Updates"
        "3. Update cli"
        "4. Main Menu"
        "Q. Exit"
    )

    menuActions=(
        list_updates
        run_updates
        update_cli
        main_menu
        quit
    )

    menuInit
    menuLoop
}

setup_menu() {
    menuTitle="RedHotBadgers Linux Toolbox - Setup"
    menuFooter=" Enter=Select, Navigate via Up/Down/First number/letter"
    menuWidth=60
    menuLeft=25
    menuHighlight=$DRAW_COL_YELLOW

    menuItems=(
        "1. All"
        "2. Package Management"
        "3. Run Updates"
        "4. Terminal"
        "5. Gnome"
        "6. Apps"
        "7. Grub"
        "8. Cleanup"
        "9. Main Menu"
        "Q. Exit"
    )

    menuActions=(
        all
        package_management
        run_updates
        terminal
        gnome
        apps
        grub
        cleanup
        main_menu
        quit
    )

    menuInit
    menuLoop
}

################################
## Run Menu
################################
main_menu


exit 0