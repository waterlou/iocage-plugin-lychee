#!/bin/sh

LYCHEE_PATH=/usr/local/share/lychee

mkdir -p ${LYCHEE_PATH}
cd ${LYCHEE_PATH}

git clone https://github.com/electerious/Lychee.git .

chmod -R 750 uploads/ data/

CFG=/root/plugin_config

DB=`sysrc -f ${CFG} -n mysql_db`
USER=`sysrc -f ${CFG} -n mysql_user`
PASS=`sysrc -f ${CFG} -n mysql_pass`

CFG=${LYCHEE_PATH}/data/config.php
cp config.php ${CFG}
chown www ${CFG}
sed -i '' -e "s/__DB__/${DB}/g" ${CFG}
sed -i '' -e "s/__USER__/${USER}/g" ${CFG}
sed -i '' -e "s/__PASS__/${PASS}/" ${CFG}
