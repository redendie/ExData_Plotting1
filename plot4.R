if (! ("ds" %in% ls())) source("loaddata.R") ## `ds` is now available

plot.png <- function(filename, fun, mfr=c(1,1)) {
        png(filename = filename, width = 480, height = 480)
        par(mfrow=mfr)
        fun()
        invisible(dev.off())
}

plot4 <- function() {
        ## Plot Top Left
        with(ds, {
                plot(ds$dtime,
                     ds$Global_active_power,
                     col="black",
                     main="",
                     xlab = "",
                     ylab = "Global Active Power",
                     type="l"
                )
        })
        ## Plot Top Right
        with(ds, {
                plot(ds$dtime,
                     ds$Voltage,
                     col="black",
                     main="",
                     xlab = "datetime",
                     ylab = "Voltage",
                     type="l"
                )
        })
        ## Plot Bottom Left
        with(ds, {
                plot(dtime, Sub_metering_1, type="n", ylab="", xlab="", main = "")
                lines(dtime, Sub_metering_1, col="black")
                lines(dtime, Sub_metering_2, col="red")
                lines(dtime, Sub_metering_3, col="blue")
                title(main="", ylab="Energy sub metering", xlab="")
                legend("topright",
                       bty = "n",
                       lwd = 1,
                       col = c("black", "red", "blue"),
                       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        })
        ## Plot Bottom Right
        with(ds, {
                plot(ds$dtime,
                     ds$Global_reactive_power,
                     col="black",
                     main="",
                     xlab="datetime",
                     ylab="Global_reactive_power",
                     type="l"
                )
        })
}

plot.png("plot4.png", plot4, mfr = c(2, 2))
