#!/bin/bash
#date  : 2015-09-29
#author: tomorrow
#description : exec script to create random password that include characters, numbers, special signs

#定义一个字符串，随机密码将在这个字符串里产生，如果不需要一些特殊符号可以随时删除（需要可以随时添加）
str='abcdefghijklmnopqrstuvwxyzABCDEFGHIJILMNOPQRSTUVWXYZ,./<>?[]{}1234567890-=\!@#$%^&*()_+|'
read -e -p "enter a number to point bits of a password :" num 
if [ -z $num ];then
   echo "Usage: $0 number."
   exit 3
fi
len=`expr length $str`
for i in  `seq $num`
do
   ran=$(date +%s%N)
   n=$(($ran % $len))
   rstr=${rstr}${str:$n:1}
done
echo
echo "get $num bit password:     ${rstr}"
echo
exit 0
