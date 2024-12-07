#!/usr/bin/env bash

username="$POSTGRES_USER"
host="$POSTGRES_HOST"
db="$POSTGRES_DB"
clean="${POSTGRES_CLEAN:-}"

pg_dump -U $username -h $host $clean $db | gzip > dump.sql.gz
sleep 300 # 5 mins timeout
