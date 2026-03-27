# Taxi Demand Analysis Using SQL and Python

This project analyzes Chicago taxi trip data for **Zuber**, a fictional ride-sharing company preparing to enter the Chicago market. Using **SQL** for data extraction and preparation and **Python** for exploratory analysis, visualization, and hypothesis testing, the project evaluates competitor ride volume, neighborhood-level demand, and the effect of weather on trip duration.

## Business Context

Zuber is evaluating expansion into Chicago and needs data-driven insight into the local transportation market. This project focuses on three main questions:

1. Which taxi companies handled the most rides during selected periods in November 2017?
2. Which Chicago neighborhoods had the highest average number of drop-offs?
3. Did rainy weather affect trip duration for rides from the **Loop** to **O’Hare International Airport** on Saturdays?

## Dataset

The analysis uses four relational tables:

- **cabs** — taxi company information
- **trips** — trip-level ride data
- **neighborhoods** — neighborhood identifiers and names
- **weather_records** — hourly weather observations

Weather conditions were connected to trips by matching trip start timestamps with weather record timestamps.

## Tools and Technologies

- **SQL (PostgreSQL)**
- **Python**
- **Pandas**
- **Matplotlib**
- **Seaborn**
- **SciPy**
- **Jupyter Notebook**

## Files

- `taxi-demand-analysis.ipynb` — main notebook containing analysis, visualizations, and hypothesis testing
- `taxi-demand-queries.sql` — SQL queries used to extract and prepare the data
- `chicago-weather-records-nov-2017.pdf` — supporting weather reference file
- `README.md` — project overview and documentation

## Key Analysis Areas

- competitor ride volume by taxi company
- top neighborhoods by average drop-offs
- weather classification for Saturday rides
- hypothesis testing on Loop-to-O’Hare trip duration under different weather conditions

## Results

This project demonstrates an end-to-end analytics workflow combining SQL and Python to answer business questions using transportation data. It highlights experience with relational querying, exploratory analysis, visualization, and statistical testing.

## Status

Completed.
