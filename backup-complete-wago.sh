####vychází s toho že v /promenna je spouštěč ./retain na zálohu proměnných z paměti. 
####  pozor retain by mělo wago už obsahovat ve svém systému. Hádal bych to na nějaký /sbin  kde bude  ./retain  -- muj kompilovaný eqialent pro FW kde ješte není ./retain_sdk-12 -r /tmp/backup-pixly/transfer/$HOSTNAME-promenna 



######Mart -- nerucim za to ze tenhle bazmek bude vsude chodit :D######
#KROK#1  definujeme lokalni docasnou promenou hostname a globalni promenne 

echo Vytvarim soubor kde je host_name RTU jako zalohu do /tmp/zaloha-pixly/transfer do tohoto souboru se ulozi k ostatnim zaloham !

mkdir /tmp/backup-pixly/
cd /tmp/backup-pixly/
mkdir transfer
###
echo $HOSTNAME
#!/bin/sh
cd "/promenne/bin/"
./retain_sdk-12 -r /tmp/backup-pixly/transfer/$HOSTNAME-promenna 



#####zalozni promenna pro jine scripty co vyčítají hodnoty, nesouvisi s backupem####
zjistiip="ip a"
zjististav="dmesg"
setriddata="lsof"



echo Vytvarim soubor kde je host_name RTU jako zalohu do /promenne/backup/jmeno  do tohoto souboru se ulozi zaloha slozi jen pro backup uklada se na server a dela se automaticky  a nemaze se!
cd /promenne/
mkdir backup
###
echo $HOSTNAME
#!/bin/sh
cd "/promenne/bin/"
./retain_sdk-12 -r /promenne/backup/$HOSTNAME 



echo $HOSTNAME

####definujeme zalohovani PLC projektu
/bin/bash /etc/config-tools/firmware_backup device-medium=network download-dir=/tmp/backup-pixly/transfer/$HOSTNAME-PLC-runtime-projekt/ auto-update=0 enc-passphrase= package-codesys=1 package-settings=0 package-settings=0 package-system=0
echo $HOSTNAME



#definujeme zalohu settings tj. systemove nastaveni pixly 
/bin/bash /etc/config-tools/firmware_backup device-medium=network download-dir=/tmp/backup-pixly/transfer/$HOSTNAME-SETTINGS auto-update=0 enc-passphrase= package-codesys=0 package-settings=1 package-system=0
echo $HOSTNAME



###definujeme zalohu celeho linuxu 
/bin/bash /etc/config-tools/firmware_backup device-medium=network download-dir=/tmp/backup-pixly/transfer/$HOSTNAME-system-linux auto-update=0 enc-passphrase= package-codesys=0 package-settings=0 package-system=1
####




####tedyma uz jen stahnout ... a pak za par hodin idealne smazat :))  doladim scriptem po kopirovani :) 
echo KONEC!!!!!! !!!!!!! 
