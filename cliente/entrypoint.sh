#!/usr/bin/bash


ip route flush dev eth0
dhclient -v eth0
sleep infinity