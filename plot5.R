# Download two files and save them in the director C:/myR
NEI <- readRDS("C:/myR/summarySCC_PM25.rds")
SCC <- readRDS("C:/myR/Source_Classification_Code.rds")
NEI$myyear<-as.factor(NEI$year)
library("plyr")

#subset data to include emissions from motor vehicle sources in Baltimore
sub_NEI<- subset(NEI, fips == 24510 & type == 'ON-ROAD')

#plot data
mydata<-ddply(sub_NEI, .(myyear), summarize, sum=sum(Emissions))
png("C:/myR/plot5.png")
plot(mydata$myyear,mydata$sum,type="n",xlab="Year",ylab="PM2.5 Emission", 
     main="Total PM2.5 Emission from motor vehicle sources in Baltimore",boxwex=0.01)
lines(mydata$myyear,mydata$sum)
dev.off()