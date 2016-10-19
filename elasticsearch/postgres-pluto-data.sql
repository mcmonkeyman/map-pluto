select
    gid, borough, block, lot, version, mappluto_f, shape_leng,
    round(ST_Y(ST_Centroid(ST_TRANSFORM(geom,4326)))::numeric,8) as "location.lat",
    round(ST_X(ST_Centroid(ST_TRANSFORM(geom,4326)))::numeric,8) as "location.lon",
    ST_AsGeoJSON(ST_Centroid(ST_TRANSFORM(geom,4326)))::json as geo_json_centroid,
    ST_AsGeoJSON(ST_TRANSFORM(geom,4326))::json as geo_json_shape
from raw.map
-- limit 100
