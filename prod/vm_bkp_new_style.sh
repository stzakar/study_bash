#!/bin/bash
. /root/bkp.conf
_date=$(date +%d.%m.%Y-%H.%M.%S)           #Переменная с сегодняшней датой

#Проверка смонтирована ли дирректория бэкапа
df | grep $(get_ip)
_mnt_dir=$?
if [[ "$_mnt_dir" != 0 ]]  
then
        mount -t cifs -o username=$(get_usr),password=$(get_pass) //$(get_ip)/backup /mnt/backup
fi
#-------------------------------------------
virsh pool-refresh --pool default
#---------------------------------------------------------------------------------------------------
        
backup_fn(){
        local _vm=$1        
        sudo aa-disable /etc/apparmor.d/libvirt/libvirt-$(sudo virsh domuuid $_vm) 2>/dev/null
        local _snappath=/mnt/backup/$_vm/$_vm-$_date
        local _tmpdir=/storage/$_vm/$_vm-$_date
        local _vd_list=$(virsh domblklist $_vm | sed 1,2d |grep vd |sed 2,3d |awk '{print $1}') #Имена дисков
        local _vd_dir=$(virsh domblklist $_vm | sed 1,2d |grep vd |sed 2,3d |awk '{print $2}') #Пути до дисков
        local _vml=$(echo $_vm | tr '[:upper:]' '[:lower:]') #Перевод к фактическим именам
        echo "Клонирование виртуальной мaшины: " $_vm
        mkdir -p $_snappath $_tmpdir 
        chown -R super:super $_snappath $_tmpdir
        virsh dumpxml $_vm > $_snappath/$_vm.xml
        echo "Произведен бэкап конфига $_vm"
        echo "Делаем снапшот $_vm от $_date в $_snappath/$_vml.snapshot"
        virsh snapshot-create-as --domain $_vm $_vml.snapshot --disk-only --atomic --quiesce --no-metadata -diskspec $_vd_list,file=$_tmpdir/$_vml.snapshot
        echo "Произведен снапшот диска $_vm"
        echo "Начинаем бэкап основного файла $_vm"
        cp $_vd_dir $_snappath/$_vml.qcow2
        echo "Произведен бэкап основного файла $_vm"        
        echo "Перенос завершен"
        virsh blockcommit $_vm $_vd_list --active --verbose --pivot #Соединяем снапшот с основным файлом ВМ
        virsh pool-refresh --pool default
        echo "Слияние снапшота с основным файлом $_vm завершено"
        [ -e $_tmpdir/$_vml.snapshot ] && mv $_tmpdir/$_vml.snapshot $_snappath && rm -rf /storage/* && echo "Перенос снапшота и удаление временной директории успешно"
}

if [[ $# -eq 0 ]] #Backup all vms
then
        _runvms=$(virsh list | sed 1,2d | awk '{print $2}')
        echo "Следующие запущенные виртуальные машины будут бэкапированы: " $_runvms
        for _vm in ${_runvms[@]}
        do
                if [ "$_vm" != "" ]; then
                        backup_fn $_vm
                fi
        done
else              #Backup selected vms
        for _vm in $@
        do
                if [ "$_vm" != "" ]; then 
                        backup_fn $_vm
                fi
        done
fi
