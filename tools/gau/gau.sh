#!/bin/bash

cat /subdomain_live.txt |
sed '/^$/d' |
while read -r subdomain_live
do
    gau $subdomain_live --verbose --o /tmp/gau_$subdomain_live.txt
done

if [[ ${?} != 0 ]]
then
    exit 1
fi

mv /tmp/gau_$subdomain_live.txt /gau/gau_$subdomain_live.txt