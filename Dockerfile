FROM ubuntu:16

LABEL author="Eduardo Duran"

ENV FTP_USER="test" \
    FTP_PASSWORD="test"

COPY create_user.sh /tmp
RUN chmod -v +x /tmp/create_user.sh && \
    /tmp/create_user.sh

RUN apt-get update && \
    apt-get install -y vsftpd ftp vim && \
    # Needed for secure_chroot_dir vsftpd
    mkdir -vp /var/run/vsftpd/empty

COPY vsftpd.conf /etc/vsftpd.conf

ENTRYPOINT ["/usr/sbin/vsftpd /etc/vsftpd.conf"]
