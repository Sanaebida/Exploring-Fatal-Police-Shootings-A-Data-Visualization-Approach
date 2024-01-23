library(ggplot2)

# Create age brackets
fatal_shootings_data$age_bracket <- cut(fatal_shootings_data$age, breaks = seq(0, 100, by = 10), include.lowest = TRUE, labels = FALSE)
fatal_shootings_data$age_bracket <- paste((fatal_shootings_data$age_bracket - 1) * 10, "-", fatal_shootings_data$age_bracket * 10, sep = "")


# Load necessary library
library(vcd)

# Create a mosaic plot
mosaicplot(contingency_table, color = c("skyblue", "lightcoral"), main = "Mental Illness by Age Bracket", shade = TRUE)



# Assuming 'fatal_shootings_data' has columns 'age' and 'was_mental_illness_related'

# Create age brackets
fatal_shootings_data$age_bracket <- cut(fatal_shootings_data$age, breaks = seq(0, 100, by = 10), labels = paste(seq(0, 90, by = 10), seq(10, 100, by = 10), sep = '-'), right = FALSE)

# Create a bar plot
library(ggplot2)

ggplot(fatal_shootings_data, aes(x = age_bracket, fill = was_mental_illness_related)) +
  geom_bar(position = "stack") +
  labs(title = "Mental Illness by Age Bracket", x = "Age Bracket", y = "Count") +
  theme_minimal()
