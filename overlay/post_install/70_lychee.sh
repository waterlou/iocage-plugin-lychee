#!/bin/sh

LYCHEE_PATH=/usr/local/share/lychee

mkdir -p ${LYCHEE_PATH}
cd ${LYCHEE_PATH}

git clone https://github.com/LycheeOrg/Lychee.git .

composer install --no-dev

chown -R www:www storage/ public/dist/ public/sym/ public/uploads/
chmod -R 755 storage/* app/* public/dist/ public/sym/ public/uploads/ bootstrap/
chmod 775 .

CFG=/root/plugin_config

DB=`sysrc -f ${CFG} -n mysql_db`
USER=`sysrc -f ${CFG} -n mysql_user`
PASS=`sysrc -f ${CFG} -n mysql_pass`

CFG=${LYCHEE_PATH}/.env
cp ${CFG}.example ${CFG}
sed -i '' -e "s/DB_DATABASE=homestead/DB_DATABASE=${DB}/g" ${CFG}
sed -i '' -e "s/DB_USERNAME=homestead/DB_USERNAME=${USER}/g" ${CFG}
sed -i '' -e "s/DB_PASSWORD=secret/DB_PASSWORD=${PASS}/g" ${CFG}
sed -i '' -e "s/DB_PORT=3306/DB_SOCKET=\/tmp\/mysql.sock/g" ${CFG}

php artisan migrate
php artisan key:generate
