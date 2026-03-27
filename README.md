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

Relevant trip fields include ride start time, end time, duration, distance, pickup location, and drop-off location. Weather conditions were connected to trips by matching trip start timestamps with weather record timestamps.

## Tools and Technologies

- **SQL (PostgreSQL)**
- **Python**
- **Pandas**
- **Matplotlib**
- **Seaborn**
- **SciPy**
- **Jupyter Notebook**

## Methodology

### SQL Analysis

The SQL portion of the project was used to answer several market and operational questions:

- count the number of taxi rides for each company on **November 15–16, 2017**
- count rides for companies whose names contain **"Yellow"** or **"Blue"** on **November 1–7, 2017**
- group **Flash Cab**, **Taxi Affiliation Services**, and all remaining companies into broader comparison categories
- retrieve the neighborhood identifiers for the **Loop** and **O’Hare**
- classify hourly weather conditions as **Good** or **Bad** using a `CASE` statement
- join weather data to Saturday rides from the **Loop** to **O’Hare** and retrieve trip duration for hypothesis testing

### Python Analysis

The Python portion of the project focused on:

- importing and reviewing the extracted datasets
- checking data structure and data types
- identifying the **top 10 neighborhoods** by average drop-offs
- creating visualizations for taxi company ride counts
- creating visualizations for top neighborhoods by drop-offs
- drawing conclusions from the observed patterns

### Hypothesis Testing

The final stage of the project tested whether the **average duration of rides from the Loop to O’Hare changes on rainy Saturdays**. The dataset used for this test included:

- `start_ts`
- `weather_conditions`
- `duration_seconds`

## Files

- `taxi-demand-analysis.ipynb` — main notebook containing analysis, visualizations, and hypothesis testing
- `taxi-demand-queries.sql` — SQL queries used to extract and prepare the data
- `chicago-weather-records-nov-2017.pdf` — supporting weather reference file
- `README.md` — project overview and documentation

## Key Analysis Areas

- competitor ride volume by taxi company
- top neighborhoods by average drop-offs
- weather classification for ride records
- hypothesis testing on Loop-to-O’Hare trip duration under different weather conditions

## Results

This project demonstrates an end-to-end analytics workflow combining SQL and Python to answer business questions using transportation data. It highlights experience with relational querying, exploratory analysis, visualization, and statistical testing in a business-focused setting.

## Status

Completed.
