
# About

These scripts are used to process pluto map data into a freshly created db.

The raw data source can be found here:
[http://www1.nyc.gov/site/planning/data-maps/open-data/pluto-mappluto-archive.page](http://www1.nyc.gov/site/planning/data-maps/open-data/pluto-mappluto-archive.page)


# Requirements

#### 1. Install postgres and postgis

```
brew install postgres
brew install postgis
brew install flyway
```

# Running


#### 1. Create the user, schema, db and grant permissions.

```
sh ./setup-db/runall.sh
```

#### 2. Create the sql to load the data

```
sh ./scripts/generate-pluto-data.sh
```

This script downloads the zip file, generates the sql migratations for the
pluto data and moves the migrations to the sql folder.

The outputted files will be in the `./sql` folder in th form.

```
```

#### 3. Run the sql migrations to create the db and load the data

```
flyway -configFile=./conf/flyway.conf -X "-Xms1024M -Xmx4096M" migrate
```


