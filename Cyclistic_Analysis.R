# =====================================================
# Cyclistic Bike Share Analysis Script
# Author: David AK
# Date: [Update with date when uploading]
# =====================================================

# =========================
# Load required libraries
# =========================
library(tidyverse)
library(dplyr)
library(lubridate)

# =========================
# BUSINESS TASK
# =========================
# The Cyclistic marketing team wants to better understand how annual members
# and casual riders use the bike-sharing service differently.
# Goal: Identify behavioral trends and usage patterns to convert more
# casual riders into annual members, increasing retention and revenue.

# =========================
# DATA SOURCES
# =========================
# Load Divvy datasets
q1_2019 <- read_csv("Divvy_Trips_2019_Q1.csv")
q1_2020 <- read_csv("Divvy_Trips_2020_Q1.csv")

# =========================
# DATA CLEANING & MANIPULATION
# =========================

# Rename columns in q1_2019 to match q1_2020
q1_2019 <- rename(q1_2019,
                  ride_id = trip_id,
                  rideable_type = bikeid,
                  started_at = start_time,
                  ended_at = end_time,
                  start_station_name = from_station_name,
                  start_station_id = from_station_id,
                  end_station_name = to_station_name,
                  end_station_id = to_station_id,
                  member_casual = usertype
)

# Convert ride_id and rideable_type to character for stacking
q1_2019 <- mutate(q1_2019,
                  ride_id = as.character(ride_id),
                  rideable_type = as.character(rideable_type)
)

# Stack datasets
all_trips <- bind_rows(q1_2019, q1_2020)

# Remove unwanted columns
all_trips <- all_trips %>% 
  select(-any_of(c("start_lat", "start_lng", "end_lat", "end_lng", "birthyear", "gender", "tripduration")))

# Standardize member_casual values
all_trips <- all_trips %>% 
  mutate(member_casual = recode(member_casual,
                                "Subscriber" = "member",
                                "Customer" = "casual"))

# Add date components
all_trips <- all_trips %>%
  mutate(
    date = as.Date(started_at),
    month = format(date, "%m"),
    day = format(date, "%d"),
    year = format(date, "%Y"),
    day_of_week = format(date, "%A")
  )

# Calculate ride_length in seconds
all_trips <- all_trips %>%
  mutate(ride_length = as.numeric(difftime(ended_at, started_at)))

# Remove bad data: negative ride lengths and HQ QR station
all_trips_v2 <- all_trips %>%
  filter(ride_length >= 0, start_station_name != "HQ QR")

# =========================
# ANALYSIS
# =========================

# Descriptive statistics
summary(all_trips_v2$ride_length)

# Compare user types
user_type_summary <- all_trips_v2 %>%
  group_by(member_casual) %>%
  summarise(
    mean_ride_length = mean(ride_length),
    median_ride_length = median(ride_length),
    max_ride_length = max(ride_length),
    min_ride_length = min(ride_length)
  )
print(user_type_summary)

# Average ride time by weekday
avg_ride_weekday <- aggregate(
  all_trips_v2$ride_length ~ all_trips_v2$member_casual + all_trips_v2$day_of_week, 
  FUN = mean
)
print(avg_ride_weekday)

# Grouped summary by weekday
weekday_summary <- all_trips_v2 %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>%
  group_by(member_casual, weekday) %>%
  summarise(
    number_of_rides = n(),
    average_duration = mean(ride_length)
  ) %>%
  arrange(member_casual, weekday)
print(weekday_summary)

# =========================
# VISUALIZATIONS
# =========================

# Plot: Number of rides by weekday
all_trips_v2 %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>% 
  group_by(member_casual, weekday) %>% 
  summarise(number_of_rides = n(), .groups = "drop") %>% 
  ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) +
  geom_col(position = position_dodge(width = 0.8), width = 0.7) +
  geom_text(aes(label = scales::comma(number_of_rides)),
            position = position_dodge(width = 0.8),
            vjust = -0.4, size = 3.5, color = "black") +
  scale_fill_manual(values = c("member" = "#1f78b4", "casual" = "#33a02c")) +
  labs(
    title = "Ride Frequency by Weekday",
    subtitle = "Members ride more on weekdays; casuals peak on weekends",
    x = "Day of the Week",
    y = "Total Rides",
    fill = "User Type"
  ) +
  theme_minimal()

# Plot: Average ride duration by weekday
all_trips_v2 %>% 
  mutate(weekday = wday(started_at, label = TRUE, week_start = 1)) %>%
  group_by(member_casual, weekday) %>% 
  summarise(average_duration = mean(ride_length), .groups = "drop") %>% 
  ggplot(aes(x = weekday, y = average_duration, fill = member_casual)) +
  geom_col(position = "dodge", width = 0.7, alpha = 0.9) +
  geom_text(aes(label = round(average_duration, 1)), 
            position = position_dodge(width = 0.9), 
            vjust = -0.5, size = 3.5) +
  scale_fill_manual(values = c("member" = "#1f78b4", "casual" = "#33a02c")) +
  labs(
    title = "Average Ride Duration by Weekday",
    subtitle = "Casual riders take longer rides, especially on weekends",
    x = "Day of the Week",
    y = "Average Duration (seconds)",
    fill = "User Type"
  ) +
  theme_minimal()

# =========================
# END OF SCRIPT
# =========================

