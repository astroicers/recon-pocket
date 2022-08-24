#!/bin/bash

whois ${1} > /tmp/whois.txt

if [[ ${?} != 0 ]]
then
    exit 1
fi

mv /tmp/whois.txt /whois/whois.txt