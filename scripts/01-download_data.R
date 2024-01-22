### Preamble ###
# Purpose : Downloads and saves the data from OpenDataToronto
# Author : Jagpreet Singh
# Date : 21 January 2024
# Contact : jagpreetsingh.singh@mail.utoronto.ca
# License : MIT
# Pre-requisites : N/A

### Workspace setup ###

library(opendatatoronto)
library(dplyr)

# get package
package <- show_package("police-annual-statistical-report-victims-of-crime")
package

# get all resources for this package
resources <- list_package_resources("police-annual-statistical-report-victims-of-crime")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()
data

# Save Data
write_csv(data,"input/data/unedited_data.csv")
