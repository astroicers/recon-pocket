#!/bin/bash

/bin/subfinder -silent -d ${1} -o /tmp/subfinder.txt

if [[ ${?} != 0 ]]
then
    exit 1
fi

mv /tmp/subfinder.txt /subfinder/subfinder.txt