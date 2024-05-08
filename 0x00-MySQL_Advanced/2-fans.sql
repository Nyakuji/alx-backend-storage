-- SQL script that ranks country origins of bands, ordered by the number of (non-unique) fans.
-- Import this table dump to your database:
-- Column names must be: origin, nb_fans
-- The script can be executed on any database

SELECT origin, COUNT(*) AS nb_fans
FROM metal_bands
GROUP BY origin
ORDER BY nb_fans DESC;
