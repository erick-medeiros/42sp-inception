# 42sp-inception

## Mandatory

### The LEMP Stack
Linux 🐧 ~ (e)Nginx 🟢 ~ MariaDB 🦭 ~ PHP 🐘

#### and
Docker 🐋 ~ Wordpress 🔱

## Bonus

Redis 🟥 ~ FTP Server 📁 ~ Static Website 🌐 ~ Adminer 🛡️

### Extra

Uptime Kuma 🟢

## Services

* https://eandre-f.42.fr:443 wordpress
* https://eandre-f.42.fr:443/wp-admin wordpress admin
* https://eandre-f.42.fr:443/website website (password generator)
* https://eandre-f.42.fr:443/adminer adminer
* http://localhost:3001 uptime kuma

## ftp

```sh
# get IPAddress
docker inspect ftp | grep '"IPAddress"'
# using
ftp <ip>
```

### Credentials

Wordpress:
* admin: marvin marvin
* user: cadet cadet
Uptime Kuma:
* username: uptime
* password: kuma42
FTP
* user: ftp_user
* pass: ftp_pass