library(gapminder)
list(gapminder)
summary(gapminder)

#mean life exp
summary(gapminder$lifeExp)

#subset mexico & mexico avgs
mexico <- subset(gapminder, country=="Mexico")
list(mexico)
summary(mexico$lifeExp)

# plotting mexico pop 
library(ggplot2)
ggplot(data=mexico, aes(x=year, y=pop, size=pop))+ geom_point()

# subset canada, US, and mexico
north_america <- subset(gapminder, country=="Canada"|country=="United States"|country=="Mexico")
list(north_america)
summary(north_america$lifeExp)

#plotting north america lifeExp
library(ggplot2)
ggplot(data=north_america, aes(x=year, y=lifeExp, color=country))+geom_point()+geom_line()+ggtitle("North America lifeExp")

#facet attempt
library(ggplot2)
ggplot(data=gapminder, aes(x=year, y=lifeExp, color=country))+geom_line() + facet_grid(~country)