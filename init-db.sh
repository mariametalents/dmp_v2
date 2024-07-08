#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE DATABASE dmp;
    CREATE DATABASE jiradb;
EOSQL

# Restaurer la base de données à partir du fichier de sauvegarde
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname=dmp -f /shared/backup_dmp.sql