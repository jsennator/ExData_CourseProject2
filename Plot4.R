NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset coal data
combrel <-grepl("comb", SCC$SCC.Level.One,ignore.case=TRUE)
coalrel <- grepl("coal", SCC$SCC.Level.Four,ignore.case=TRUE)
coalcomb <- (combrel & coalrel)
combSCC <- SCC[coalcomb,]$SCC
combNEI <-NEI[NEI$SCC %in% combSCC,]

png("plot4.png")

library(ggplot2)

ggp <- ggplot(combNEI,aes(factor(year),Emissions/10^5))+
  geom_bar(stat="identity",fill="red",width = 0.75)+
  theme_bw() + guides(Fill=FALSE)+
  labs(x="year",y=expression("Total PM"[2.5]*" Emission (10^5 Tons)"))+
  labs(title=expression ("Coal Combustion Source Emissions Across US from 1999-2008"))

print(ggp)
dev.off()
