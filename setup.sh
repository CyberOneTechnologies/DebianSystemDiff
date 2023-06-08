#!/bin/bash

####################################################################################
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░Debian File Diff Tool░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░#
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░Developed by Aarsyth░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░#
#░░░░░░░░░░░░GitHub Repository: https://github.com/CyberOneTechnologies/░░░░░░░░░░░#
#░░░░░░░░░░░░░░░░░For support, reach out on Discord: Aarsyth#0563░░░░░░░░░░░░░░░░░░#
####################################################################################
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░#
#░░░░░░░░█████╗░██╗░░░██╗██████╗░███████╗██████╗░░█████╗░███╗░░██╗███████╗░░░░░░░░░#
#░░░░░░░██╔══██╗╚██╗░██╔╝██╔══██╗██╔════╝██╔══██╗██╔══██╗████╗░██║██╔════╝░░░░░░░░░#
#░░░░░░░██║░░╚═╝░╚████╔╝░██████╦╝█████╗░░██████╔╝██║░░██║██╔██╗██║█████╗░░░░░░░░░░░#
#░░░░░░░██║░░██╗░░╚██╔╝░░██╔══██╗██╔══╝░░██╔══██╗██║░░██║██║╚████║██╔══╝░░░░░░░░░░░#
#░░░░░░░╚█████╔╝░░░██║░░░██████╦╝███████╗██║░░██║╚█████╔╝██║░╚███║███████╗░░░░░░░░░#
#░░░░░░░░╚════╝░░░░╚═╝░░░╚═════╝░╚══════╝╚═╝░░╚═╝░╚════╝░╚═╝░░╚══╝╚══════╝░░░░░░░░░#
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░#
####################################################################################
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░#
####################################################################################
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░Description:░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░#
#----------------------------------------------------------------------------------#
#░Creates a File inventory of a linux system to track changes in files and folder░░#
#░structure. Reporting will be done based on a difference in files each day.░░░░░░░#
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░#
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░#
####################################################################################



# Verify if the script is running as the root user
if [[ $EUID -ne 0 ]]; then
   echo -e "\033[1;31mPlease run this script as root. Use 'sudo su' to switch to the root user.\033[0m"
   exit 1
fi

# Script to set up the DebianSystemDiff program on a Debian-based system

# Define the target installation directory
INSTALL_DIR="/opt/DebianSystemDiff"

# Create the installation directory if it doesn't exist
echo -e "\033[1;32mCreating installation directory...\033[0m"
mkdir -p $INSTALL_DIR

# Move the files to the installation directory
echo -e "\033[1;32mMoving files to the installation directory...\033[0m"
cp -R ./* $INSTALL_DIR

# Check if dependencies are installed
echo -e "\033[1;32mChecking dependencies...\033[0m"
if ! command -v pip3 &> /dev/null; then
    echo -e "\033[1;32mInstalling python3-pip...\033[0m"
    apt-get update
    apt-get install -y python3-pip
fi

if ! pip3 show colorama &> /dev/null; then
    echo -e "\033[1;32mInstalling colorama...\033[0m"
    pip3 install colorama
fi

if ! pip3 show psutil &> /dev/null; then
    echo -e "\033[1;32mInstalling psutil...\033[0m"
    pip3 install psutil
fi

if ! pip3 show tabulate &> /dev/null; then
    echo -e "\033[1;32mInstalling tabulate...\033[0m"
    pip3 install tabulate
fi

# Modify permissions
echo -e "\033[1;32mModifying permissions...\033[0m"
# Add commands to modify permissions as needed

# Add cron job
echo -e "\033[1;32mAdding cron job...\033[0m"
echo "30 1 * * * root /usr/bin/python3 $INSTALL_DIR/main.py" >> /etc/crontab

# Create log folder
echo -e "\033[1;32mCreating log folder...\033[0m"
mkdir -p /var/log/DebianSystemDiff

# Display completion message
echo -e "\033[1;32mSetup completed successfully!\033[0m"
