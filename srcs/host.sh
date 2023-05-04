#!/bin/sh

HOST="eandre-f.42.fr"
IP="127.0.0.1"

check_host()
{
	grep $HOST < /etc/hosts 1>/dev/null 2>/dev/null
}

if [ "$1" = "install" ]
then
	check_host || sudo sed -i "3i$IP\t$HOST" /etc/hosts
fi;

if [ "$1" = "remove" ]
then
	check_host || exit 0
	TMP_HOST=/tmp/tmp_hosts
	sudo sed "/$HOST/d" /etc/hosts > $TMP_HOST &&
	sudo mv $TMP_HOST /etc/hosts
fi;