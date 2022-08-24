#!/bin/bash

/bin/amass enum -d ${1} -o /tmp/amass.txt

if [[ ${?} != 0 ]]
then
    exit 1
fi

mv /tmp/amass.txt /amass/amass.txt