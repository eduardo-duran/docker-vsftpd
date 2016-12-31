#!/bin/bash

echo -e "\n  DOCKER: creating user ${FTP_USER} ...\n"
adduser --quiet \
        --disabled-password \
        --shell /bin/bash \
        --home /home/$FTP_USER \
        --gecos "User" \
        $FTP_USER
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

mkdir -vpm 555     /home/$FTP_USER
mkdir -vm 755      /home/$FTP_USER/ftp
chown -v test:test /home/$FTP_USER/ftp
echo -e "\n  DOCKER: New FTP user ${FTP_USER} is created.\n"

# Needed for secure_chroot_dir vsftpd
mkdir -vp /var/run/vsftpd/empty