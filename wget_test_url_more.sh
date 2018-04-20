#!/bin/bash
#批量测试网站连同性,网站域名放置txt文件中。
file=/root/iosAppDemo.txt


while  IFS= read -r line 

#for curl in  

do
 sleep 4
 wget --spider  $line

done<"$file"

