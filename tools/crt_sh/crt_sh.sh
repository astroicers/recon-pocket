#!/bin/bash
curl https://crt.sh/?q=${1} | grep "${1}" | grep "<TD>" | sed -e 's/<TD>//' | sed -e 's/<\/TD>//' | sed '$!N; /^\(.*\)\n\1$/!P; D' | sed 's/^[ \t]*//g' | sed -e 's/<BR>/\n/g' > /tmp/crt_sh.txt

if [[ ${?} != 0 ]]
then
    exit 1
fi

mv /tmp/crt_sh.txt /crt_sh/crt_sh.txt