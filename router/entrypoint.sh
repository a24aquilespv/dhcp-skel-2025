#!/usr/bin/bash


# Hacer que cada red de docker siempre tenga el mismo nombre simbólico dentro del contendor 

### BEGIN ###

# Bajar todas las interfaces
ip link set dev eth0 down
ip link set dev eth1 down
ip link set dev eth2 down
ip link set dev eth3 down

# Asignar un nombre simbólico temporal a cada interfaz
ip link set eth0 name tmp0
ip link set eth1 name tmp1
ip link set eth2 name tmp2
ip link set eth3 name tmp3

# Obtener el nombre simbólico asignado a cada interfaz
dev_eth0=$(ip link show | grep -B 1 '00:1a:2b:3c:4d:5e' | head -n 1 | awk '{print $2}' | awk '{print $1}' FS='@')
dev_eth1=$(ip link show | grep -B 1 'a4:b5:c6:d7:e8:f9' | head -n 1 | awk '{print $2}' | awk '{print $1}' FS='@')
dev_eth2=$(ip link show | grep -B 1 'de:ad:be:ef:00:01' | head -n 1 | awk '{print $2}' | awk '{print $1}' FS='@')
dev_eth3=$(ip link show | grep -B 1 '80:5e:c0:93:f6:d0' | head -n 1 | awk '{print $2}' | awk '{print $1}' FS='@')

# Asignarle el nombre simbólico que le corresponde a cada interfaz
ip link set "${dev_eth0}" name eth0
ip link set "${dev_eth1}" name eth1
ip link set "${dev_eth2}" name eth2
ip link set "${dev_eth3}" name eth3


ip link set dev eth0 up
ip link set dev eth1 up 
ip link set dev eth2 up 
ip link set dev eth3 up 

### END ###

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
dhcp-helper -s 192.168.10.254 -i eth1 -i eth2 -d

