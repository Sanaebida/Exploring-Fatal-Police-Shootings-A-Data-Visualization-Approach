library(tidyverse)
library(vcd)
library(grid)

# Read the CSV file
file_path <- "C:\\Users\\hp\\Downloads\\fatal-police-shootings-data.csv"
fatal_shootings_data <- read.csv(file_path)

# Create a scatter plot for Race and Body Camera
ggplot(fatal_shootings_data, aes(x = race, y = body_camera, color = race)) +
  geom_point(position = position_jitter(width = 0.2), alpha = 0.7) +
  labs(title = "Scatter Plot of Race and Body Camera",
       x = "Race",
       y = "Body Camera",
       color = "Race") +
  scale_color_manual(values = c("W" = "red", "B" = "blue", "A" = "green", "H" = "orange", "N" = "purple")) +
  theme_minimal()