 # 🚲 Cyclistic Bike-Share Analysis

## 📚 Project Overview

This repository contains the capstone project for the Google Data Analytics Certificate. The goal of the project is to analyze ride data from Cyclistic, a fictional bike-share company in Chicago, and provide actionable business recommendations to help convert casual riders into annual members.

---

## 🎯 Business Objective

Cyclistic’s marketing team wants to understand how annual members and casual riders use the service differently. The aim is to uncover actionable insights and recommend strategies to boost membership conversion and long-term revenue.

---

## 📦 Data Sources

- **Divvy Bike Share Trip Data:** Q1 2019 & Q1 2020  
- Includes: ride timestamps, user types (member/casual), and station names  
- [Divvy System Data](https://divvybikes.com/system-data)

---

## 🛠️ Tools & Technologies

- **R** (Data wrangling, analysis, visualization)
- **Tidyverse** (data cleaning & transformation)
- **lubridate** (date/time handling)
- **ggplot2** (visualizations)
- **RMarkdown** / **Slidy** (reporting & presentations)

---

## 🧹 Data Cleaning & Preparation

- Merged quarterly datasets with different structures
- Standardized column names and user types
- Removed unnecessary fields (e.g., coordinates, demographics)
- Calculated additional variables (ride length, weekday, etc.)
- Filtered out invalid and outlier data

---

## 📊 Analysis Highlights

- Distribution and statistics of ride durations for each user type
- Weekday vs. weekend riding trends for members and casuals
- Average ride duration by day and user type
- Visualizations illustrating usage patterns

---

## 🔑 Key Insights

- **Casual riders** ride longer and prefer weekends (leisure trips)
- **Members** ride more frequently on weekdays (commuting)
- Clear behavioral differences support targeted marketing

---

## ✅ Recommendations

1. **Targeted Promotions:** Launch weekend and leisure-focused campaigns for casuals.
2. **Seasonal Marketing:** Use summer peak periods for promotional pushes.
3. **Onboarding & Education:** Simplify navigation and trip planning for casuals to encourage conversion.

---

## 🚀 Getting Started

### Prerequisites

- R (>= 4.0)
- Required packages: `tidyverse`, `lubridate`, `ggplot2`, `readr`, `dplyr`, `knitr`, `rmarkdown`

### Running the Analysis

1. Clone the repository:
   ```bash
   git clone https://github.com/DavidAK431/Cyclistic-Bike-Share-Analysis.git
   cd Cyclistic-Bike-Share-Analysis
   ```
2. Download the Divvy data (see [Divvy System Data](https://divvybikes.com/system-data)) and place CSV files in the project folder.
3. Open `Cyclistic_Analysis.R` or `Cyclistic_bike_share_analysis.Rmd` in RStudio or your preferred IDE.
4. Run the scripts or knit the RMarkdown file for a full analysis and report.

---

## 📂 Project Structure

```
Cyclistic-Bike-Share-Analysis/
│
├── Cyclistic_Analysis.R               # Main R analysis script
├── Cyclistic_bike_share_analysis.Rmd  # RMarkdown report (HTML/Slides)
├── README.md                          # This file
├── /data                              # Data files (not included in repo)
└── /output                            # Generated charts and reports
```

---

## 📄 License

This project is for educational purposes as part of the Google Data Analytics Certificate.

---

## 🙋‍♂️ Contact

For questions, suggestions, or collaboration, please open an issue or contact [DavidAK431](https://github.com/DavidAK431).
