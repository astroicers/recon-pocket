#! /bin/sh

echo "" > ./${TREASURE}/subdomain_live.txt

for subdomain in $(cat ./${TREASURE}/subdomain.txt)
do
    # ping $subdomain -c 2
    ping -c 1 -W 1 $subdomain
    # if [ $? != 2 ]
    if [ $? != 0 ]
    then
        echo "$subdomain is live"
        echo "$subdomain" >> ./${TREASURE}/subdomain_live.txt
    else
        echo "$subdomain is dead"
        echo "$subdomain" >> ./${TREASURE}/subdomain_dead.txt
    fi
done