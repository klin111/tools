#!/bin/bash
echo '请输入原目录路径：'
read sdir1
#保存的目标文件夹数据,最好写完整路径。
file=/root/gege.txt

#循环cp
while  IFS= read -r line 

do
# sleep 1
   cp  -rf $sdir1   $line
   echo $line
done<"$file"
