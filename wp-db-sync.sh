#!bin/bash
# A simple bash script to import/export a wordpress database to current wordpress installation directory.
# written by Alfio Salanitri <www.alfiosalanitri.it> and are licensed under MIT license. 

dump_name='dump.sql'
current_directory=$(pwd)

# Get db config options from wp-config file
file_config="$current_directory/wp-config.php"
if [ ! -f "$file_config" ]; then
  printf "The wp-config.php file doesn't exists. \n"
  exit 1
fi
db_name=$(cat $file_config | grep DB_NAME | cut -d \' -f 4)
db_user=$(cat $file_config | grep DB_USER | cut -d \' -f 4)
db_password=$(cat $file_config | grep DB_PASSWORD | cut -d \' -f 4)

display_help() {
cat << EOF
Copyright (C) 2022 by Alfio Salanitri
Website: https://github.com/alfiosalanitri/wp-db-sync

Usage: $(basename $0) -i
Options
-i
    Backup current database to dump.sql.bkp and import dump.sql file
  
-e
    Export database to dump.sql file
    
-h, --help
    show this help
-------------
EOF
exit 0
}

import_db() {
  printf "Importing database...\n"
  mysqldump -u$db_user -p$db_password $db_name > "$dump_name.bkp"
  mysql -u$db_user -p$db_password -e "drop database $db_name;"
  mysql -u$db_user -p$db_password -e "create database $db_name;"
  mysql -u$db_user -p$db_password $db_name < $dump_name
  printf "Done.\n"
}

export_db() {
  printf "Dumping database...\n"
  mysqldump -u$db_user -p$db_password $db_name > $dump_name
  printf "Done.\n"
}

if [ ! "$1" ]; then
  display_help
  exit 1
fi

while [ $# -gt 0 ] ; do
  case $1 in
    -h | --help) display_help ;;
    -i) import_db;;
    -e) export_db;;
  esac
  shift
done
exit 0
