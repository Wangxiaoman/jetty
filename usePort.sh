#!/bin/bash
# Program
# History
# 2014/09/29   wangxiaoman   first release

#生成一个可以用的端口，取文件中端口的最大值加1
maxPort=`awk '{print $3}' ProjectPort | sort -n -r|uniq -f 1`
echo "first port is : $maxPort"
pid=1
usePort=$maxPort
while [ $pid ];do
	usePort=$(( $usePort + 1 ))
	#usePort = `expr $usePort + 1`
	#echo "port is :$usePort"
	pid=`lsof -i:$usePort | grep java | awk '{print $2}' |uniq -f 1`
done

echo "The max port in ProjectPort file is : $usePort"
