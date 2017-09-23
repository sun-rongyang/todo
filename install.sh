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
    read -p "Do you want to install todo at ${InstallPath} ? [Y/N] " install_path_default_state
    if [[ $install_path_default_state == "N" ]]; then
        echo -e "\nInstallation has been canceled. Please use '--prefix=install_path' flag to set the installation path."
        exit 0
    fi
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
#echo -e "cp -r $PWD/src/* $InstallPath/*"

echo -e "\ntodo has been installed at $InstallPath/bin/todo"
echo -e "\nEnjoy it!"
