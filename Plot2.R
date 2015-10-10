#Rscript to load file and create plot Global Active power vs Date and time for Feb 1 and 2nd 2007
library(dplyr)
library(lubridate)

r <-read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE)
rf<-filter(r, Date == "1/2/2007" | Date == "2/2/2007")
rf<-mutate(rf,DateTime= dmy_hms(paste(Date,Time)))
##plot 1

##plot 2
png(filename = "Plot2.png",
    width = 480, height = 480)
with(rf,plot(DateTime,Global_active_power,type="l",ylab="Global Active Power(Killowatts)"
,xlab=""))
dev.off()
