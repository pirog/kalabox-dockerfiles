#!/bin/sh

sed -i "s/KALABOX_IP/$KALABOX_IP/g" /etc/dnsmasq.conf

/usr/sbin/dnsmasq -d
