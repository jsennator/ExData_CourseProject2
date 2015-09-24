NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset for Baltimore & On Road
baltimore <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",]

# Aggregate by sum Baltimore emissions by year
aggtotalyearBaltimore <- aggregate(Emissions ~ year, baltimore, sum)

png('plot5.png')
g <- ggplot(aggtotalyearBaltimore,aes(factor(year),Emissions))
g <- g + geom_bar(stat="identity", fill="purple", width=.5) +
  theme_bw() +guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) +
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))
print(g)
dev.off()

