data <- read.table("C:\\Users\\XXX\\Downloads\\exdata_data_household_power_consumption\\household_power_consumption.txt",header=FALSE,sep =";",stringsAsFactors =FALSE,skip=grep("1/2/2007",readLines("C:\\Users\\Mark\\Downloads\\exdata_data_household_power_consumption\\household_power_consumption.txt")),nrows=10000)
colnames(data) <- read.table("C:\\Users\\XXX\\Downloads\\exdata_data_household_power_consumption\\household_power_consumption.txt",header=FALSE,sep =";",stringsAsFactors =FALSE,nrows=1)
data1 <- subset(data,Date %in% c("1/2/2007","2/2/2007"))

library(lubridate)
data1$DateTime <- dmy_hms(paste(data1$Date,data1$Time,sep=" "))

png("plot1.png",width = 480, height = 480)
plot1 <- hist(data1$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

dev.off()
