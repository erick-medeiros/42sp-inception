FROM alpine:3.16

RUN apk add --update --no-cache vsftpd

ARG FTP_USER FTP_PASS
ENV FTP_DIR /var/lib/ftp

COPY conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN adduser -h ${FTP_DIR} ${FTP_USER} -D
RUN echo -e "${FTP_PASS}\n${FTP_PASS}" | passwd ${FTP_USER}
RUN echo ${FTP_USER} > /etc/vsftpd/user_list

WORKDIR ${FTP_DIR}

EXPOSE 21

ENTRYPOINT ["vsftpd", "/etc/vsftpd/vsftpd.conf"]