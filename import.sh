#!/bin/sh

agens --file="$AGENS_IMPORTDATA_CONTAINER_ROOT/sql/create_user_db.sql"
agens --variable=cwd="$AGENS_IMPORTDATA_CONTAINER_ROOT/csvs/" --file="$AGENS_IMPORTDATA_CONTAINER_ROOT/sql/import.sql" northwind
