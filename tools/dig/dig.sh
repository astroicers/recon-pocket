#! /bin/sh

cat subdomain_live.txt |
sed '/^$/d' |
while read -r subdomain_live
do
    dig $subdomain_live > /tmp/dig_$subdomain_live.txt
done

if [[ ${?} != 0 ]]
then
    exit 1
fi

mv /tmp/dig_$subdomain_live.txt /dig/dig_$subdomain_live.txt