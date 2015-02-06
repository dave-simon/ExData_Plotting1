# set wd (I used mine, replace for your own)
setwd("~/Dropbox (Pagini)/Documentos/R Stats/2014/Coursera - Data Science Specialization/Exploratory")

# loading packages
install.packages("lubridate")
library(data.table)
library(lubridate)
# read the raw data, subset the two relevant days
classes <- c(rep('character',2),rep('numeric',7))
powercons <- read.table('household_power_consumption.txt',header=TRUE,sep=';',na.strings='?',colClasses=classes)
powercons <- powercons[powercons$Date=='1/2/2007' | powercons$Date=='2/2/2007',]
#here comes the lubridate package to save us some time!  
powercons$DateTime<-dmy(powercons$Date)+hms(powercons$Time)
powercons<-powercons[,c(10,3:9)]

# rendering the graph
par(mfrow = c(1,1))
with(powercons, {
  plot(DateTime, Sub_metering_1, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(DateTime, Sub_metering_2,  col = 'Red')
  lines(DateTime, Sub_metering_3, col = 'Blue')
})
# adding legend
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# exporting the graph to PNG

dev.copy(png, file="plot3.png")
dev.off()

#thats it!

