# 🚲 Cyclistic Bike-Share Analysis Project

## 📌 Project Overview

This project is part of the **Google Data Analytics Capstone** and was conducted to help **Cyclistic**, a fictional bike-share company in Chicago, understand how **annual members** and **casual riders** use their service differently. The goal was to provide **data-driven marketing recommendations** to convert more casual riders into paying members and boost long-term revenue.

---

## 🎯 Business Task

Cyclistic’s marketing team needs actionable insights on user behavior differences to develop a strategy that encourages **casual riders to become annual members**.

---

## 🧩 Dataset

- 📁 Divvy Bike Share trip data from **Q1 2019 and Q1 2020**
- Data includes trip timestamps, user types (member or casual), and station names
- Source: [Divvy](https://divvybikes.com/system-data) 


---

## 🔧 Tools Used

- **R Programming Language**
- **Tidyverse** for data cleaning & transformation
- **Lubridate** for date manipulation
- **ggplot2** for visualizations
- **R Markdown** & **Slidy Presentation** for reporting

---

## 🧹 Data Cleaning & Preparation

- Merged two datasets from different schema structures (2019 and 2020)
- Renamed columns for consistency
- Removed unnecessary fields (e.g., latitude, gender, tripduration)
- Standardized user type values (`Subscriber` → `member`, `Customer` → `casual`)
- Added new variables (ride length, weekday, month, etc.)
- Removed invalid data (e.g., ride duration < 0, HQ QR trips)

---

## 📊 Key Analysis Performed

- Descriptive statistics of ride durations
- Comparison of mean/median ride lengths between members and casuals
- Average ride duration by weekday and user type
- Number of rides by weekday and user type

---

## 📈 Visualizations

- **Ride Frequency by Weekday**  
  Casual riders show a spike on weekends; members dominate weekdays.

- **Average Ride Duration by Weekday**  
  Casual riders take significantly longer trips, especially on weekends.

Each chart is annotated and styled for stakeholder clarity.

---

## 💡 Key Insights

- **Casual riders** prefer weekends and take longer, leisure-focused trips.
- **Members** ride more during weekdays, likely for commuting.
- These patterns indicate fundamentally different use cases.

---

## ✅ Recommendations

1. **🎯 Targeted Promotions:** Offer weekend passes and scenic ride campaigns to convert casuals.
2. **📅 Seasonal Campaigns:** Leverage high casual ridership in summer months for promotions.
3. **🧭 Onboarding & Education:** Help casual riders navigate and plan better trips, increasing comfort and conversions.

---

## Cyclistic_bike_share_analysis.html#
