# Download two files and save them in the director C:/myR
NEI <- readRDS("C:/myR/summarySCC_PM25.rds")
SCC <- readRDS("C:/myR/Source_Classification_Code.rds")
NEI$myyear<-as.factor(NEI$year)
library("plyr")
library("ggplot2")

#subset data for Baltimore city
sub_NEI<-NEI[NEI$fips=="24510",]

#plot data
mydata<-ddply(sub_NEI, .(myyear, type), summarize, sum=sum(Emissions))

png("C:/myR/plot3.png")
g<-ggplot(mydata,aes(myyear,sum))
g+geom_point()+facet_grid(.~type)+labs(title="Total PM2.5 Emission in Baltimore city",
                          y="PM2.5 emission each year", x="Year")
dev.off()