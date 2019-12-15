#5. Як змінилися викиди від автомобільних джерел (motor vehicle sources) у 1999–2008 роках у місті Балтимор? 
NEI <- readRDS("E:\\R\\SummarySCC_PM25.rds") 
SCC <- readRDS("E:\\R\\Source_Classification_Code.rds") 

motor_vehicle <- SCC[grep("Vehicle", SCC$SCC.Level.Three, ignore.case = T), ]

data <- merge(NEI, motor_vehicle, by="SCC")

Balt <- subset(data, fips=="24510")

graph5 <- aggregate(Emissions~year, Balt, sum)

png("plot5.png", width=480, height=480)
plot(graph5, type = "l", xlab = "Year",  ylab = "Emissions of PM2.5 (tons)", 
     main = "Total Emissions of PM2.5 
     from Motor Vehicle Sources in Baltimore, Maryland", 
     xaxt = "n")
years <- c(1999,2002,2005,2008)
axis(1, at = years, labels = years);
dev.off()

#Викиди в місті Балтімор у 1999-2008 роках зменшились.
