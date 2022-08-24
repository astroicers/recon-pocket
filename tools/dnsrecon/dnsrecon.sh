#! /bin/sh

cat /subdomain_live.txt |
sed '/^$/d' |
while read -r subdomain_live
do
    ping $subdomain_live -c 1
    python /app/dnsrecon.py -d $subdomain_live > /tmp/dnsrecon_$subdomain_live.txt
done

if [[ ${?} != 0 ]]
then
    exit 1
fi

mv /tmp/dnsrecon_$subdomain_live.txt /dnsrecon/dnsrecon_$subdomain_live.txt