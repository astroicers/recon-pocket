#! /bin/sh

cat /subdomain_live.txt |
sed '/^$/d' |
while read -r subdomain_live
do
    echo $subdomain_live | waybackurls > /waybackurls/waybackurls_$subdomain_live.txt
done
echo "done" > /waybackurls/done.txt