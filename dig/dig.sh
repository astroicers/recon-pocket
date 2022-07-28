#! /bin/sh

cat subdomain_live.txt |
sed '/^$/d' |
while read -r subdomain_live
do
    dig $subdomain_live > /dig/dig_$subdomain_live.txt
done

echo "done" > /dig/done.txt