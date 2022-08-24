#!/bin/bash

/bin/assetfinder -subs-only ${1} > /tmp/assetfinder.txt

if [[ ${?} != 0 ]]
then
    exit 1
fi

mv /tmp/assetfinder.txt /assetfinder/assetfinder.txt