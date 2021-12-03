library(ggplot2)
library(gapminder)
library(dplyr)
summary(gapminder)
print(gapminder)

# mean gdpPercap, France, 1980s
gapminder %>%  filter(country=="France" , year %in% c(1982,1987)) %>% summarise(mean(gdpPercap)) 

# Mean lifeExp for each European country
gapminder %>% filter(continent == "Europe") %>% group_by(country) %>% summarise(mean(lifeExp))

# Graphing mean lifeExp of Europe over time
gapminder %>% filter(continent=="Europe") %>% group_by(year) %>% summarise(mean_lifeExp=weighted.mean(lifeExp,pop))%>% ggplot(aes(x=year,y=mean_lifeExp,size=mean_lifeExp))+geom_point()+ggtitle("Mean lifeExp for Europe")

# How many countries in data set
gapminder %>% count(country)                                                                     
length(unique(gapminder$country))
