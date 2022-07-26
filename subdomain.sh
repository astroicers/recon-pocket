#! /bin/sh

echo "" > ./treasure/subdomain_tmp.txt
cat "./treasure/amass/amass.txt" >> ./treasure/subdomain_tmp.txt
cat "./treasure/altdns/altdns.txt" >> ./treasure/subdomain_tmp.txt
cat "./treasure/assetfinder/assetfinder.txt" >> ./treasure/subdomain_tmp.txt
cat "./treasure/subfinder/subfinder.txt" >> ./treasure/subdomain_tmp.txt
cat "./treasure/sublist3r/sublist3r.txt" >> ./treasure/subdomain_tmp.txt
cat "./treasure/crt_sh/crt_sh.txt" >> ./treasure/subdomain_tmp.txt

# remove space rows
sed -i '/^$/d' ./treasure/subdomain_tmp.txt
# remove ":" and behind data
sed -i 's/:.*$//g' ./treasure/subdomain_tmp.txt
# remove same rows
sort ./treasure/subdomain_tmp.txt | sed '$!N; /^\(.*\)\n\1$/!P; D' > ./treasure/subdomain.txt
# remove tmp
rm ./treasure/subdomain_tmp.txt