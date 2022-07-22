#! /bin/sh

echo "${1}" > target.txt
altdns -i ./target.txt -o ./altdns_data.txt -w ./words.txt -r -s /altdns/altdns.txt
echo "done" > /altdns/done.txt