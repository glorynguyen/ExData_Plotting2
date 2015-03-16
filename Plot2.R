# Loads RDS files
PM25 <- readRDS("summarySCC_PM25.rds")
Source <- readRDS("Source_Classification_Code.rds")

# Create sample data
PM25samp <- PM25[sample(nrow(PM25), size = 5000, replace = F), ]

# Subsets data with fips == 24510
Temp <- subset(PM25, fips == '24510')

png(filename = 'plot2.png')
barplot(col="Blue",tapply(X = Temp$Emissions, INDEX = Temp$year, FUN = sum), main = 'Total Emission in Baltimore City, Temp', xlab = 'Year', ylab = expression('PM'[2.5]))
dev.off()