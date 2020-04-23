#!/bin/sh
# Start the service

cp /usr/local/etc/php.ini-production /usr/local/etc/php.ini
service php-fpm start


# listen = 127.0.0.1:9000

# Update it as follows:
# listen = /var/run/php72-fpm.sock

# Uncomment the following line:
# listen.owner = www
# listen.group = www
# listen.mode = 0660