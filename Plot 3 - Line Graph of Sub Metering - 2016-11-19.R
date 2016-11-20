#####################################################################################################
# Title:    Plot 3 - Line Graph of Sub Metering                                                     #
# Purpose:  Produce plot 2 for project 1 in Exploratory Data Analysis course.                       #
# Author:   Billy Caughey                                                                           #
# Date:     2016.11.19 - Initial Build                                                              #
#####################################################################################################

##### Set Working Directory #####
setwd(paste(personal,"/Coursera/Exploratory Data Analysis/Week 1/Data",sep=""))

##### Bring in Data #####

## Original Data
uci.data <- read.table("household_power_consumption.txt",
                       header = TRUE,
                       sep=";",
                       stringsAsFactors = FALSE)

## Subset to 1 Feb 2007 and 2 Feb 2007
uci.data1 <- subset(uci.data,as.character(Date) %in% c("1/2/2007","2/2/2007"))

##### Plot 3 : Energey sub metering across time #####
time1 <- as.POSIXct(paste(as.Date(uci.data1$Date,format = "%d/%m/%Y"),uci.data1$Time))


png(filename = "plot3.png",
    width = 480,
    height = 480)

plot(time1,as.numeric(uci.data1$Sub_metering_1),type="l",
     ylab = "Energy Sub Metering",
     xlab = "")
lines(time1,as.numeric(uci.data1$Sub_metering_2),col="red")
lines(time1,as.numeric(uci.data1$Sub_metering_3),col="blue")
legend(time1[2000],35,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1),lwd=c(2.5,2.5),col=c("black","red","blue"))

dev.off()