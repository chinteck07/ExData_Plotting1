#setting the working directory
setwd("C:/Users/USER/Documents/My Learning/External/Assignment/Assignment_4/Project_1")

#create a folder name "data" 
if(!file.exists("./data")){dir.create("./data")}

#getting data file and subset the required data
library (data.table)
dt <- fread("./data/household_power_consumption.txt", na.strings="?",stringsAsFactors = FALSE)
dt$Date <- as.Date(dt$Date, format="%d/%m/%Y")
dt2 <- subset(dt, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dt)
#concantenate data and time into 1 column
date_time<- paste(as.Date(dt2$Date),dt2$Time)
dt2$Date_Time <- as.POSIXct(date_time)


#ploting graph 3
with(dt2, {
        plot(dt2$Date_Time, dt2$Sub_metering_1, type= "l", xlab= "",ylab = "Energy sub metering")
        lines(dt2$Date_Time,dt2$Sub_metering_2, col="Red")
        lines(dt2$Date_Time,dt2$Sub_metering_3, col="Blue")
        legend("topright",lty = 1 , col = c("Black", "Red", "Blue"), legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
}
)


#Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()