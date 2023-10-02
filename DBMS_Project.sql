#Highest Renewable Energy Usage
SELECT
    country,
    renewable
FROM
    country_data
ORDER BY
    renewable DESC
LIMIT 1;


#Countries with zero renewable energy usage
SELECT
    country,
    renewable
FROM
    country_data
WHERE 
	Renewable=0;
    
    
#This query calculates the average percentage of electricity produced by each energy source across all countries.

SELECT
    AVG(coal) AS avg_coal,
    AVG(gas) AS avg_gas,
    AVG(oil) AS avg_oil,
    AVG(hydro) AS avg_hydro,
    AVG(renewable) AS avg_renewable,
    AVG(nuclear) AS avg_nuclear
FROM
    country_data;
    
    
#This query identifies the countries with the highest percentage of electricity production from nuclear power.

SELECT
    country,
    nuclear
FROM
    country_data
ORDER BY
    nuclear DESC
LIMIT 1;


#This query finds countries that have a balanced mix of different energy sources (e.g., not relying heavily on a single source).

SELECT
    *
FROM
    country_data
WHERE
    coal < 50
    AND gas < 50
    AND oil < 50
    AND hydro < 50
    AND renewable < 50
    AND nuclear < 50;
    

#This query identifies countries where oil is a dominant source, but renewable energy usage is relatively low.

SELECT
    country,
    oil,
    renewable
FROM
    country_data
WHERE
    oil > 50
    AND renewable < 10;
    
    
#This query identifies the countries where both oil and gas are significant sources of electricity production.

SELECT
    country,
    oil,
    gas
FROM
	country_data
WHERE
    oil > 30
    AND gas > 30;
    
    
#This query identifies 15 countries with the highest combined percentage of electricity production from fossil fuels.

SELECT
    country,
    (coal + gas + oil) AS combined_fossil_fuels
FROM
    country_data
ORDER BY
    combined_fossil_fuels DESC
LIMIT 15;


#This query identifies countries where both hydro power and other renewable sources have a significant share of electricity production.

SELECT
    country,
    hydro,
    renewable
FROM
    country_data
WHERE
    hydro > 30
    AND renewable > 30;
    

#This query finds countries where one source (coal, gas, oil, hydro, or renewable) dominates electricity production, excluding nuclear power.

SELECT
    *
FROM
    country_data
WHERE
    GREATEST(coal, gas, oil, hydro, renewable) > 70
    AND nuclear < 10;
    
