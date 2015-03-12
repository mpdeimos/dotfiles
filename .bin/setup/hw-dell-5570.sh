#!/bin/bash

# Switch modem from MBIM to QMI configuration #

## Disable MBIM kernel module, otherwise usb modeswitch fails ##
modprobe -r cdc_mbim

## Load QMI module ##
modprobe qmi_wwan

## Switch modem to config 1 (QMI) ##
# usb_modeswitch -v 413c -p 81a3 -u 1 


# Enable ModemManager #

systemctl status ModemManager
if [[ $? != 0 ]]
then
	systemctl start ModemManager
fi

# Enable Device #

ip link set dev wwp0s20u7i8 up

qmi-network /dev/cdc-wdm0 start

