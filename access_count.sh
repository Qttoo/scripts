#!/bin/bash
#date : 2018-07-02

TEMPLATE="/data/scripts/template"
echo
echo "Usage : bash `basename $0` /your/path/to/nginx/log_file_name"
echo "Example : bash `basename $0` /var/log/nginx/access.log_20180702"
echo "If no filename given , default file name is : /var/log/nignx/access.log"

echo
read -p  "Press Enter to continue , ctrl+c to exit " ans
echo
LOG=$1
if [ -z $1 ];then
    LOG=/var/log/nginx/access.log
fi

if [ ! -f $LOG ];then
   echo "$LOG file not exists , please check you filename"
   exit 2
fi

cat $LOG | cut -d: -f 2,3 | uniq -c | awk '{print $2}' > /opt/`date +%Y%m%d`.log

echo
echo "no access log time hour:minutes"
grep -v -f  /opt/`date +%Y%m%d`.log $TEMPLATE
