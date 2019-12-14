NEI <- readRDS("E:\\R\\summarySCC_PM25.rds") 
SCC <- readRDS("E:\\R\\Source_Classification_Code.rds") 

library(ggplot2)

#3. З чотирьох типів джерел, позначених змінною type (point, non-point, onroad, or non-road), для якого з цих чотирьох джерел спостерігалось зменшення викидів у 1999–2008 роках для міста Балтімор? Для яких спостерігалося збільшення викидів у 1999–2008 роках? Скористайтеся системою ggplot2, для побудови графіків для відповіді на ці запитання. 

graph3<-aggregate(Emissions~fips+type+year, NEI, sum)

Balt<-subset(graph3, fips=="24510")

png("plot3.png", width=480, height=480)
qplot(x=year, y=Emissions, data=Balt, facets=.~type, geom = c("point", "line"), xlab = "Year",  ylab = "Emissions of PM2.5 (tons)", main = "Total Emissions of PM2.5 by the Type of Source in Baltimore, Maryland", color=type)
dev.off()

# За досліджуваний період зменшувались викиди для non-point, non-road, onroad.