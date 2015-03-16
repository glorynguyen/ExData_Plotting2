# Loads RDS
require(ggplot2)

PM25 <- readRDS("summarySCC_PM25.rds")
Source <- readRDS("Source_Classification_Code.rds")

# Samples data for testing
PM25sample <- PM25[sample(nrow(PM25), size = 5000, replace = F), ]

# Baltimore City, Maryland == fips
MD <- subset(PM25, fips == 24510)
MD$year <- factor(MD$year, levels = c('1999', '2002', '2005', '2008'))

png('plot3.png', width = 800, height = 500, units = 'px')
ggplot(data = MD,col="Blue", aes(x = year, y = log(Emissions))) + facet_grid(. ~ type) + guides(fill = F) + geom_boxplot(aes(fill = type)) + stat_boxplot(geom = 'errorbar') + ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions'))) + xlab('Year') + ggtitle('Emissions per Type in Baltimore City, Maryland') + geom_jitter(alpha = 0.10)
dev.off()