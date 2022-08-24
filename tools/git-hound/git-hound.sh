#!/bin/bash

git-hound --config-file /config.yaml --regex-file /regexes.txt --subdomain-file /subdomain_live.txt --dig-files --dig-commits > /tmp/git-hound.txt

if [[ ${?} != 0 ]]
then
    exit 1
fi

mv /tmp/git-hound.txt /git-hound/git-hound.txt