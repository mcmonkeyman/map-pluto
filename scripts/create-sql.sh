#!/bin/bash

# Check for flags
if [ $# -ne 1 ]; then
  echo "Missing flag."
  echo "Usage:./create-sql.sh <DIR_WITH_ZIP>"
  exit 1
fi

SRC_SCHEMA="raw"
SRC_TABLE="map_history"

SRC_DIR=$1
BASE_DIR=$(dirname "$0")
DATA_DIR=$BASE_DIR"/../data"
ZIP_DIR="$DATA_DIR/zip"
SHP_DIR="$DATA_DIR/shp"
DEST_DIR="$DATA_DIR/sql"

# Cleanup  
printf "\n-----> Removing $SHP_DIR/*, if it exists...\n\n"
if [ -d "$SHP_DIR" ]; then
    rm -rf $SHP_DIR
fi

printf "\n-----> Removing $DEST_DIR/*, if it exists...\n\n"
if [ -d "$DEST_DIR" ]; then
    echo "rm -rf $DEST_DIR/*"
    rm -rf $DEST_DIR
fi

mkdir -p $ZIP_DIR 
mkdir -p $SHP_DIR
mkdir -p $DEST_DIR

# Unzip files
for filename in $SRC_DIR/*
do
	time unzip $filename *PLUTO.shp -d $SHP_DIR/
	# time unzip $filename *_Mappinglot.shp -d $SHP_DIR/
	time unzip $filename *.shx -d $SHP_DIR/
	time unzip $filename *.dbf -d $SHP_DIR/
done

# convert shapefile to psql copy command (requires postgis package)
printf "\n-----> Converting .shp to a PostgreSQL-compatible dump with shp2pgsql...\n\n"
for filename in `find $SHP_DIR -name "*.shp" -print`
do
    TIME_STAMP=$(date +%Y_%m_%d.%H.%M.%S)
    FILE_SUFFIX=`basename $filename .shp`".sql"
    FILE_NAME="V"$TIME_STAMP"__"$FILE_SUFFIX
    time shp2pgsql -a -s 2263 -D -g geom -N abort $filename $SRC_SCHEMA.$SRC_TABLE >> $DEST_DIR/$FILE_NAME
done

printf "\n-----> Files created...\n\n"
for filename in $DEST_DIR/*
do
	echo $filename
done
