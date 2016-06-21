BEGIN;
    CREATE TABLE raw.map_history (
        gid integer NOT NULL,
        borough character varying(2),
        block integer,
        lot smallint,
        cd smallint,
        ct2010 character varying(7),
        cb2010 character varying(5),
        schooldist character varying(2),
        council smallint,
        zipcode integer,
        firecomp character varying(4),
        policeprct smallint,
        healtharea smallint,
        sanitboro character varying(1),
        sanitdist character varying(2),
        sanitsub character varying(2),
        address character varying(28),
        zonedist1 character varying(9),
        zonedist2 character varying(9),
        zonedist3 character varying(9),
        zonedist4 character varying(9),
        overlay1 character varying(4),
        overlay2 character varying(4),
        spdist1 character varying(6),
        spdist2 character varying(6),
        ltdheight character varying(5),
        allzoning1 character varying(27),
        allzoning2 character varying(21),
        splitzone character varying(1),
        bldgclass character varying(2),
        landuse character varying(2),
        easements smallint,
        ownertype character varying(1),
        ownername character varying(21),
        lotarea integer,
        bldgarea integer,
        comarea integer,
        resarea integer,
        officearea integer,
        retailarea integer,
        garagearea integer,
        strgearea integer,
        factryarea integer,
        otherarea integer,
        areasource character varying(1),
        numbldgs integer,
        numfloors numeric,
        unitsres integer,
        unitstotal integer,
        lotfront numeric,
        lotdepth numeric,
        bldgfront numeric,
        bldgdepth numeric,
        ext character varying(2),
        proxcode character varying(1),
        irrlotcode character varying(1),
        lottype character varying(1),
        bsmtcode character varying(1),
        assessland numeric,
        assesstot numeric,
        exemptland numeric,
        exempttot numeric,
        yearbuilt smallint,
        builtcode character varying(1),
        yearalter1 smallint,
        yearalter2 smallint,
        histdist character varying(40),
        landmark character varying(35),
        builtfar numeric,
        residfar numeric,
        commfar numeric,
        facilfar numeric,
        borocode integer,
        bbl numeric,
        condono integer,
        tract2010 character varying(6),
        xcoord integer,
        ycoord integer,
        zonemap character varying(3),
        zmcode character varying(1),
        sanborn character varying(8),
        taxmap character varying(5),
        edesignum character varying(5),
        appbbl numeric,
        appdate character varying(10),
        plutomapid character varying(1),
        version character varying(4),
        mappluto_f smallint,
        shape_leng numeric,
        shape_area numeric,
        geom public.geometry(MultiPolygon,2263)
    );

    DROP SEQUENCE IF EXISTS raw.map_history_gid_seq;

    CREATE SEQUENCE raw.map_history_gid_seq
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        CACHE 1;

    ALTER TABLE ONLY raw.map_history ALTER COLUMN gid SET DEFAULT nextval('map_history_gid_seq'::regclass);
COMMIT;
