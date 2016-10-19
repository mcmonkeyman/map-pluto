psql -U postgres -f ./setup-sql/create_flyway_user.sql
psql -U postgres -f ./setup-sql/create_pluto_db.sql
psql -U postgres -d pluto -f ./setup-sql/create_raw_schema.sql
psql -U postgres -d pluto -f ./setup-sql/set-permissions.sql
psql -U postgres -d pluto -f ./setup-sql/add_postgis_extension.sql
