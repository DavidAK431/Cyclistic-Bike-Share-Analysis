# Cyclistic Bike-Share Analysis 🚲

This project analyzes usage patterns of the Divvy bike-share service in Chicago to help inform business strategy and user engagement.

## 📌 Business Task
Identify differences in riding behavior between casual and annual members to support targeted marketing strategies.

## 📁 Data Sources
- Divvy Q1 2019: `Divvy_Trips_2019_Q1.csv`
- Divvy Q1 2020: `Divvy_Trips_2020_Q1.csv`

## 🧹 Data Cleaning
- Column renaming and formatting
- Removing nulls, irrelevant columns, and negative ride durations
- Merged both quarters using consistent schema

## 📊 Analysis Highlights
- Casual riders peak on weekends
- Members ride more consistently on weekdays
- Casual users have longer average ride times

## 📈 Visuals
See charts in `cyclistic_report.Rmd` or the HTML output.

## 🧠 Recommendations
1. Launch weekend promos for casual users
2. Offer commuter perks for members
3. Develop seasonal campaigns in warmer months

---
Made with 💻 R, `tidyverse`, `lubridate`, and `ggplot2`
