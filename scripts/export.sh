#!/bin/bash
_os="`uname`"
_file="data_$(date +"%Y%m%d-%s").sql"

# Export dump
EXPORT_COMMAND='exec mysqldump "$MYSQL_DATABASE" -uroot -p"$MYSQL_ROOT_PASSWORD"'
docker-compose exec db sh -c "$EXPORT_COMMAND" > $_file

if [[ $_os == "Darwin"* ]] ; then
  sed -i '.bak' 1,1d $_file
else
  sed -i 1,1d $_file # Removes the password warning from the file
fi

gzip -5q $_file

aws s3 cp $_file.gz s3://geraloto-wp-backup/
