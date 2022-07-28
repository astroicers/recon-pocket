#! /bin/sh

whois ${1} > /whois/whois.txt
echo "done" > /whois/done.txt