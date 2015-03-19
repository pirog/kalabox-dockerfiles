#!/bin/sh

sed -i "s/PRESSFLOW_SETTINGS .*/PRESSFLOW_SETTINGS '${KB_APP_SETTINGS}';/g" /src/config/nginx/site.conf

/usr/sbin/php5-fpm --daemonize -R
nginx
