#! /bin/sh

cat /subdomain_live.txt |
sed '/^$/d' |
while read -r subdomain_live
do
    ping $subdomain_live -c 1
    python /app/dnsrecon.py -d $subdomain_live > /dnsrecon/dnsrecon_$subdomain_live.txt
done
echo "done" > /dnsrecon/done.txt