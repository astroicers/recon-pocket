#! /bin/sh

cat /subdomain_live.txt |
sed '/^$/d' |
while read -r subdomain_live
do
    nmap -vv --reason -Pn -A --osscan-guess --version-all -p- -oN /nmap/nmap_full_tcp_$subdomain_live.txt -oX /nmap/nmap_full_tcp_$subdomain_live.xml $subdomain_live
done
echo "done" > /nmap/nmap_full_tcp_done.txt
