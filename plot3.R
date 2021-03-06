###################### Download zip
zipurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile <- "power_consumption.zip"
if (!file.exists(zipfile)) {
        download.file(zipurl,
                      dest = zipfile,
                      meth = "curl");
        unzip(zipfile)
}

###################### Read downloaded file

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

###################### Plot

plot.png <- function(filename, fun) {
        png(filename = filename, width = 480, height = 480)
        fun()
        invisible(dev.off())
}

plot3 <- function() {
        with(ds, {
                plot(dtime, Sub_metering_1, type="n", ylab="", xlab="", main = "")
                lines(dtime, Sub_metering_1, col="black")
                lines(dtime, Sub_metering_2, col="red")
                lines(dtime, Sub_metering_3, col="blue")
                title(main="", ylab="Energy sub metering", xlab="")
                legend("topright",
                       lwd = 1,
                       col = c("black", "red", "blue"),
                       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        })
}

plot.png("plot3.png", plot3)
