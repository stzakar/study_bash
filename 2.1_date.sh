#!/bin/bash
DT=`date` 
WH=`who`
UP=`uptime`
echo -e "$DT\n$WH\n$UP" >> /var/log/messages

