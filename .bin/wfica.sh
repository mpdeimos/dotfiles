#!/bin/sh
export ICAROOT=/opt/Citrix/ICAClient
date -I >> ~/wfica.log
${ICAROOT}/wfica -file "$1"
