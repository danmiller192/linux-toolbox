#!/bin/bash

function setup_session() {
    set -e
    sudo sh -c "echo Session Elevated"
}

function reset_session() {
    cd $original_dir
    set +e
}

function terminal() {
    local confirm=${1:-true}

    setup_session
    source $install_path/scripts/terminal.sh
    reset_session

    check_confirm $confirm
    return 1
}

function package_management() {
    local confirm=${1:-true}

    setup_session
    source $install_path/scripts/package-management.sh
    reset_session

    check_confirm $confirm
    return 1
}

function gnome() {
    select_color
    just_gnome
    return 1
}

function just_gnome() {
    local confirm=${1:-true}

    setup_session
    source $install_path/scripts/gnome.sh
    reset_session

    check_confirm $confirm
    return 1
}

function apps() {
    local confirm=${1:-true}

    select_os
    setup_session
    source $install_path/scripts/apps.sh
    reset_session

    check_confirm $confirm
    return 1
}

function grub() {
    local confirm=${1:-true}

    setup_session
    source $install_path/scripts/grub.sh
    reset_session

    check_confirm $confirm
    return 1
}

function restart() {
    setup_session
    source $install_path/scripts/restart.sh
    reset_session
    return 1
}

function cleanup() {
    local confirm=${1:-true}

    setup_session
    source $install_path/scripts/cleanup.sh
    reset_session

    check_confirm $confirm
    return 1
}

function all() {
    select_os
    select_color
    package_management false
    run_updates false
	terminal false
	just_gnome false
	apps false
    grub false
    cleanup false
    check_confirm
    return 1
}

function list_updates() {
    local confirm=${1:-true}
    (checkupdates && yay -Qua)
    reset_session

    check_confirm $confirm
    return 1
}

function run_updates() {
    local confirm=${1:-true}

    setup_session
    source $install_path/scripts/updates.sh
    reset_session
    
    check_confirm $confirm
    return 1
}

function update_cli() {
    local confirm=${1:-true}

    git -C $install_path pull
    reset_session

    check_confirm $confirm
    return 1
}

function quit() {
    exit 0
}

function check_confirm() {
    local confirm=${1:-true}
    if [ "$confirm" = true ]; then
        read -p "Press any key to continue... " -n1 -s
    fi
}