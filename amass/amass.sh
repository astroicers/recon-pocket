#! /bin/sh

/bin/amass enum -d ${1} -o /amass/amass.txt
echo "done" > /amass/done.txt