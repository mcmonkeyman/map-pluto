#!/bin/bash

BASEDIR=$(dirname "$0")
DATA_DIR=$BASE_DIR"./data"
ZIP_DIR="$DATA_DIR/zip"

mkdir -p $ZIP_DIR

curl -o $ZIP_DIR/mappluto_16v1.zip http://www1.nyc.gov/assets/planning/download/zip/data-maps/open-data/mappluto_16v1.zip
