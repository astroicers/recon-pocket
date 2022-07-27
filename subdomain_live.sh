#! /bin/sh

echo "" > ./treasure/subdomain_live.txt

for subdomain in $(cat ./treasure/subdomain.txt)
do
    ping $subdomain -c 2
    if [ $? != 2 ]
    then
        echo "$subdomain" >> ./treasure/subdomain_live.txt
    else
        echo "$subdomain is dead"
    fi
done