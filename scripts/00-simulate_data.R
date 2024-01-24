#### Preamble ####
# Purpose : Simulates the victims_of_crimes 2014-2022 data 
# Author : Jagpreet Singh
# Date : 21 January, 2024
# Contact : jagpreetsingh.singh@mail.utoronto.ca
# License : MIT
# Prerequisite : install.packages("tidyverse") should be run if this package is not pre-installed


#### Workspace Setup ####

library(tidyverse)

# Set seed for reproducibility
set.seed(123)

# Number of rows in the dataset
num_rows <- 1000

# Generate random values for each column
report_year <- sample(2014:2022, num_rows, replace = TRUE)
subtype <- sample(c("sexual assault", "robbery", "other", "assault"), num_rows, replace = TRUE)
sex <- sample(c("M", "F", "U"), num_rows, replace = TRUE, prob = c(0.45, 0.45, 0.10))
age_group <- sample(c("Adult", "Child", "Youth", "Unknown"), num_rows, replace = TRUE, prob = c(0.40, 0.20, 0.20, 0.10))

# Function to generate age_cohort based on age_group
generate_age_cohort <- function(age_group) {
  if (age_group == "Child") {
    return("<12")
  } else if (age_group == "Youth") {
    return("12-17")
  } else if (age_group == "Adult") {
    return(sample(c("18-24", "25-34", "35-44", "45-54", "65+"), 1))
  } else {
    return("Unknown")
  }
}

# Apply the function to generate age_cohort
age_cohort <- sapply(age_group, generate_age_cohort)

# Generate random values for COUNT column with 20% probability of value > 300
count <- ifelse(runif(num_rows) < 0.2, sample(301:2500, sum(runif(num_rows) < 0.2), replace = TRUE), sample(1:300, num_rows, replace = TRUE))

# Create the data frame
simulated_data <- data.frame(
  REPORT_YEAR = report_year,
  SUBTYPE = subtype,
  SEX = sex,
  AGE_GROUP = age_group,
  AGE_COHORT = age_cohort,
  COUNT_ = count
)

# Save the simulated data to a CSV file
write.csv(simulated_data, file = "output/data/simulated_data.csv", row.names = FALSE)

# Display the first few rows of the simulated dataset
head(simulated_data)

