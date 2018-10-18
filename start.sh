#!/bin/sh 

if [ ! -f /conf/aria2.conf ]; then
	cp /conf-default/aria2.conf /conf/aria2.conf
	if [ $SECRET ]; then
		echo "rpc-secret=${SECRET}" >> /conf/aria2.conf
	fi
fi

if [ ! -f /conf/on-complete.sh ]; then
	cp /conf-default/on-complete.sh /conf/on-complete.sh
fi

chmod +x /conf/on-complete.sh
touch /conf/aria2.session

EXIT_CODE_SIGTERM=143

SIG_handler () {
	if [ -n $AriaNG_PID ]; then
		kill -s SIGTERM $AriaNG_PID
	fi
	if [ -n $AriaData_PID ]; then
		kill -s SIGTERM $AriaData_PID
	fi
	if [ -n $Aria2c_PID ]; then
		kill -s SIGTERM $Aria2c_PID
	fi
}

trap "SIG_handler" SIGTERM SIGHUP SIGINT SIGQUIT

darkhttpd /AriaNg --port 80 &
AriaNG_PID=$!

darkhttpd /data --port 8080 &
AriaData_PID=$!

aria2c --conf-path=/conf/aria2.conf &
Aria2c_PID=$!

wait $Aria2c_PID

