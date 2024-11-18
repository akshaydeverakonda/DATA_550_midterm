here::i_am("Code/01_make_plot.R")
path_to_data <- here::here("Raw_Data", "wastewater_2024-10-28_subset.csv")
wastewater_data <- read.csv(path_to_data, header = TRUE)

library(dplyr)

# Group by population_served and calculate the average detect_prop_15d
avg_detect_prop_by_population <- wastewater_data %>%
  group_by(population_served) %>%
  summarise(avg_detect_prop_15d = mean(detect_prop_15d, na.rm = TRUE))

# Create a scatterplot using ggplot2
p <-ggplot(avg_detect_prop_by_population, aes(x = population_served, y = avg_detect_prop_15d)) +
  geom_point(alpha = 0.6) +
  ggtitle("Correlation between Population Size and Average SARS-CoV-2 Detection Proportion") +
  xlab("Population Served") +
  ylab("Average Proportion of Tests with SARS-CoV-2 Detected") +
  theme_minimal()

# Save the plot as a PNG
output_path <- here::here("Output", "plot.png")
ggsave(output_path, plot = p, width = 8, height = 5)