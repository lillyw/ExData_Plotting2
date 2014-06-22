# Download two files and save them in the director C:/myR
NEI <- readRDS("C:/myR/summarySCC_PM25.rds")
SCC <- readRDS("C:/myR/Source_Classification_Code.rds")
NEI$myyear<-as.factor(NEI$year)
library("plyr")
library("ggplot2")

#subset data to include emissions from motor vehicle sources in Baltimore and LA
sub_NEI<- subset(NEI, (fips == "24510" | fips=="06037") & type == 'ON-ROAD')
sub_NEI$city[sub_NEI$fips=="24510"]<-"Baltimore"
sub_NEI$city[sub_NEI$fips=="06037"]<-"LA"

#plot data
mydata<-ddply(sub_NEI, .(myyear, city), summarize, sum=sum(Emissions))

png("C:/myR/plot6.png")
g<-ggplot(mydata,aes(myyear,sum))
g+geom_point(aes(color=city))+labs(x="Year",  y="PM2.5 emission", 
	title="Total PM2.5 Emission from motor vehicle sources")
dev.off()
