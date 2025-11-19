#!/usr/bin/bash


rm -f /var/run/kea/kea-dhcp4.kea-dhcp4.pid /run/kea/kea-dhcp-ddns.kea-dhcp-ddns.pid
                                           
                                        
ip route delete default
ip route add default via 192.168.10.5

kea-dhcp-ddns -c /etc/kea/kea-dhcp-ddns.conf -d &
kea-dhcp4 -c /etc/kea/kea-dhcp4.conf -d 
