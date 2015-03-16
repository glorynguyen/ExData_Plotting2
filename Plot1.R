# Loads RDS files
PM25 <- readRDS("summarySCC_PM25.rds")
Source <- readRDS("Source_Classification_Code.rds")

# Samples data for testing
PM25samp <- PM25[sample(nrow(PM25), size = 1000, replace = F), ]

# Calculating Emission
Emis <- aggregate(PM25[, 'Emissions'], by = list(PM25$year), FUN = sum)
Emis$PM <- round(Emis[, 2] / 1000, 2)

#Plot data
png(filename = "plot1.png")
barplot(Emis$PM, col="green", names.arg = Emis$Group.1, main = expression('Total Emission of PM'[2.5]), xlab = 'Year', ylab = expression(paste('PM', ''[2.5], 'in Kilotons')))
dev.off()