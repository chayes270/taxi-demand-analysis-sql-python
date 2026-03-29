# Taxi Demand Analysis Using SQL and Python

This project analyzes Chicago taxi trip data to identify competitor activity, neighborhood-level demand patterns, and the effect of weather on ride duration. Using **SQL** for data extraction and preparation and **Python** for exploratory analysis, visualization, and hypothesis testing, the project demonstrates an end-to-end analytics workflow in a transportation market context.

## Business Context

The analysis is framed around a market-entry scenario for **Zuber**, a fictional ride-sharing company evaluating expansion into Chicago. The project focuses on three main business questions:

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

The repository also includes exported CSV files used in the notebook:
- `moved_project_sql_result_01.csv` — taxi company ride counts
- `moved_project_sql_result_04.csv` — average drop-offs by neighborhood
- `moved_project_sql_result_07.csv` — Loop-to-O’Hare Saturday rides with weather conditions and trip duration

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
- identifying and removing duplicate records in the airport rides dataset
- identifying the **top 10 neighborhoods** by average drop-offs
- creating visualizations for taxi company ride counts
- creating visualizations for top neighborhoods by drop-offs
- drawing conclusions from the observed patterns

### Hypothesis Testing

The final stage of the project tested whether the **average duration of rides from the Loop to O’Hare changes on rainy Saturdays**. The dataset used for this test included:

- `start_ts`
- `weather_conditions`
- `duration_seconds`

An independent two-sample t-test was used to compare ride duration under rainy and non-rainy conditions.

## Visualizations

### Top 10 Taxi Companies by Ride Count
![Top 10 Taxi Companies by Ride Count](images/top_10_taxi_companies.png)

A small number of companies accounted for a large share of rides, with **Flash Cab** leading the market during the selected period.

### Top 10 Neighborhoods by Average Drop-offs
![Top 10 Neighborhoods by Average Drop-offs](images/top_10_taxi_neighborhoods.png)

Demand was concentrated in major commercial and high-traffic areas, especially the **Loop**, **River North**, **Streeterville**, and **West Loop**.

## Key Findings

- **Flash Cab** recorded the highest ride count with **19,558 rides** during November 15–16, 2017, followed by **Taxi Affiliation Services** with **11,422** and **Medallion Leasing** with **10,367**.
- Among companies with **"Yellow"** or **"Blue"** in their names during November 1–7, 2017, **Yellow Cab** led with **33,668 rides**, followed by **Taxi Affiliation Service Yellow** with **29,213**, **Blue Ribbon Taxi Association Inc.** with **17,675**, and **Blue Diamond** with **6,764**.
- In the grouped company comparison, **Other** accounted for **335,771 rides**, compared with **64,084** for **Flash Cab** and **37,583** for **Taxi Affiliation Services**, indicating that the broader market was fragmented even though a few firms stood out.
- The highest-demand neighborhoods by average drop-offs were **Loop (10,727.47)**, **River North (9,523.67)**, **Streeterville (6,664.67)**, and **West Loop (5,163.67)**. The average across all neighborhoods was about **4,324.99**, meaning the top four neighborhoods were well above the overall level.
- The airport rides dataset originally contained **1,068 rows**; after removing duplicates, **871 unique rides** remained for analysis.
- For Saturday rides from the **Loop** to **O’Hare**, the hypothesis test returned a **t-statistic of 5.428** and a **p-value of 7.40e-08**, indicating a statistically significant difference in trip duration between rainy and non-rainy conditions.

## Business Impact

This project demonstrates how SQL and Python can be used together to support transportation and operations analysis. The results suggest that:

- a small number of taxi companies accounted for a large share of rides
- demand was concentrated in a handful of key neighborhoods
- weather conditions were associated with meaningful differences in trip duration on the Loop-to-O’Hare route
- market-entry and driver-positioning decisions would benefit from focusing on high-demand commercial areas and external demand drivers such as weather

## Files

- `taxi-demand-analysis.ipynb` — main notebook containing analysis, visualizations, and hypothesis testing
- `taxi-demand-queries.sql` — SQL queries used to extract and prepare the data
- `data/` — exported datasets used in the notebook
- `images/` — charts used in the README
- `chicago-weather-records-nov-2017.pdf` — supporting weather reference file
- `README.md` — project overview and documentation

## Status

Completed.
