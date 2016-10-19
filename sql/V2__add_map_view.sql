BEGIN;
    CREATE or REPLACE VIEW raw.map AS
    SELECT
        gid,
        borough,
        block,
        lot,
        version,
        mappluto_f,
        shape_leng,
        shape_area,
        geom
    FROM raw.map_history mh
    WHERE version = (
        SELECT MAX(version) FROM raw.map_history
    );
COMMIT;
