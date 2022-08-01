#! /bin/sh

git-hound --config-file /config.yaml --regex-file /regexes.txt --subdomain-file /subdomain_live.txt --dig-files --dig-commits > /git-hound/git-hound.txt
echo "done" > /git-hound/done.txt