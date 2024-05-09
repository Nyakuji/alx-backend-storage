-- SQL script that lists all bands with 'Glam rock' in their main style, ranked by their longevity
-- Column names must be: band_name, lifespan
-- (in years until until 2022 - please use 2022 instead of YEAR(CURDATE())))
-- The script can be executed on any database

SELECT band_name, (IFNULL(split, '2022') - formed) AS lifespan
FROM metal_bands
WHERE FIND_IN_SET('Glam rock', IFNULL(style, '')) > 0
ORDER BY lifespan DESC;
