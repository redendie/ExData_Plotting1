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

plot2 <- function() {
        with(ds, {
                plot(ds$dtime,
                     ds$Global_active_power,
                     col="black",
                     main="",
                     xlab = "",
                     ylab = "Global Active Power (kilowatts)",
                     type="l"
                )
        })
}

par(mfrow=c(1,1))
#plot2()
plot.png("plot2.png", plot2)




