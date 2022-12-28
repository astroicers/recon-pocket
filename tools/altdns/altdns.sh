#!/bin/bash

altdns -i subdomain.txt -o altdns_data.txt -w words.txt -r -s /tmp/altdns.txt

if [[ ${?} != 0 ]]
then
    exit 1
fi

mv /tmp/altdns.txt /altdns/altdns.txt