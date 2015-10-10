#Rscript to load file and create multiple plots for energy consumption data for Feb 1 and 2nd 2007

library(dplyr)
library(lubridate)

r <-read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE)
rf<-filter(r, Date == "1/2/2007" | Date == "2/2/2007")
rf<-mutate(rf,DateTime= dmy_hms(paste(Date,Time)))
##plot 1

##plot 2
png(filename = "Plot3.png",
    width = 480, height = 480)
 with(rf,plot(DateTime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
 with(rf,lines(DateTime,Sub_metering_2,type="l",col="red"))
 with(rf,lines(DateTime,Sub_metering_3,type="l",col="blue"))
legend("topright",lwd=2, cex=1.0,col=c("black","Red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

