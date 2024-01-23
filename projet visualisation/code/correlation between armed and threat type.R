library(tidyverse)
library(vcd)
library(grid)

# Read the CSV file
file_path <- "C:\\Users\\hp\\Downloads\\fatal-police-shootings-data.csv"
fatal_shootings_data <- read.csv(file_path)

#visualisation
library(ggplot2)

# Order the data by observed frequency in descending order
result_df_sorted <- result_df[order(result_df$Observed_Frequency, decreasing = TRUE), ]

# Select the top 3 combinations
top_3_combinations <- head(result_df_sorted, 3)

# Define cooler colors
cool_colors <- c("#4e79a7", "#f28e2b", "#e15759")

# Create a bar plot with cooler colors, small labels, and slimmer bars
ggplot(top_3_combinations, aes(x = Armed_With, y = Observed_Frequency, fill = Threat_Type)) +
  geom_bar(stat = "identity", position = "dodge", width = 0.7) +  # Adjust the width
  scale_fill_manual(values = cool_colors) +  # Set cooler colors
  labs(title = "Top 3 correlations between Armed With and Threat Type",
       x = "Armed With",
       y = "Observed Frequency") +
  theme_minimal() +
  theme(axis.text.x = element_text(size = 8, angle = 45, hjust = 1))

# Create a contingency table
contingency_table <- table(fatal_shootings_data$armed_with, fatal_shootings_data$threat_type)

# Perform the chi-square test
chi_square_result <- chisq.test(contingency_table)

# Print the result
print(chi_square_result)

# Assuming you have already loaded the necessary packages and read the CSV file

# Create a contingency table
contingency_table <- table(fatal_shootings_data$armed_with, fatal_shootings_data$threat_type)

# Perform the chi-square test
chi_square_result <- chisq.test(contingency_table)

# Get observed and expected frequencies
observed_frequencies <- contingency_table
expected_frequencies <- chi_square_result$expected

# Calculate Pearson residuals
residuals <- (observed_frequencies - expected_frequencies) / sqrt(expected_frequencies)

# Combine the results into a data frame for better interpretation
result_df <- data.frame(
  Armed_With = rep(row.names(contingency_table), each = ncol(contingency_table)),
  Threat_Type = rep(colnames(contingency_table), times = nrow(contingency_table)),
  Observed_Frequency = as.vector(observed_frequencies),
  Expected_Frequency = as.vector(expected_frequencies),
  Pearson_Residual = as.vector(residuals)
)

# Display the result
print(result_df)
