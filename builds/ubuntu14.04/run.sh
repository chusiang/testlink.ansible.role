#!/bin/bash

service php7.0-fpm start
service nginx start
service mysql start
tail -f /dev/null
