#!/usr/bin/bash


ip route delete default
ip route add default via 192.168.10.5
kea-dhcp4 -c /etc/kea/kea-dhcp4.conf -d