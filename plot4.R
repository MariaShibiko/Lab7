NEI <- readRDS("E:\\R\\summarySCC_PM25.rds") 
SCC <- readRDS("E:\\R\\Source_Classification_Code.rds") 

#4. Як змінилися викиди від джерел спалювання вугілля (coal combustionrelated sources)в США у 1999–2008 роках у США? 

graph4_comb <- SCC[grep("comb", SCC$SCC.Level.One, ignore.case = T), ]
graph4_coal <- SCC[grep("coal", SCC$SCC.Level.Four, ignore.case = T), ]
combcoal<-merge(graph4_comb, graph4_coal)

combcoal_data <- merge(NEI, combcoal)
graph4 <- aggregate(Emissions~year, combcoal_data, sum)

png("plot4.png", width=480, height=480)
plot(graph4, type = "l", xlab = "Year",  ylab = "Emissions of PM2.5 (tons)", main = "Total Emissions of PM2.5 from U.S. Coal Combustion-related Sources", xaxt = "n")
years <- c(1999,2002,2005,2008)
axis(1, at = years, labels = years)
dev.off()

#В CША у 1999-2008 роках викиди зменшились.