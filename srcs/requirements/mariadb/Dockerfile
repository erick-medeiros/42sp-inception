FROM alpine:3.16

ARG MYSQL_USER MYSQL_PASSWORD MYSQL_DATABASE MYSQL_ROOT_PASSWORD

RUN apk add --no-cache mariadb mariadb-client mariadb-openrc mariadb-server-utils

RUN cd /etc/my.cnf.d/ ; \
    sed -i "s/skip-networking/skip-networking=0/g" mariadb-server.cnf ; \
    sed -i "s/#bind-address=0.0.0.0/bind-address=0.0.0.0/g" mariadb-server.cnf

RUN mkdir -p /var/run/mysqld; \
    chown -R mysql:mysql /var/run/mysqld;

RUN mkdir -p /var/lib/mysql; \
    chown -R mysql:mysql /var/lib/mysql; \
    mysql_install_db --user=mysql --datadir=/var/lib/mysql

COPY ./conf/init.sql .
COPY ./conf/wordpress.sql .

RUN sed -i "s/\${MYSQL_USER}/${MYSQL_USER}/g" init.sql; \
    sed -i "s/\${MYSQL_PASSWORD}/${MYSQL_PASSWORD}/g" init.sql; \
    sed -i "s/\${MYSQL_DATABASE}/${MYSQL_DATABASE}/g" init.sql; \
    sed -i "s/\${MYSQL_ROOT_PASSWORD}/${MYSQL_ROOT_PASSWORD}/g" init.sql

RUN /usr/bin/mysqld_safe --skip-grant-tables & \
    while ! nc -z localhost 3306; do sleep 1; done && \
    mysql -umysql mysql < init.sql

RUN /usr/bin/mysqld_safe --skip-grant-tables & \
    while ! nc -z localhost 3306; do sleep 1; done && \
    mysql -u ${MYSQL_USER} ${MYSQL_DATABASE} < wordpress.sql

RUN rm -f init.sql wordpress.sql

USER mysql

EXPOSE 3306

CMD ["mysqld_safe"]