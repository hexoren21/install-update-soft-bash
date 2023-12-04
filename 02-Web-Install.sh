#!/bin/bash

# Variable declaration
PACKAGES="wget apache2 unzip"
SERVICES="apache2"
URL_TEMP="https://www.tooplate.com/zip-templates/2136_kool_form_pack.zip"
NAME_TEMPLATE="2136_kool_form_pack"
FILE_TEMP="/tmp/webfile"

# Dependency installation
echo "#######################"
echo "Pakcet installation"
echo "#######################"
sudo DEBIAN_FRONTEND=noninteractive apt-get install $PACKAGES -y
echo

# Starting and enabling a service

echo "#######################"
echo "Starting and enabling the Apache service"
echo "#######################"
sudo systemctl start $SERVICES | sudo systemctl enable $SERVICES

# Creating a temp directory
echo "#######################"
echo "Create temp directory"
echo "#######################"
mkdir -p $FILE_TEMP
cd $FILE_TEMP

# Unpacking file
echo "#######################"
echo "Download and unpack zip file"
echo "#######################"
wget $URL_TEMP
unzip $NAME_TEMPLATE.zip 
sudo cp -r $NAME_TEMPLATE/* /var/www/html/

# Restarting service
echo "#######################"
echo "Restart the apache service"
echo "#######################"
sudo systemctl restart apache2

# Clear temp file
sudo rm -r $FILE_TEMP

sudo systemctl status apache2
