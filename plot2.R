if (! ("ds" %in% ls())) source("loaddata.R") ## `ds` is now available

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




