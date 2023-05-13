#!/bin/sh

HOST="eandre-f.42.fr"
IP="127.0.0.1"
VOLUME_DIR=/home/eandre-f/data

_check_host()
{
	grep $HOST < /etc/hosts 1>/dev/null 2>/dev/null
}

_install()
{
	sudo mkdir -p $VOLUME_DIR/wordpress
	sudo mkdir -p $VOLUME_DIR/mariadb
	sudo mkdir -p $VOLUME_DIR/uptime-kuma
	_check_host || sudo sed -i "3i$IP\t$HOST" /etc/hosts
}

_remove()
{
	sudo rm -fr $VOLUME_DIR
	_check_host || exit 0
	TMP_HOST=/tmp/tmp_hosts
	sudo sed "/$HOST/d" /etc/hosts > $TMP_HOST &&
	sudo mv $TMP_HOST /etc/hosts
}

if [ "$1" = "install" ]
then
	_install
fi;

if [ "$1" = "remove" ]
then
	_remove
fi;