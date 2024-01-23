# Install and load necessary packages
install.packages("tidyverse")
library(tidyverse)

# Read the CSV file
file_path <- "C:\\Users\\hp\\Downloads\\fatal-police-shootings-data.csv"
fatal_shootings_data <- read.csv(file_path)

# Extract the year from the "date" column
fatal_shootings_data$year <- as.integer(format(as.Date(fatal_shootings_data$date), "%Y"))

# Create a line graph of the number of shootings per year
shootings_per_year <- fatal_shootings_data %>%
  group_by(year) %>%
  summarize(count = n())

# Load ggplot2
library(ggplot2)

# Plotting
ggplot(shootings_per_year, aes(x = factor(year), y = count, group = 1)) +
  geom_line(color = "blue") +
  geom_point(color = "blue", size = 3) +
  labs(title = "Number of Police Shootings per Year",
       x = "Year",
       y = "Number of Shootings") +
  theme_minimal()

