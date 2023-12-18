#!/bin/bash
#Author Sternin K.V.

_base_1c=$(sudo -i -u postgres /usr/bin/psql -U postgres -l | grep "lr" | awk '{print $1}')
_bkp_dir="/mnt/backup/upr/"
_log_dir="/mnt/backup/upr/log/"
_1cuser="admin"
_1cpass="Dsv010vf"
_ip=192.168.10.5
_client="/opt/1cv8/x86_64/8.3.23.1865/1cv8"

for _base in ${_base_1c};
do
        _date=$(date +%d.%m.%Y-%H.%M.%S)  
        echo "$(date +%d.%m.%Y-%H.%M.%S) Start export dt database from $_base"
        xvfb-run -a $_client CONFIG /DumpIB $_bkp_dir/$_date-$_base.dt /Out $_log_dir/$_date-$_base-out.log /S $_ip\\$_base /N $_1cuser /P $_1cpass /DumpResult $_log_dir/$_date-$_base-result.log
        echo "$(date +%d.%m.%Y-%H.%M.%S) Finish export dt database from $_base"
done
