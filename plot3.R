if(!require(sqldf)){
    install.packages("sqldf")
    library(sqldf)
}
if(file.exists("household_power_consumption.txt")) {
  mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
  myData <- read.csv2.sql("household_power_consumption.txt",mySql)
  myData$dateTime <- strptime(paste(myData$Date,myData$Time),"%d/%m/%Y %H:%M:%S")
  png(filename="Plot3.png",width=480,height=480)
  #add bg="transparent" to png command to get a transparent background as per original example
  with(myData, {
    plot(dateTime, Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
    lines(dateTime,Sub_metering_2,col="red")
    lines(dateTime,Sub_metering_3,col="blue")
    legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  }) 
  dev.off()
} else print("Could not find data file in working directory")
