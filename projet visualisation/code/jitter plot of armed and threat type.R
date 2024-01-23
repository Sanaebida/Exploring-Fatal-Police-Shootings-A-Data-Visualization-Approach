library(ggplot2)
library(tidyverse)
library(vcd)
library(grid)

# Read the CSV file
file_path <- "C:\\Users\\hp\\Downloads\\fatal-police-shootings-data.csv"
fatal_shootings_data <- read.csv(file_path)

# Create a jitter plot for Armed With and Threat Type
ggplot(fatal_shootings_data, aes(x = armed_with, y = threat_type)) +
  geom_jitter(position = position_jitter(width = 0.3, height = 0.2), alpha = 0.5) +
  labs(title = "Jitter Plot of Armed With and Threat Type",
       x = "Armed With",
       y = "Threat Type") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
