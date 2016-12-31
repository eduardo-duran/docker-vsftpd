FROM ubuntu:16.04

LABEL author="Eduardo Duran"

ENV TERM="xterm" \
    FTP_USER="user" \
    FTP_PASSWORD="password"

RUN apt-get update && \
    apt-get install -y vsftpd ftp vim && \
    # Needed for secure_chroot_dir vsftpd
    mkdir -vp /var/run/vsftpd/empty

COPY vsftpd.conf /etc/vsftpd.conf
COPY create_user.sh /tmp

RUN chmod -v +x /tmp/create_user.sh && \
    /tmp/create_user.sh

ENTRYPOINT ["/usr/sbin/vsftpd /etc/vsftpd.conf"]
