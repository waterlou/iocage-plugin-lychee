#!/bin/sh

LYCHEE_PATH=/usr/local/share/lychee

mkdir -p ${LYCHEE_PATH}
cd ${LYCHEE_PATH}

git clone https://github.com/LycheeOrg/Lychee.git .

composer install --no-dev

# chown -R www uploads/ data/
# chmod -R 750 uploads/ data/

chgrp -R www storage/ public/dist/ public/sym/ public/uploads/
chmod -R 755 storage/* app/* public/dist/ public/sym/ public/uploads/ bootstrap/
chmod 775 .

# CFG=/root/plugin_config

# DB=`sysrc -f ${CFG} -n mysql_db`
# USER=`sysrc -f ${CFG} -n mysql_user`
# PASS=`sysrc -f ${CFG} -n mysql_pass`

# CFG=${LYCHEE_PATH}/data/config.php
# cp /usr/local/etc/config.php.dist ${CFG}
# chown www ${CFG}
# sed -i '' -e "s/__DB__/${DB}/g" ${CFG}
# sed -i '' -e "s/__USER__/${USER}/g" ${CFG}
# sed -i '' -e "s/__PASS__/${PASS}/" ${CFG}

# php artisan migrate
# php artisan key:generate
