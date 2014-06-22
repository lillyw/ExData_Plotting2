# Download two files and save them in the director C:/myR
NEI <- readRDS("C:/myR/summarySCC_PM25.rds")
SCC <- readRDS("C:/myR/Source_Classification_Code.rds")
NEI$myyear<-as.factor(NEI$year)
library("plyr")

#coal-related SCC
sub_SCC = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

#merge NEI and coal related SCC
NEI_SCC<-merge(NEI, sub_SCC, by='SCC')

#plot data
png("C:/myR/plot4.png")
mydata<-ddply(NEI_SCC, .(myyear), summarize, sum=sum(Emissions))
plot(mydata$myyear,mydata$sum,type="n",xlab="Year",ylab="PM2.5 Emission", 
     main="Total PM2.5 Emission from coal combustion-related sources",boxwex=0.01)
lines(mydata$myyear,mydata$sum)
dev.off()