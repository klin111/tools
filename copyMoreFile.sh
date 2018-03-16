#!/bin/bash
echo '请输入原目录路径：'
read sdir1

echo '请输入目标目录路径（用逗号隔开）：'

read ddir

a=$(echo "$ddir" | awk -F, '{print NF}')
#echo $a

for((i=1;i<=$a;i++))
do 
   #echo $i
   a2=`echo $ddir |gawk -F, '{print $'$i'}'`
   #echo $ddir
   echo $a2
   cp -r $sdir1 $a2 
done
   echo 'error'


#for((m=1;m<=n;m++))
#do
#  a2=`echo $sdir |gawk -F, '{print $'$n'}'`
#
#  echo $a2 
#done

