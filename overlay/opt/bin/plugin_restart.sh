#!/bin/sh

service nginx stop
service redis stop
service mysql-server stop


service mysql-server start
service redis start
service nginx start
