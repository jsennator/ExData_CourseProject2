NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate by sum the total emissions by year
aggtotalyear <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png')
barplot(height=aggtotalyear$Emissions,names.arg=aggtotalyear$year,xlab="years",ylab=("total PM'[2.5]*' emission"),main=("Total PM'[2.5]*' emissions at various years"))
dev.off()
