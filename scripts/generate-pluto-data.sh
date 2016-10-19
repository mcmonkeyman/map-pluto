#!/bin/bash

./scripts/download-zip.sh
./scripts/create-sql.sh ./data/zip
./scripts/move-sql.sh
