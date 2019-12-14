NEI <- readRDS("E:\\R\\summarySCC_PM25.rds") 
SCC <- readRDS("E:\\R\\Source_Classification_Code.rds") 

#2. Чи зменшилися загальні викиди PM2.5 у місті Балтімор, штат Меріленд (fips == "24510") з 1999 по 2008 рік? Скористайтеся base plotting system для відповіді на це запитання. 

graph2<-aggregate(Emissions~fips+year, NEI, sum)

Balt <- subset(graph2, fips=="24510")

png("plot2.png", width=480, height=480)
plot(Balt$year, Balt$Emissions, type = "l", xlab = "Year",  ylab = "Emissions of PM2.5 (tons)", main = "Total Emissions of PM2.5 from all Sources in Baltimore, Maryland", xaxt = "n")
years = c(1999,2002,2005,2008)
axis(1, at = years, labels = years)
dev.off()

#Так, загальні викиди в Балтіморі зменшилися.
