#####################################################################################################
# Title:    Plot 1 - Histogram of Global Active Power                                               #
# Purpose:  Produce plot 1 for project 1 in Exploratory Data Analysis course.                       #
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

##### Plot: Histogram of Global Active Power #####


png(filename = "plot1.png",
    width = 480,
    height = 480)

with(uci.data1,hist(as.numeric(Global_active_power),
                    col="red",
                    main=paste("Global Active Power",sep=""),
                    xlab = "Global Active Power (kilowatts)"))

dev.off()