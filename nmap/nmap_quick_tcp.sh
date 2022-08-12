#! /bin/sh

cat /subdomain_live.txt |
sed '/^$/d' |
while read -r subdomain_live
do
    nmap -vv --reason -Pn -sV -sC --version-all -oN /nmap/nmap_quick_tcp_$subdomain_live.txt -oX /nmap/nmap_quick_tcp_$subdomain_live.xml $subdomain_live
done
echo "done" > /nmap/nmap_quick_tcp_done.txt
