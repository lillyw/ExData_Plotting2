# Download two files and save them in the director C:/myR
NEI <- readRDS("C:/myR/summarySCC_PM25.rds")
SCC <- readRDS("C:/myR/Source_Classification_Code.rds")
NEI$myyear<-as.factor(NEI$year)
library("plyr")

#plot data
mydata<-ddply(NEI, .(myyear), summarize, sum=sum(Emissions))
png("C:/myR/plot1.png")
plot(mydata$myyear,mydata$sum,type="n",xlab="Year",ylab="PM2.5 Emission", 
     main="Total PM2.5 Emission from 1999 to 2008",boxwex=0.01)
lines(mydata$myyear,mydata$sum)
dev.off()