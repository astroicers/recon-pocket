#!/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NO_COLOR='\033[0m'

export TARGET=${1}
export TREASURE="treasure_$(date -u +'%F')"
mkdir ${PWD}/${TREASURE}

# whois
printf "${YELLOW}execution of whois started...${NO_COLOR}\n"
if ! [ -d ${PWD}/${TREASURE}/whois ]; then
    mkdir ${PWD}/${TREASURE}/whois
fi
docker-compose -f ./docker-compose/docker-compose.whois.yml up --build --quiet-pull --abort-on-container-exit 2>&1 > /dev/null
if [[ ${?} != 0 ]]
then
    printf "${RED}execution of whois failed...${NO_COLOR}\n"
else
    printf "${GREEN}execution of whois succeeded!${NO_COLOR}\n"
fi
docker-compose -f ./docker-compose/docker-compose.whois.yml down 2>&1 > /dev/null

# find_subdomain: crt_sh, sublist3r, assetfinder, subfinder, amass
printf "${YELLOW}finding of subdomain started...${NO_COLOR}\n"
declare -a dirs=("crt_sh" "sublist3r" "assetfinder" "subfinder" "amass")
for dir in "${dirs[@]}"; do 
    if ! [ -d ${PWD}/${TREASURE}/${dir} ]; then
        mkdir ${PWD}/${TREASURE}/${dir}
    fi
done
ANS=
while [[ "${ANS}" != "Y" && "${ANS}" != "N" ]]; do
    read -p 'Do you want to enable heavy mode (enable Amass)? [y/N]' ANS
    ANS=$(echo ${ANS} | tr '[:lower:]' '[:upper:]')
    ANS=${ANS:-N}
    if [[ ${ANS} == "N" ]]; then
        docker-compose -f ./docker-compose/docker-compose.find_subdomain.yml --profile medium up --build --quiet-pull 2>&1 > /dev/null
    elif [[ ${ANS} == "Y" ]]; then
        docker-compose -f ./docker-compose/docker-compose.find_subdomain.yml --profile heavy up --build --quiet-pull 2>&1 > /dev/null
    fi
done
docker-compose -f ./docker-compose/docker-compose.find_subdomain.yml down 2>&1 > /dev/null
printf "${GREEN}finding of subdomain completed...${NO_COLOR}\n"

# mutate_subdomain: altdns
printf "${YELLOW}mutation of subdomain started...${NO_COLOR}"
if ! [ -d ${PWD}/${TREASURE}/altdns ]; then
    mkdir ${PWD}/${TREASURE}/altdns
fi
ANS=
while [[ "${ANS}" != "Y" && "${ANS}" != "N" ]]; do
    read -p 'Do you want to run altdns (it does need some time)? [y/N]' ANS
    ANS=$(echo ${ANS} | tr '[:lower:]' '[:upper:]')
    ANS=${ANS:-N}
    if [[ ${ANS} == "N" ]]; then
        printf "${RED}mutation of subdomain stopped!${NO_COLOR}\n"
    elif [[ ${ANS} == "Y" ]]; then
        chmod +x ./scripts/subdomain.sh && ./scripts/subdomain.sh && cp ./${TREASURE}/subdomain.txt ./altdns/
        docker-compose -f ./docker-compose/docker-compose.mutate_subdomain.yml up --build --quiet-pull --abort-on-container-exit 2>&1 > /dev/null
        printf "${GREEN}mutation of subdomain succeeded!${NO_COLOR}\n"
        docker-compose -f ./docker-compose/docker-compose.mutate_subdomain.yml down 2>&1 > /dev/null
    fi
done

# dns_info: dnsrecon, dig
printf "${YELLOW}finding of dns_info started...${NO_COLOR}\n"
declare -a dirs=("dnsrecon" "dig")
for dir in "${dirs[@]}"; do 
    if ! [ -d ${PWD}/${TREASURE}/${dir} ]; then
        mkdir ${PWD}/${TREASURE}/${dir}
    fi
done
# chmod +x ./scripts/subdomain_live.sh && ./scripts/subdomain_live.sh
cp ./${TREASURE}/subdomain_live.txt ./tools/dnsrecon/
cp ./${TREASURE}/subdomain_live.txt ./tools/dig/
docker-compose -f ./docker-compose/docker-compose.dns_info.yml up --build --quiet-pull 2>&1 > /dev/null
docker-compose -f ./docker-compose/docker-compose.dns_info.yml down 2>&1 > /dev/null
printf "${GREEN}finding of dns_info completed...${NO_COLOR}\n"

# internet_history: gau, waybackurls
printf "finding of internet_history started...${NO_COLOR}\n"
declare -a dirs=("gau" "waybackurls")
for dir in "${dirs[@]}"; do 
    if ! [ -d ${PWD}/${TREASURE}/${dir} ]; then
        mkdir ${PWD}/${TREASURE}/${dir}
    fi
done
cp ./${TREASURE}/subdomain_live.txt ./tools/gau/
cp ./${TREASURE}/subdomain_live.txt ./tools/waybackurls/
docker-compose -f ./docker-compose/docker-compose.internet_history.yml up --build --quiet-pull 2>&1 > /dev/null
docker-compose -f ./docker-compose/docker-compose.internet_history.yml down 2>&1 > /dev/null
printf "${GREEN}finding of internet_history completed...${NO_COLOR}\n"

# github_secret: git-hound
printf "${YELLOW}finding of github_secret started...${NO_COLOR}\n"
if ! [ -d ${PWD}/${TREASURE}/git-hound ]; then
    mkdir ${PWD}/${TREASURE}/git-hound
fi
ANS=
while [[ "${ANS}" != "Y" && "${ANS}" != "N" ]]; do
    read -p 'Do you want to run git-hound? [y/N]' ANS
    ANS=$(echo ${ANS} | tr '[:lower:]' '[:upper:]')
    ANS=${ANS:-N}
    if [[ ${ANS} == "N" ]]; then
        printf "${RED}finding of github_secret stopped!${NO_COLOR}\n"
    elif [[ ${ANS} == "Y" ]]; then
        ANS=
        while [[ ! -f ./tools/git-hound/config.yaml ]]; do
            read -p 'Please enter your github username: ' USERNAME
            read -sp 'Please enter your github password: ' password
            echo "github_username: \"${USERNAME}\"" > /tmp/config.yaml
            echo "github_password: \"${password}\"" >> /tmp/config.yaml
            echo
            SAVE=
            read -p 'Save it? [Y/n]' SAVE
            SAVE=$(echo ${SAVE} | tr '[:lower:]' '[:upper:]')
            SAVE=${SAVE:-Y}
            if [[ ${SAVE} == "Y" ]]; then
                mv /tmp/config.yaml ./tools/git-hound/config.yaml
            fi
        done
        cp ./${TREASURE}/subdomain_live.txt ./tools/git-hound/
        docker-compose -f ./docker-compose/docker-compose.github_secret.yml up --build --quiet-pull --abort-on-container-exit 2>&1 > /dev/null
        if [[ ${?} != 0 ]]
        then
            printf "${RED}finding of github_secret failed...${NO_COLOR}\n"
        else
            printf "${GREEN}finding of github_secret succeeded!${NO_COLOR}\n"
        fi
        docker-compose -f ./docker-compose/docker-compose.github_secret.yml down 2>&1 > /dev/null
        break
    fi
done

# service_info: nmap
printf "${YELLOW}finding of service_info started...${NO_COLOR}\n"
if ! [ -d ${PWD}/${TREASURE}/nmap ]; then
    mkdir ${PWD}/${TREASURE}/nmap
fi
cp ./${TREASURE}/subdomain_live.txt ./tools/nmap/
docker-compose -f ./docker-compose/docker-compose.service_info.yml up --build --quiet-pull 2>&1 > /dev/null
docker-compose -f ./docker-compose/docker-compose.service_info.yml down 2>&1 > /dev/null
printf "${GREEN}finding of service_info completed!${NO_COLOR}\n"