#!/bin/bash

# MySQL.
usermod -d /var/lib/mysql/ mysql
chown -R mysql:mysql /var/lib/mysql/
service mysql start

# PHP 7.
service php7.0-fpm start

# Nginx.
service nginx start

tail -f /dev/null
