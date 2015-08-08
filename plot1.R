#setting the working directory
setwd("C:/Users/USER/Documents/My Learning/External/Assignment/Assignment_4/Project_1")

#create a folder name "data" 
if(!file.exists("./data")){dir.create("./data")}

#getting data file and subset the required data
library (data.table)
dt <- fread("./data/household_power_consumption.txt", na.strings="?",stringsAsFactors = FALSE)
dt$Date <- as.Date(dt$Date, format="%d/%m/%Y")
dt2 <- subset(dt, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#ploting graph 1
hist(as.numeric(dt2$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
