if(!require(sqldf)){
    install.packages("sqldf")
    library(sqldf)
}
if(file.exists("household_power_consumption.txt")) {
  mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
  myData <- read.csv2.sql("household_power_consumption.txt",mySql)
  myData$dateTime <- strptime(paste(myData$Date,myData$Time),"%d/%m/%Y %H:%M:%S")
  png(filename="Plot1.png",width=480,height=480)
  #add bg="transparent" to png command to get a transparent background as per original example
  hist(myData$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
  dev.off()
} else print("Could not find data file in working directory")
