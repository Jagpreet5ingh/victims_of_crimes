#### Preamble ####
# Purpose : Clean the Raw victims_of_crimes data obtained from opentorontodata
# Author : Jagpreet Singh
# Date : 21 January, 2024
# Contact : jagpreetsingh.singh@mail.utoronto.ca
# License : MIT
# Prerequisite : install.packages("tidyverse") should be run if not pre-existing


#### Workspace Setup ####

library(tidyverse)

#### Clean data ####

data <-read.csv("input/data/unedited_data.csv")
data <-data |> select(REPORT_YEAR, SUBTYPE, SEX, AGE_GROUP, AGE_COHORT, COUNT_)

#### save data ####

write_csv(data,"output/data/edited_data.csv")
