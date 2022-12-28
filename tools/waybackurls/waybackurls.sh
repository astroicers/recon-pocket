#!/bin/bash

cat /subdomain_live.txt |
sed '/^$/d' |
while read -r subdomain_live
do
    echo $subdomain_live | waybackurls > /tmp/waybackurls_$subdomain_live.txt
done

if [[ ${?} != 0 ]]
then
    exit 1
fi

mv /tmp/waybackurls_$subdomain_live.txt /waybackurls/waybackurls_$subdomain_live.txt