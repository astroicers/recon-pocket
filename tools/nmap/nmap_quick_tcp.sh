#!/bin/bash

cat /subdomain_live.txt |
sed '/^$/d' |
while read -r subdomain_live
do
    nmap -vv --reason -Pn -sV -sC --version-all -oN /tmp/nmap_quick_tcp_$subdomain_live.txt -oX /tmp/nmap_quick_tcp_$subdomain_live.xml $subdomain_live
done

if [[ ${?} != 0 ]]
then
    exit 1
fi

mv /tmp/nmap_quick_tcp_$subdomain_live.txt /nmap/nmap_quick_tcp_$subdomain_live.txt
mv /tmp/nmap_quick_tcp_$subdomain_live.xml /nmap/nmap_quick_tcp_$subdomain_live.xml