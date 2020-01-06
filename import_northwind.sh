#!/bin/sh

SAMPLE_DB_USER_PWD="$(< "$SAMPLE_DB_USER_PWD_FILE")"

agens --variable=dbname="$SAMPLE_DB_NAME" --variable=dbuser="$SAMPLE_DB_USERNAME" --variable=dbpass="$SAMPLE_DB_USER_PWD" --file="$AGENS_IMPORTDATA_CONTAINER_ROOT/imdb_sql/create_user.sql"
# taken from https://stackoverflow.com/a/18389184/4106215
echo "SELECT 'CREATE DATABASE $SAMPLE_DB_NAME WITH OWNER $SAMPLE_DB_USERNAME' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = '$SAMPLE_DB_NAME')\gexec" | agens
agens --variable=cwd="$AGENS_IMPORTDATA_CONTAINER_ROOT/northwind_csvs/" --file="$AGENS_IMPORTDATA_CONTAINER_ROOT/northwind_sql/import.sql" "$SAMPLE_DB_NAME" "$SAMPLE_DB_USERNAME"
