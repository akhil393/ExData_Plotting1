#Rscript to load file and create plot1 Global Active power
library(dplyr)
library(lubridate)

r <-read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE)
rf<-filter(r, Date == "1/2/2007" | Date == "2/2/2007")
rf<-mutate(rf,DateTime= dmy_hms(paste(Date,Time)))
##plot 1

png(filename = "Plot1.png",
    width = 480, height = 480)
hist(as.numeric(rf$Global_active_power),col="red",xlab="Global Active Power(Killowatts)"
 ,ylab = "Frequency",main ="Global Active Power")
dev.off()