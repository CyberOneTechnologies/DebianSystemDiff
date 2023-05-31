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


#!/bin/bash

# Script to set up the DebianSystemDiff program on a Debian-based system

# Define the target installation directory
INSTALL_DIR="/opt/DebianSystemDiff"

# Create the installation directory if it doesn't exist
echo -e "\033[1;32mCreating installation directory...\033[0m"
sudo mkdir -p $INSTALL_DIR

# Move the files to the installation directory
echo -e "\033[1;32mMoving files to the installation directory...\033[0m"
sudo cp -R ./* $INSTALL_DIR

# Install dependencies
echo -e "\033[1;32mInstalling dependencies...\033[0m"
sudo apt-get update
sudo apt-get install -y python3-pip
sudo pip3 install -r $INSTALL_DIR/requirements.txt

# Modify permissions
echo -e "\033[1;32mModifying permissions...\033[0m"
# Add commands to modify permissions as needed

# Add cron job
echo -e "\033[1;32mAdding cron job...\033[0m"
(crontab -l 2>/dev/null; echo "30 1 * * * /usr/bin/python3 $INSTALL_DIR/main.py") | crontab -

# Create log folder
echo -e "\033[1;32mCreating log folder...\033[0m"
sudo mkdir -p /var/log/DebianSystemDiff

# Display completion message
echo -e "\033[1;32mSetup completed successfully!\033[0m"
