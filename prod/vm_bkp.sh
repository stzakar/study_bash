#!/bin/bash
NEST="/var/lib/libvirt/images"            #Путь расположения дисков виртуальных машин ( дефолтный пул )
DATA=$(date +%d.%m.%Y-%H:%M:%S)           #Переменная с сегодняшней датой
BACKUPDIR="/mnt/backup"                   #Переменная пути для бэкапа

#Проверка смонтирована ли дирректория бэкапа
df | grep 192.168.0.6
dmnt=$?
if [[ "$dmnt" != 0 ]]  
then
        mount -t cifs -o username=super,password=******** //192.168.0.6/backup /mnt/backup
fi
#-------------------------------------------
virsh pool-refresh --pool default
#---------------------------------------------------------------------------------------------------
        
backup_fn(){
        VM=$1        
        sudo aa-disable /etc/apparmor.d/libvirt/libvirt-$(sudo virsh domuuid $VM)
        SNAPPATH=/mnt/backup/$VM/$VM-$DATA
        TMPPATH=/storage/$VM/$VM-$DATA
        DISKLIST=$(virsh domblklist $VM | sed 1,2d |grep vd |sed 2,3d |awk '{print $1}') #Имена дисков
        DISKPATH=$(virsh domblklist $VM | sed 1,2d |grep vd |sed 2,3d |awk '{print $2}') #Пути до дисков
        VMl=$(echo $VM | tr '[:upper:]' '[:lower:]') #Перевод к фактическим именам
        echo "Клонирование виртуальной мaшины: " $VM
        mkdir -p $SNAPPATH $TMPPATH 
        chown -R super:super $SNAPPATH $TMPPATH
        virsh dumpxml $VM > $SNAPPATH/$VM.xml
        echo "Произведен бэкап конфига $VM"
        sleep 3
        echo "Делаем снапшот $VM от $DATA в $SNAPPATH/$VMl.snapshot"
        virsh snapshot-create-as --domain $VM $VMl.snapshot --disk-only --atomic --quiesce --no-metadata -diskspec $DISKLIST,file=$TMPPATH/$VMl.snapshot
        echo "Произведен снапшот диска $VM"
        sleep 3
        CLONEVM="CLONE-$VM"
        echo "Начинаем бэкап основного файла $VM"
        cp $DISKPATH $SNAPPATH/$VMl.qcow2
        echo "Произведен бэкап основного файла $VM"        
        sleep 3
        echo "Перенос завершен"
        virsh blockcommit $VM $DISKLIST --active --verbose --pivot #Соединяем снапшот с основным файлом ВМ
        virsh pool-refresh --pool default
        echo "Слияние снапшота с основным файлом $VM завершено"
        echo "------------------------------------------------"
        sleep 2
        [ -e $TMPPATH/$VMl.snapshot ] && mv $TMPPATH/$VMl.snapshot $SNAPPATH && rm -rf /storage/* && echo "Перенос снапшота и удаление временной директории успешно"           
}

if [[ $# -eq 0 ]] #Backup all vms
then
echo "Следующие запущенные виртуальные машины будут бэкапированы: " $RUNNINGVMS
RUNNINGVMS=$(virsh list | sed 1,2d | awk '{print $2}')
        for VM in ${RUNNINGVMS[@]}
        do
                if [ "$VM" != "" ]; then
                        backup_fn $VM
                fi
        done
else              #Backup selected vms
        for VM in $@
        do
                if [ "$VM" != "" ]; then 
                        backup_fn $VM
                fi
        done
fi