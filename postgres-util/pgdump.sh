#!/usr/bin/env bash

username="$1"
password="$2"
host="$3"
db="$4"

pg_dump -U $username -h $host --clean $db | gzip > dump.sql.gz
sleep 300 # 5 mins timeout
