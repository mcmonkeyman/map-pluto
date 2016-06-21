
# About

These scripts are used to process pluto map data into a freshly created db.

The raw data source can be found here: http://www1.nyc.gov/site/planning/data-maps/open-data/pluto-mappluto-archive.page


# Requirements

#### 1. Install postgres and postgis

```
brew install postgres
brew install postgis
```

# Running


#### 1. Create the user, schema, db and grant permissions. 

```
psql -U postgres -f ./setup-sql/create_flyway_user.sql
psql -U postgres -f ./setup-sql/create_pluto_db.sql
psql -U postgres -d pluto -f ./setup-sql/create_raw_schema.sql
psql -U postgres -d pluto -f ./setup-sql/set-permissions.sql
psql -U postgres -d pluto -f ./setup-sql/add_postgis_extension.sql
```

#### 2. Create the sql to load the data

The load migrations actually load the data into the db, as apposed to the schema migrations. They
were created using the bash scripts in the `./scripts` folder. You can optionally
re-run them using the commands below. 

```
./scripts/download-zip.sh
./scripts/create-sql.sh
```

The outputted files will be in the `./data` folder so make sure they look good and 
move them to the sql folder.

```
mv ./data/sql/* ./sql/
```

#### 3. Run the sql migrations to create the db and load the data

```
./scripts/load-sql.sh
```


