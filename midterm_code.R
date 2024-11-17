setwd("C:/Users/keita/OneDrive - Emory University/Fall 2024/DATA 550/midterm project")

here::i_am("midterm_code.R")

wastewater_data <- read.csv("wastewater_2024-10-28.csv")

install.packages("pacman")
library(pacman)
p_load("dplyr")
p_load("ggplot2")
p_load("lubridate")

# Convert date_end to Date type
wastewater_data$date_end <- as.Date(wastewater_data$date_end)

#creating a new variable for seasons by the end date using months
season_data <- wastewater_data %>%
  mutate(season = case_when(
    month(date_end) %in% c(12, 1, 2) ~ "Winter",
    month(date_end) %in% c(3, 4, 5) ~ "Spring",
    month(date_end) %in% c(6, 7, 8) ~ "Summer",
    month(date_end) %in% c(9, 10, 11) ~ "Fall"
  ))

#Grouping data by seasons
seasonal_data <- season_data %>%
  group_by(season) %>%
  summarise(avg_detect_prop_15d = mean(detect_prop_15d, na.rm = TRUE))


# Plot for each season with consistent y-axis limits
ggplot(seasonal_data, aes(x = season, y = avg_detect_prop_15d)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  theme_minimal() +
  labs(title = "Average detect_prop_15d by Season",
       x = "Season",
       y = "Average detect_prop_15d") +
  ylim(0, 100)

