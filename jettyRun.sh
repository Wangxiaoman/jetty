#!/bin/bash
# Program
# History
# 2014/09/29   wangxiaoman   first release
#两个参数，第一个是端口，第二个是war包的路径
echo "deloy war begin --------> !"
if [ $# -eq 2 ]; then
	echo "the project port is :$1"
	echo "deloay war dir is :$2"
	#1、判断端口值，是否在文件中存在
	count=`grep -c $1 ProjectPort`
	echo "the war config in the file : $count"
	
	if [ $count -eq 0 ]; then
		echo $count
		#2、如果文件中不存在，则把端口和war包放到文件中
                war=`echo "$2" |awk -F "/" '{print $NF;}'`
                echo "$war : $1" >> ProjectPort
     		echo "restart the war, and pid is $pid"
	else
		#3、如果文件中已经存在那么检测该端口的进程是否存在，如果存在，那么kill掉
		pid=`lsof -i:$1 | grep java | awk '{print $2}' |uniq -f 1`
		if [ $pid ]; then
			#如果该进程存在那么kill掉
			echo "kill the program, and pid is $pid"
			kill -9 $pid
 			#利用jetty包重启该服务
		fi
	fi
	
	#4、启动服务
	echo "========================================war包启动日志 begin===================================================="
        nohup java -jar Jettyproject-0.0.1-SNAPSHOT.jar $1 $2 >> $2_$1.log &
        echo "========================================war包启动日志 end===================================================="
fi
echo "deloy war over --------->!"
