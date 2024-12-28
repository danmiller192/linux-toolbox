#!/bin/bash
color='none'

function default() {
    color='default'
}
function maia() {
    color='maia'
}

select_color() {
    menuTitle="RedHotBadgers Linux Toolbox - Select Theme Colour"
    menuFooter=" Enter=Select, Navigate via Up/Down/First number/letter"
    menuWidth=60
    menuLeft=25
    menuHighlight=$DRAW_COL_YELLOW

    menuItems=(
        "1. Default"
        "2. Maia"
        "3. Main Menu"
        "Q. Exit"
    )

    menuActions=(
        default
        maia
        main_menu
        quit
    )

     if [ "$color" = "none" ]; then 
        menuInit
        menuLoop
     fi
}