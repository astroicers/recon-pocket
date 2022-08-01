#! /bin/sh

cat /subdomain_live.txt |
sed '/^$/d' |
while read -r subdomain_live
do
    gau $subdomain_live --verbose --o /gau/gau_$subdomain_live.txt
done
echo "done" > /gau/done.txt