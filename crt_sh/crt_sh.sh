#! /bin/sh
curl https://crt.sh/?q=${1}|sed -e "/${1}/!d"|sed -e "/<TD>/!d"|sed -e "s/<TD>//"|sed -e "s/<\/TD>//"|sed '$!N; /^\(.*\)\n\1$/!P; D'|sed 's/^[ \t]*//g'|sed -i 's/<BR>/\n/g' > /crt_sh/crt_sh.txt
echo "done" > /crt_sh/done.txt