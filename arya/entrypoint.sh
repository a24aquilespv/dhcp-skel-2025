#!/usr/bin/bash

/usr/sbin/ip route delete default
/usr/sbin/ip route add default via 192.168.10.5
