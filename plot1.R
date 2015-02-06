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

#defining the relevant data
GAP <- powercons$Global_active_power

#setting parameters for the graphics
par(cex.lab=0.7, cex.axis=0.8, cex.main = 0.9)

# rendering the graph
par(mfrow = c(1,1))
hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (Killowatts)")

# exporting the graph to PNG

dev.copy(png, file="plot1.png")
dev.off()

#thats it!
