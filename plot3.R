if (! ("ds" %in% ls())) source("loaddata.R") ## `ds` is now available

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
