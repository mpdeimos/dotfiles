#!/bin/sh
if [[ ! -s ~/wfica.csv ]]
then
	echo "Date      ;SSID" > ~/wfica.csv
fi
loginDate=`date -I`
loginSsid=`nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -d: -f2`
line="$loginDate;$loginSsid"
last=`cat ~/wfica.csv | tail -1`
if [[ "$line" != "$last" ]]
then
	echo  $line >> ~/wfica.csv
fi

export ICAROOT=/opt/Citrix/ICAClient
${ICAROOT}/wfica -file "$1"
