#!/bin/bash

cat /subdomain_live.txt |
sed '/^$/d' |
while read -r subdomain_live
do
    nmap -vv --reason -Pn -A --osscan-guess --version-all -p- -oN /tmp/nmap_full_tcp_$subdomain_live.txt -oX /tmp/nmap_full_tcp_$subdomain_live.xml $subdomain_live
done

if [[ ${?} != 0 ]]
then
    exit 1
fi

mv /tmp/nmap_full_tcp_$subdomain_live.txt /nmap/nmap_full_tcp_$subdomain_live.txt
mv /tmp/nmap_full_tcp_$subdomain_live.xml /nmap/nmap_full_tcp_$subdomain_live.xml