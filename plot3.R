data <- read.table("C:\\Users\\XXX\\Downloads\\exdata_data_household_power_consumption\\household_power_consumption.txt",header=FALSE,sep =";",stringsAsFactors =FALSE,skip=grep("1/2/2007",readLines("C:\\Users\\Mark\\Downloads\\exdata_data_household_power_consumption\\household_power_consumption.txt")),nrows=10000)
colnames(data) <- read.table("C:\\Users\\XXX\\Downloads\\exdata_data_household_power_consumption\\household_power_consumption.txt",header=FALSE,sep =";",stringsAsFactors =FALSE,nrows=1)
data1 <- subset(data,Date %in% c("1/2/2007","2/2/2007"))

library(lubridate)
data1$DateTime <- dmy_hms(paste(data1$Date,data1$Time,sep=" "))

png("plot3.png",width = 480, height = 480)
with(data1,plot(DateTime,Sub_metering_1,type="l",col="black",xlab="",ylab="Energy Sub metering"))
lines(data1$DateTime,data1$Sub_metering_2,col="red")
lines(data1$DateTime,data1$Sub_metering_3,col="blue")
legend("topright",cex=0.95,lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()