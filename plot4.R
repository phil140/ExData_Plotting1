# Plot4
# Revisions:
# 7/11/2015 - initial

# Notes:
#  See 'utils.R' for the code that downloads and reads the data at:
#  "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

# start
cat("plot4.R\n")

# Required packages
require(utils)
require(dplyr)
require(lubridate)

# Code that downloads, reads, and filters the data
source('utils.R')   # project1_getdata()

# Create subdirectories
    rootdir="./project1"
    tmpdir=paste0(rootdir,"/tmp"); if(!file.exists(tmpdir))  dir.create(tmpdir,recursive = TRUE);
    outdir=paste0(rootdir,"/out"); if(!file.exists(outdir))  dir.create(outdir,recursive = TRUE);
    
# Get the filtered data
g<-tbl_df(project1_getdata(tmpdir))
sav<-g # for testing
g<-sav # for testing
g$Date.pos<-dmy(g$Date)
g$daytime<-dmy_hms(paste(g$Date,g$Time))
g$dow<-wday(g$Date.pos,label=TRUE,abbr=TRUE)

# plot4a x,y (dow,Sub_metering_1..3)
# 
png(filename = paste0(outdir,"/plot4.png"), width = 480, height = 480)
# reset
# set device to 2x2
par(mfrow = c(2, 2))
# top-left (almost same as plot2)
plot(g$daytime, g$Global_active_power, type='l', xlab="",ylab ="Global Active Power")
# top-right (daytime.voltage)
plot(g$daytime, g$Voltage, type='l', xlab="datetime",ylab ="Voltage")
# bottom-left (almost same as plot3)
plot(g$daytime, g$Sub_metering_1, type='n', xlab="",ylab ="Energy sub metering")
points(g$daytime, g$Sub_metering_1, type='l',col="black")
points(g$daytime, g$Sub_metering_2, type='l',col="red")
points(g$daytime, g$Sub_metering_3, type='l',col="blue")
legend("topright", lty=1, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")) 
# bottom-right
plot(g$daytime, g$Global_reactive_power, type='l', xlab="datetime",ylab ="Global_reactive_power")
# close
dev.off()
# done
cat("Output:", paste0(outdir,"/plot4.png"),"\n");
cat("plot4.R done.\n")