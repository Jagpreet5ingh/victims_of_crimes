### Preamble ###
# Purpose : Test the simulated data to ensure it meets the requirements
# Author : Jagpreet Singh
# Date : 21 January 2024
# Contact : jagpreetsingh.singh@mail.utoronto.ca
# License : MIT
# Pre-requisites : N/A

# workspace setup #
library(tidyverse)

#tests
data = read_csv("output/data/simulated_data.csv")

#test 1 : Report_Year is within the range
all(data$REPORT_YEAR >= 2014 & data$REPORT_YEAR<=2022)

#test 2 : Subtype is either "sexual assualt", "assault", "other" or "robbery"
all(data$SUBTYPE %in% c("sexual assault", "robbery", "other", "assault") )

#test 3 : Sex is either "M", "F", or "U"
all(data$SEX %in% c( "M", "F","U"))

#test 4 : Age group is either "Adult", "Child", "Youth", "Unknown"
all(data$AGE_GROUP %in% c("Adult", "Child", "Youth", "Unknown"))

