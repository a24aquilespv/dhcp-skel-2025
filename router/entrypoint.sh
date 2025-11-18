#!/usr/bin/bash


# Habilitar enrutamiento entre interfaces
/usr/bin/echo "1" > /proc/sys/net/ipv4/ip_forward

# Reglas de NATEO
# firewall_rules &>/dev/null &

/usr/sbin/nft add table nat
/usr/sbin/nft add chain nat pre_enrutado { type nat hook prerouting priority dstnat \; }

/usr/sbin/nft add rule nat pre_enrutado  oifname "eth0" dnat to 192.168.10.5
/usr/sbin/nft add rule nat pre_enrutado  oifname "eth1" dnat to 192.168.11.5
/usr/sbin/nft add rule nat pre_enrutado  oifname "eth2" dnat to 192.168.54.5
/usr/sbin/nft add rule nat pre_enrutado  oifname "eth3" dnat to 192.0.2.5


# Servidor relay DHCP
# Argumento -n para modo no demonio
dhcp-helper -s 192.168.10.254 -i eth2 -i eth3 -d
# dhcp-helper -n -s 192.168.10.254 -i eth2
