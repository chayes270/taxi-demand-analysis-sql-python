/* This project wil be using SQL and Python to perform Exploratory Data Analysis and Hypothesis testing
to find patterns in data from a ride-share company and analyze how the weather affects rideshares
 */



 /*Find the number of taxi rides for each taxi company for November 15-16, 2017 */
SELECT 
    cabs.company_name as company_name,
    COUNT(trips.trip_id) as trips_amount
FROM 
    trips
JOIN cabs on cabs.cab_id = trips.cab_id
WHERE 
    trips.start_ts >= '2017-11-15 00:00:00' AND trips.start_ts < '2017-11-17 00:00:00'
GROUP BY 
    company_name
ORDER BY 
    trips_amount desc;

/*
REULT OF QUERY:
company_name                    trips_amount
Flash Cab	                        19558
Taxi Affiliation Services	        11422
Medallion Leasin	                10367
Yellow Cab	                        9888
Taxi Affiliation Service Yellow	    9299
Chicago Carriage Cab Corp	        9181
City Service	                    8448
Sun Taxi	                        7701
Star North Management LLC	        7455
Blue Ribbon Taxi Association Inc.	5953
....                                .... */

/* --------------------------------------------------------------------------------------------------------------------------------------------------------------*/


/*Find the number of rides for every taxi company whose name contains the words "Yellow" or "Blue" for November 1-7, 2017 */
SELECT 
    cabs.company_name as company_name,
    COUNT(trips.trip_id) as trips_amount
FROM 
    trips
JOIN cabs on cabs.cab_id = trips.cab_id
WHERE 
    trips.start_ts >= '2017-11-01 00:00:00' AND trips.start_ts < '2017-11-08 00:00:00' AND (cabs.company_name LIKE '%Yellow%' OR cabs.company_name LIKE '%Blue%')
GROUP BY 
    company_name

/*REULT OF QUERY:
company_name	                trips_amount
Blue Diamond	                    6764
Blue Ribbon Taxi Association Inc.	17675
Taxi Affiliation Service Yellow	    29213
Yellow Cab	                        33668 */

/* --------------------------------------------------------------------------------------------------------------------------------------------------------------*/


/*For November 1-7, 2017, the most popular taxi companies were Flash Cab and Taxi Affiliation Services. Find the number of rides for these two companies and 
name the resulting variable trips_amount. Join the rides for all other companies */
SELECT
    CASE
    WHEN company_name = 'Flash Cab' THEN 'Flash Cab'
    WHEN company_name = 'Taxi Affiliation Services' THEN 'Taxi Affiliation Services'
    ELSE 'Other'
    END as company,
    COUNT(trip_id) as trips_amount
FROM 
    trips
JOIN cabs ON trips.cab_id = cabs.cab_id
WHERE 
    trips.start_ts >= '2017-11-01 00:00:00' AND trips.start_ts < '2017-11-08 00:00:00'
GROUP BY 
    CASE
    WHEN company_name = 'Flash Cab' THEN 'Flash Cab'
    WHEN company_name = 'Taxi Affiliation Services' THEN 'Taxi Affiliation Services'
    ELSE 'Other'
    END
ORDER BY 
    trips_amount DESC;

/*RESULTS OF QUERY:
company	                trips_amount
Other	                    335771
Flash Cab	                64084
Taxi Affiliation Services	37583 */

/* --------------------------------------------------------------------------------------------------------------------------------------------------------------*/


/*Retrieve the identifiers of the O'Hare and Loop neighborhoods from the neighborhoods table */
SELECT
    neighborhood_id,
    name
FROM 
    neighborhoods
WHERE 
    name LIKE '%Hare' OR name LIKE 'Loop'
    
/*RESULTS OF QUERY:
neighborhood_id	name
50	            Loop
63	            O'Hare
 */


/* --------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/*For each hour, retrieve the weather condition records */
SELECT 
    ts, 
    CASE 
    WHEN description LIKE '%rain%' OR description LIKE '%storm%' THEN 'Bad'
    ELSE 'Good'
    END as weather_conditions
FROM 
    weather_records

/*RESULTS OF QUERY: 
ts	               weather_conditions
2017-11-01 00:00:00	    Good
2017-11-01 01:00:00	    Good
2017-11-01 02:00:00	    Good
2017-11-01 03:00:00	    Good
2017-11-01 04:00:00	    Good
2017-11-01 05:00:00	    Good
2017-11-01 06:00:00	    Good
2017-11-01 07:00:00	    Good
2017-11-01 08:00:00	    Good
2017-11-01 09:00:00	    Good
2017-11-01 10:00:00	    Good
2017-11-01 11:00:00	    Good
2017-11-01 12:00:00	    Good
....                    ....
2017-11-02 03:00:00	    Bad
2017-11-02 04:00:00	    Bad
2017-11-02 05:00:00	    Bad
....                    ....*/


/* --------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* Retrieve from the trips table all the rides that started in the Loop (pickup_location_id: 50) on a Saturday and ended at O'Hare (dropoff_location_id: 63). Get the weather conditions for each ride
and retriece the duration for each ride */
SELECT 
    trips.start_ts as start_ts,
    CASE 
    WHEN weather_records.description LIKE '%rain%' OR weather_records.description LIKE '%storm%' THEN 'Bad'
    ELSE 'Good'
    END as weather_conditions,
    trips.duration_seconds as duration_seconds
FROM 
    trips
JOIN weather_records ON weather_records.ts = trips.start_ts
WHERE 
    trips.pickup_location_id = 50 AND trips.dropoff_location_id = 63 AND EXTRACT (DOW from trips.start_ts) = 6 
ORDER BY 
    trips.trip_id 

/*RESULTS OF QUERY:
start_ts	        weather_conditions	duration_seconds
2017-11-25 12:00:00	        Good	        1380
2017-11-25 16:00:00	        Good	        2410
2017-11-25 14:00:00	        Good	        1920
2017-11-25 12:00:00	        Good	        1543
2017-11-04 10:00:00     	Good	        2512
2017-11-11 07:00:00	        Good	        1440
2017-11-11 04:00:00	        Good	        1320
2017-11-04 16:00:00	        Bad	            2969
2017-11-18 11:00:00     	Good	        2280
2017-11-04 16:00:00     	Bad	            3120
2017-11-11 15:00:00	        Good	        4800
2017-11-04 05:00:00	        Good	        1260
2017-11-11 06:00:00	        Good	        1346
2017-11-04 04:00:00	        Good	        1333 
....                        ....            ....*/