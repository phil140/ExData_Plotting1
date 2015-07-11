# Plot1
# Revisions:
# 7/10/2015 - initial
# 7/11/2015 - moved bulky code to utils.R

# Notes:
#  See 'utils.R' for the code that downloads and reads the data at:
#  "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

# start
cat("plot1.R\n")

# Required packages
require(utils)

# Code that downloads, reads, and filters the data
source('utils.R')   # project1_getdata()

# Create subdirectories
    rootdir="./project1"
    tmpdir=paste0(rootdir,"/tmp"); if(!file.exists(tmpdir))  dir.create(tmpdir,recursive = TRUE);
    outdir=paste0(rootdir,"/out"); if(!file.exists(outdir))  dir.create(outdir,recursive = TRUE);
    
# Get the filtered data
g<-project1_getdata(tmpdir)

# plot1
png(filename = paste0(outdir,"/plot1.png"), width = 480, height = 480)
title(main = "Plot 1")
hist(g$Global_active_power,freq=TRUE,col = "red",main = "Global Active Power", xlab ="Global Active Power (kilowatts)")
dev.off()
# done
cat("Output:", paste0(outdir,"/plot1.png"),"\n");
cat("plot1.R done.\n")