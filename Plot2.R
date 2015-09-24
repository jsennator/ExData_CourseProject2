NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset for Baltimore
baltimore <- NEI[NEI$fips=="24510",]

# Aggregate by sum Baltimore emissions by year
aggtotalyearBaltimore <- aggregate(Emissions ~ year, baltimore, sum)

png('plot2.png')
barplot(height=aggtotalyear$Emissions,names.arg=aggtotalyearBaltimore$year, xlab="years", ylab=("PM'[2.5]*' Emissions (Tons)"),main=("Total PM'[2.5]*' Emissions From All Baltimore City Sources"))
dev.off()
