# Install and load necessary packages
install.packages(c("tidyverse", "vcd"))
library(tidyverse)
install.packages("vcd")
library(vcd)

# Read the CSV file
file_path <- "C:\\Users\\hp\\Downloads\\fatal-police-shootings-data.csv"
fatal_shootings_data <- read.csv(file_path)

# Create a contingency table
contingency_table <- table(fatal_shootings_data$body_camera, fatal_shootings_data$race)

# Display the contingency table
print(contingency_table)

# Perform a Chi-square test of independence
chi_square_result <- chisq.test(contingency_table)
print(chi_square_result)

#visualisation

# Create mosaic plot with standardized residuals
mosaicplot(contingency_table, main = "Mosaic Plot: Body Camera vs. Race", shade = TRUE)
assocstats(contingency_table)

# If you prefer a ggplot version
ggplot(as.data.frame(contingency_table), aes(x = Var2, y = Freq, fill = Var1)) +
  geom_bar(stat = "identity") +
  labs(title = "Bar Plot: Body Camera vs. Race", x = "Race", y = "Count") +
  theme_minimal()