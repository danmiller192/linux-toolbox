
##
# Color  Variables
##
green='\e[32m'
blue='\e[34m'
clear='\e[0m'
##
# Color Functions
##
ColorGreen(){
	echo -ne $green$1$clear
}
ColorBlue(){
	echo -ne $blue$1$clear
}

##
# Try Catch Functions
##
function try()
{
    [[ $- = *e* ]]; SAVED_OPT_E=$?
    set +e
}

function throw()
{
    exit $1
}

function catch()
{
    export ex_code=$?
    (( $SAVED_OPT_E )) && set +e
    return $ex_code
}

function throwErrors()
{
    set -e
}

function ignoreErrors()
{
    set +e
}

##
# OS Functions
##
function getDistro()
{
    distro=$(lsb_release -i | cut -f 2-)
    return $distro
}


selectedos='none'

function manjaro() {
    selectedos='manjaro'
}
function endevouros() {
    selectedos='endevouros'
}
function cachyos() {
    selectedos='cachyos'
}

select_os() {
    distro=$(lsb_release -i | cut -f 2-) 

    if [ $distro = "EndevourOS" ]; then
        endevouros
        
    elif [ $distro = "cachyos" ]; then
        cachyos

    elif [ $distro = "ManjaroLinux" ]; then
        manjaro
    else
        printf "Error: Unsupported Distro $distro"
        exit 1
    fi
}
