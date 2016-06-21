
# About

These scripts are used to process pluto map data into a freshly created db.

The raw data source can be found here: http://www1.nyc.gov/site/planning/data-maps/open-data/pluto-mappluto-archive.page


# Requirements

#### 1. Install postgres and postgis

```
brew install postgres
brew install postgis
```

#### 2. Install flyway

```
brew install flyway
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

#### 2. Run the sql migrations to create the db and load the data

```
flyway -configFile=./conf/flyway.conf info 
flyway -configFile=./conf/flyway.conf migrate 
```

```
./scripts/load-sql.sh
```

# How were the load migrations created?

The load migrations actually load the data into the db, as apposed to the schema migrations. They
were created using the bash scripts in the `./scripts` folder. You can optionally
re-run them using the commands below. The outputted files will be in the `./data` folder.

```
./scripts/download-zip.sh
./scripts/create-sql.sh
```

