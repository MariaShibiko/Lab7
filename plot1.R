NEI <- readRDS("E:\\R\\summarySCC_PM25.rds") 
SCC <- readRDS("E:\\R\\Source_Classification_Code.rds") 

#1. Чи зменшилися загальні викиди PM2.5 у США з 1999 по 2008 рік? Використовуючи base plotting system, складіть графік, що показує загальні (total) викіди PM2.5 з усіх джерел за кожний з 1999, 2002, 2005 та 2008 років. 

graph1 <- aggregate(Emissions~year, NEI, sum)
format(graph1$Emissions,scientific=FALSE)

png("plot1.png", width=480, height=480)
plot(graph1, type = "l", xlab = "Year",  ylab = "Emissions of PM2.5 (tons)", main = "Total Emissions of PM2.5 from all U.S. Sources", xaxt = "n")
years = c(1999,2002,2005,2008)
axis(1, at = years, labels = years)
dev.off()

#Так, судячи з графіку, викиди зменшилися за запропонований період.