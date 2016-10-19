#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
bin=${DIR}/../bin
lib=${DIR}/../lib

echo '{
    "type" : "jdbc",
    "jdbc" : {
        "url" : "jdbc:postgresql://localhost:5432/pluto?loglevel=0",
        "user" : "flyway",
        "password" : "flyway",
        "sql" : "postgres-pluto-data.sql",
        "index" : "pluto",
        "type" : "pluto",
        "index_settings" : {
            "index" : {
                "number_of_shards" : 10
            }
        },
        "type_mapping" : {
            "pluto": {
                "properties" : {
                    "gid" : {
                        "type" : "string"
                    },
                    "location" : {
                        "type" : "geo_point",
                        "geohash": true,
                        "geohash_precision":10
                    }
                }
            }
        }
    }
}
' | java \
    -cp "${lib}/*" \
    -Dlog4j.configurationFile=${bin}/log4j2.xml \
    org.xbib.tools.Runner \
    org.xbib.tools.JDBCImporter
echo 'Done'
