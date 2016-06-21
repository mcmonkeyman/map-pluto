#!/bin/bash
BASE_DIR=$(dirname "$0")
SQL_DIR=$BASE_DIR"/../sql"

for filename in $SQL_DIR/*
do
	echo $filename
    psql -d pluto -f $filename
done
