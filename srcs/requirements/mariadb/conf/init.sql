USE mysql;
FLUSH PRIVILEGES;
-- admin
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
-- user
CREATE DATABASE ${MYSQL_DATABASE} CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED by '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;