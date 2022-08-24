#!/bin/bash

echo "" > ./${TREASURE}/subdomain_tmp.txt
cat "./${TREASURE}/amass/amass.txt" >> ./${TREASURE}/subdomain_tmp.txt
cat "./${TREASURE}/altdns/altdns.txt" >> ./${TREASURE}/subdomain_tmp.txt
cat "./${TREASURE}/assetfinder/assetfinder.txt" >> ./${TREASURE}/subdomain_tmp.txt
cat "./${TREASURE}/subfinder/subfinder.txt" >> ./${TREASURE}/subdomain_tmp.txt
cat "./${TREASURE}/sublist3r/sublist3r.txt" >> ./${TREASURE}/subdomain_tmp.txt
cat "./${TREASURE}/crt_sh/crt_sh.txt" >> ./${TREASURE}/subdomain_tmp.txt

# remove space rows
sed -i '/^$/d' ./${TREASURE}/subdomain_tmp.txt
# remove ":" and behind data
sed -i 's/:.*$//g' ./${TREASURE}/subdomain_tmp.txt
# remove same rows
sort ./${TREASURE}/subdomain_tmp.txt | sed '$!N; /^\(.*\)\n\1$/!P; D' > ./${TREASURE}/subdomain.txt
# remove tmp
rm ./${TREASURE}/subdomain_tmp.txt