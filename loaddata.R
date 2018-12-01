## Assignemnt 1

zipurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile <- "power_consumption.zip"
if (!file.exists(zipfile)) {
        download.file(zipurl,
                      dest = zipfile,
                      meth = "curl");
        unzip(zipfile)
}

# When loading the dataset into R, please consider the following:
#         
# The dataset has 2,075,259 rows and 9 columns.
# 
# First calculate a rough estimate of how much memory the dataset will require
# in memory before reading into R. Make sure your computer has enough memory
# (most modern computers should be fine).
# 
# We will only be using data from the dates 2007-02-01 and 2007-02-02.

library(readr)
library(dplyr)
library(lubridate)

dataset <- read_delim(file = "household_power_consumption.txt",
                      col_names = TRUE,
                      delim = ";")

ds <- mutate(dataset, Date=dmy(Date)) %>%
        filter(as.Date("2007-02-01") <= Date & Date <= as.Date("2007-02-02")) %>%
        mutate(dtime=as.POSIXct(ymd(Date) + hms(Time)))

rm(list = c("dataset"))

