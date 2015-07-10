# Plot1
# 7/10/2015
# - final

# Required packages
require(utils)
require(lubridate)

# Create subdirectories
rootdir="./project1"
datadir="./project1/data"
outdir="./project1/out"
if(!file.exists(rootdir)) dir.create(rootdir);
if(!file.exists(datadir)) dir.create(datadir);
if(!file.exists(outdir))  dir.create(outdir);

# Download the data
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
fn.zip=paste0(datadir,"/household_power_consumption.zip")
{
    if(!file.exists(fn.zip)) {
       download.file(fileURL, destfile = fn.zip)
    } else {
       cat("File ",fn.zip," already exists.\n");
    }
}  
# Extract from zip
fn.zip=paste0(datadir,"/household_power_consumption.zip")
fn.txt=paste0(datadir,"/household_power_consumption.txt")
{
    if(!file.exists(fn.txt)) {
       unzip(fn.zip,exdir=datadir)
    } else {
       cat("File ",fn.txt," already exists.\n");
    }
}
# Read data file, ";" separator
fn.txt=paste0(datadir,"/household_power_consumption.txt")
{
   f<-read.table(fn.txt, header = TRUE, sep = ";", na.strings = "?")
}
# Extract the data we need
# "We will only be using data from the dates 2007-02-01 and 2007-02-02."
# Format in file is: 16/12/2006
t0=ymd("2007-02-01")
t1=ymd("2007-02-02")
f_date<-dmy(f$Date)
g<-f[which((f_date>=t0) & (f_date<=t1)),]

#plot1
png(filename = paste0(outdir,"/plot1.png"), width = 480, height = 480)
hist(g$Global_active_power,freq=TRUE,col = "red",main = "Global Active Power", xlab ="Global Active Power (kilowatts)")
dev.off()