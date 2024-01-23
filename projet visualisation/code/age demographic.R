# Install and load necessary packages
install.packages("tidyverse")
library(tidyverse)

# Read the CSV file
file_path <- "C:\\Users\\hp\\Downloads\\fatal-police-shootings-data.csv"
fatal_shootings_data <- read.csv(file_path)

# Check the data structure
str(fatal_shootings_data)

# Create a line plot of age frequencies
age_frequency <- fatal_shootings_data %>%
  group_by(age) %>%
  summarize(count = n()) %>%
  arrange(age)

# Line plot of age frequencies
ggplot(age_frequency, aes(x = age, y = count, group = 1)) +
  geom_line(color = "blue") +
  geom_point(color = "blue", size = 3) +
  labs(title = "Frequency of Ages in Fatal Police Shootings",
       x = "Age",
       y = "Frequency") +
  theme_minimal()
