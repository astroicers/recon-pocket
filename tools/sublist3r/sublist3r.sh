#!/bin/bash

python3 sublist3r.py -d ${1} -o /tmp/sublist3r.txt

if [[ ${?} != 0 ]]
then
    exit 1
fi

mv /tmp/sublist3r.txt /sublist3r/sublist3r.txt