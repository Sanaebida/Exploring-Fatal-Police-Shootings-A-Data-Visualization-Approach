library(tidyverse)
library(vcd)
library(grid)

# Read the CSV file
file_path <- "C:\\Users\\hp\\Downloads\\fatal-police-shootings-data.csv"
fatal_shootings_data <- read.csv(file_path)


# Create numerical encoding for the "Race" variable
race_encoding <- c("W" = 1, "B" = 2, "A" = 3, "H" = 4, "N" = 5)
fatal_shootings_data$race_numeric <- race_encoding[fatal_shootings_data$race]

# Create a scatter plot
ggplot(fatal_shootings_data, aes(x = age, y = race_numeric, color = race)) +
  geom_point(alpha = 0.5) +
  labs(title = "Scatter Plot of Age and Race",
       x = "Age",
       y = "Race (Numerical Encoding)",
       color = "Race") +
  scale_color_manual(values = c("W" = "red", "B" = "blue", "A" = "green", "H" = "orange", "N" = "purple")) +
  theme_minimal()

# Assuming you have already loaded the necessary packages and read the CSV file

# Create numerical encoding for the "Race" variable
race_encoding <- c("W" = 1, "B" = 2, "A" = 3, "H" = 4, "N" = 5)
fatal_shootings_data$race_numeric <- race_encoding[fatal_shootings_data$race]

# Perform Spearman's rank correlation test
correlation_result <- cor.test(fatal_shootings_data$age, fatal_shootings_data$race_numeric, method = "spearman")

# Print correlation result
print(correlation_result)

