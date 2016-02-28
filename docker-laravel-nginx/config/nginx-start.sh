#!/bin/bash
cp /opt/etc/nginx.conf /etc/nginx/nginx.conf
sed -i "s/%fpm-ip%/phpfpm/" /etc/nginx/nginx.conf
exec /usr/sbin/nginx
