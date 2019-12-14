NEI <- readRDS("E:\\R\\summarySCC_PM25.rds") 
SCC <- readRDS("E:\\R\\Source_Classification_Code.rds") 

#6. Порівняйте викиди від автомобільних джерел у місті Балтимор із аналогічними викидами в окрузі Лос-Анджелес, Каліфорнія (fips == "06037"). У якому місті відбулися значні зміни з часом у викидах від автомобільних джерел? 

library(ggplot2)
motorvehicle <- SCC[grep("Vehicle", SCC$SCC.Level.Three, ignore.case = T), ]
df1_motorvehicle <- merge(NEI, motorvehicle, by="SCC")

Bal_LA<-subset(mv_data, fips=="24510" | fips=="06037")
graph6 <- aggregate(Emissions~fips+year, Bal_LA, sum)

png("plot6.png", width=480, height=480)
ggplot(graph6, aes(year, Emissions))+geom_line(aes(color=fips))+geom_point(aes(color=fips))+labs(title = "Total Emissions of PM2.5 from motor vehicle sources 
       in Baltimore, Maryland, and Los Angeles, California")+labs(x = "Year", y = "Emissions of PM2.5 (tons)")+scale_color_discrete(name = "Fips", labels = c("Los Angeles", "Baltimore"))
dev.off()

#В Балтіморі було виявлено значне зменшення викидів протягом 1999-2008 років. В той час як у Лос Анжелесі з 1999 по 2005 зростала кількість викидів, а з 2005 по 2008 зменшувалась.
