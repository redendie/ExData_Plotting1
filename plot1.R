if (! ("ds" %in% ls())) source("loaddata.R") ## `ds` is now available

plot.png <- function(filename, fun) {
        png(filename = filename, width = 480, height = 480)
        fun()
        invisible(dev.off())
}

plot1 <- function() {
        with(ds, {
                hist(Global_active_power,
                     col="red",
                     main="Global Active Power",
                     xlab = "Global Active Power (kilowatts)",
                     ylab = "Frequency"
                )
                
        })
}

par(mfrow=c(1,1))
#plot1()
plot.png("plot1.png", plot1)

