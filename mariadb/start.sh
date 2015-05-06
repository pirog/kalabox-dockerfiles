#!/bin/sh

/usr/bin/mysql_install_db --user=root --ldata=/sql
/usr/bin/mysqld_safe --user=root --datadir='/sql'
