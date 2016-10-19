GRANT ALL PRIVILEGES ON DATABASE pluto to flyway;
GRANT ALL PRIVILEGES ON SCHEMA raw to flyway;

GRANT USAGE ON SCHEMA raw to flyway;
ALTER DEFAULT PRIVILEGES IN SCHEMA raw GRANT SELECT ON TABLES TO flyway;
GRANT CONNECT ON DATABASE pluto to flyway;

GRANT USAGE ON SCHEMA public to flyway;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA public TO flyway;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO flyway;


ALTER ROLE flyway WITH Superuser;
