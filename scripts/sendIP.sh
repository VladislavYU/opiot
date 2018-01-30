#!/bin/bash

ip=
while IFS=$': \t' read -a line ;do
    [ -z "${line%inet}" ] && ip=${line[${#line[1]}>4?1:2]} &&
        [ "${ip#127.0.0.1}" ] && myip=$ip
  done< <(LANG=C /sbin/ifconfig)
echo $ip

python /home/orangepi/OPIoT/scripts/send_msg.py -a $ip