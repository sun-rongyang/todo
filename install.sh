#!/bin/bash
#######################################################################
#                 BASH SCRIPT FOR INSTALLATION                        #
#######################################################################

## Global variables
InstallPath=/usr/local #default installation path

## Program begin
# arguments test
if [[ $1 == --prefix=* ]]; then
    InstallPath=$(echo $1 | cut -d '=' -f 2) 
else
    case $1 in
        --help )
            echo -e "usage: ./install.sh [--help] [--prefix=<path>]"
            echo -e "options:"
            printf "%-9s%-16s%-s\n" "" "NONE" "Install todo at the default path:/usr/local"
            printf "%-9s%-16s%-s\n" "" "--prefix=<path>" "Set the installation path"
            printf "%-9s%-16s%-s\n" "" "--help" "Show help text and exit"
            exit 0
            ;;
        "" )
            read -p "Do you want to install todo at ${InstallPath} ? [Y/N] " install_path_default_state
            if [[ $install_path_default_state == "N" ]]; then
                echo -e "\nInstallation has been canceled. use '--prefix=install_path' option to set the installation path."
                exit 0
            fi
            ;;
        * )
            echo -e "Unsupported option! use '--help' option to show help text"
            exit 0

    esac
fi
# Begin installation
echo -e "\nInstallation begins..."
echo -e "\nTest the installation path..."
if [[ -e "$InstallPath" ]]; then
    echo -e "\nInstallation path is exist."
else
    echo -e "\nInstallation path is not exist. Create the path..."
    mkdir -p $InstallPath
fi

echo -e "\nCopy files to installation path..."
cp -r $PWD/src/* $InstallPath/

echo -e "\ntodo has been installed at $InstallPath/bin/todo"
echo -e "\nEnjoy it!"
