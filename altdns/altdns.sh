#! /bin/sh

altdns -i subdomain.txt -o altdns_data.txt -w words.txt -r -s /altdns/altdns.txt
echo "done" > /altdns/done.txt