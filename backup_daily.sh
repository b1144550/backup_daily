#!/bin/bash

# 0. Get the date messages and backup directory
day=`date +%Y-%m-%d`
basedir=”/home/backup/daily”

# 1. MySQL ( PATH = /var/lib/mysql )
/etc/rc.d/init.d/mysqld stop
cd /var/lib
tar -zcf “$basedir”/mysql.”$day”.tar.gz mysql 2> /dev/null
/etc/rc.d/init.d/mysqld start

# 2. html ( PATH = /var/www/html )
cd /var/www
tar -zcf “$basedir”/html.”$day”.tar.gz html 2> /dev/null
