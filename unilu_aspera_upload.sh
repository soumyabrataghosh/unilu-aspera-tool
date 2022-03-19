#!/bin/bash
# Ask the user for login details
read -p "SSHKEY file path: " -i "$HOME/.aspera/connect/etc/asperaweb_id_dsa.openssh" -e sshkey_path
#read -p 'SSHKEY file path: ' aspera_ssh_key
read -p 'TOKEN (Provided by UNILU): ' aspera_token
read -p 'ASPERA_SCP_FILEPASS (Provided by UNILU): ' aspera_sfpass
read -p 'Remote upload folder name (folder will be created if not present): ' aspera_folder
read -p "Local file/folder to be uploaded: " -i "/" -e localdir
echo
echo Data to be uploaded for $localdir
export SSHKEY=$sshkey_path #<path to the ssh key>
export TOKEN=$aspera_token
export ASPERA_SCP_FILEPASS=$aspera_sfpass

$HOME/.aspera/connect/bin/ascp -d -i $SSHKEY -P 33001 --file-crypt encrypt -W $TOKEN $localdir app_duma_private@aspera.lcsb.uni.lu:/$aspera_folder
