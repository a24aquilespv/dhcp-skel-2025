#!/usr/bin/bash


/usr/bin/rm -f /var/run/kea/kea-dhcp4.kea-dhcp4.pid /run/kea/kea-dhcp-ddns.kea-dhcp-ddns.pid
                                           
                                        
/usr/sbin/ip route delete default
/usr/sbin/ip route add default via 192.168.10.5

# Crear carpeta para los logs
log_path="/var/log/kea/"

/usr/bin/mkdir -p "${log_path}"
[[ -d "${log_path}" ]] && /usr/bin/chown root:_kea "${log_path}" && /usr/bin/chmod 770 "${log_path}"

# Levantar servidor ddns y dhcp4
kea-dhcp-ddns -c /etc/kea/kea-dhcp-ddns.conf -d
kea-dhcp4 -c /etc/kea/kea-dhcp4.conf -d
