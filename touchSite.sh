#! /bin/sh
#
#This shell is auto build site
#
#
time=$(date "+%Y-%m-%d-%H-%M-%S")
echo "$time"
#  create apache docmountdir
mkdir /apps/$time
cd /apps/$time
cp -r /www/wwwroot/apps.kiwimsoft.com/apps.txt /www/wwwroot/apps.kiwimsoft.com/apps1.txt
sitestr=$(wc -l /www/wwwroot/apps.kiwimsoft.com/apps1.txt | awk '{print $1}')
let sitenum=$[sitestr]+1
echo "$sitenum"
sed -i ':t;N;s/\n//;b t' /www/wwwroot/apps.kiwimsoft.com/apps1.txt
# copy sitefile
for ((i=1;i<=$sitenum;i++));
do
	mkdir $i
	cd $i
	cp /www/wwwroot/apps.kiwimsoft.com/upload/file.zip file.zip && unzip file.zip && cd file/file 
	touch test.txt
	cd /apps/$time
        echo 1ok
done
        echo 2ok
# creat site.conf
for ((i=1;i<=$sitenum;i++))
do       
	echo 3ok
  	sitename1=$(cat /www/wwwroot/apps.kiwimsoft.com/apps1.txt | awk -F ";" '{print $'$i'}')
	echo $sitename
	sitename2=.conf
	sitename=${sitename1}${sitename2}
	echo $sitename
	cd /www/server/panel/vhost/apache/ && cp test.conf $sitename
        #文件根目录
        s0=/apps/
        s4=/
        s1=${time}${s4}
        s2=${i}
        s3=/file/file
        str=${s0}${s1}${s2}${s3}
        echo $str
        # servername
        n1=$sitename1
        echo $n1
        sed -i "3s#temple#$str#" $sitename
        sed -i "4s#temple#$n1#" $sitename
done
/etc/init.d/httpd reload
rm -rf /www/wwwroot/apps.kiwimsoft.com/upload file.zip
chmod 777 -R /www/wwwroot/
