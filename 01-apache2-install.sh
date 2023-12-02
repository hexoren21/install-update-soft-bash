#!/bin/bash

#Variable declaration
SERVICE="apache2"
SERVICEPID="/var/run/apache2/apache2.pid"

#checking whether the Apache service is installed
echo "####################################"
which $SERVICE &> /dev/null
 
if [ $? -eq 0 ]
then
	echo "Apache is installed."
else
	echo "Apache in not installed."
	echo "Download Apache service."
	sudo DEBIAN_FRONTEND=noninteractive apt-get install $SERVICE -y &> /dev/null
fi

#checking whether the Apache service is turned on

if [ -f $SERVICEPID ]
then
	echo "Process Apache is running"
else
	echo "Process Apache is not running"
	echo "Starting the process"
	systemctl start $SERVICE
	if [ -f $SERVICEPID ]
	then
		echo "Process started successfully"
	else
		echo "Apache Starting Failed, contact the admin"
	fi
fi
echo "#####################################"
