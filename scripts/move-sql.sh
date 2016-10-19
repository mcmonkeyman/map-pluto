#!/bin/bash
BASE_DIR=$(dirname "$0")
SQL_DIR="./sql/"
DATA_DIR="./data/sql"
for filename in $DATA_DIR/*
do
    echo $filename
    mv $filename $SQL_DIR
done
