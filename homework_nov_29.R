# Bennett Forville
# December 2 2021

library(ggplot2)
library(gapminder)
library(dplyr)
summary(gapminder)
print(gapminder)

# The mean GDP per capita for France in the 1980s
gapminder %>% 
  filter(country=="France", year %in% c(1982, 1987)) %>% 
  summarise(mean(gdpPercap)) %>% 
  print()

# Mean life expectancy for each European country in the dataset. 
gapminder %>% filter(continent == "Europe") %>% group_by(country) %>% summarise(mean(lifeExp))

# Graph mean life expectancy for the entire continent of Europe over time
gapminder %>% filter(continent=="Europe") %>% group_by(year) %>% summarise(weighted.mean(lifeExp)) %>% ggplot(aes(x=year,y=lifeExp,size=lifeExp))+geom_point()+ggtitle("Mean lifeExp for Europe")

gapminder %>% count(country)                                                                     
gapminder %>% filter(continent=="Europe") %>% group_by(year) %>% summarise(mean_lifeExp=weighted.mean(lifeExp,pop))%>% ggplot(aes(x=year,y=mean_lifeExp,size=mean_lifeExp))+geom_point()+ggtitle("Mean lifeExp for Europe")

# Compute how many separate countries are in the dataset 

length(unique(gapminder$country))
