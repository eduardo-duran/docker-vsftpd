#!/bin/bash

echo -e "\n  DOCKER: creating user ${FTP_USER} ...\n"
adduser --disabled-password \
        --shell /bin/bash \
        --home /home/$FTP_USER \
        --gecos "User" $FTP_USER
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

mkdir -vpm 555     /home/$FTP_USER
mkdir -vm 755      /home/$FTP_USER/ftp
chown -v $FTP_USER:$FTP_USER /home/$FTP_USER/ftp
echo -e "\n  DOCKER: New FTP user ${FTP_USER} is created.\n"