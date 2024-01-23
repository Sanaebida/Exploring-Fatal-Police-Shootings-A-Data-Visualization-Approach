library(tidyverse)
library(vcd)

# Read the CSV file
file_path <- "C:\\Users\\hp\\Downloads\\fatal-police-shootings-data.csv"
fatal_shootings_data <- read.csv(file_path)

# Population data in millions
population_data <- data.frame(
  race = c("W", "B", "A", "H", "N"),
  population = c(251.6, 45.4, 20.95, 63.7, 4.38)
)

# Count the number of deaths per race
deaths_per_race <- fatal_shootings_data %>%
  group_by(race) %>%
  summarize(deaths = n())

# Merge with population data
combined_data <- merge(deaths_per_race, population_data, by = "race")

# Calculate deaths per million
combined_data$deaths_per_million <- (combined_data$deaths / combined_data$population)

# Arrange data by deaths per million (from largest to smallest)
combined_data <- combined_data[order(-combined_data$deaths_per_million), ]

# Create a bar plot with shades of blue and annotations
ggplot(combined_data, aes(x = reorder(race, -deaths_per_million), y = deaths_per_million, fill = deaths_per_million)) +
  geom_bar(stat = "identity", color = "black") +
  scale_fill_gradient(low = "lightblue", high = "darkblue") +
  geom_text(aes(label = sprintf("%.2f", deaths_per_million)), vjust = -0.5, size = 3) +
  labs(title = "Fatal Police Shootings per Million by Race",
       x = "Race",
       y = "Deaths per Million") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
