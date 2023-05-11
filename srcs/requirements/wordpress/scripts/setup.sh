#!/bin/sh

wp plugin install redis-cache --activate --allow-root
wp redis enable --allow-root

exec "$@"