library(babynames)
library(dplyr)
library(ggplot2)
print(babynames)
babynames %>% filter(year==2004, sex=="F", name=="Bennett") %>% group_by(name) 
babynames %>% filter(year==2004, sex=="M", name=="Bennett") %>% group_by(name)
babynames %>% filter(year==2004, sex=="F", name=="Alexandra") %>% group_by(name)
babynames %>% filter(year>1880, sex=="F", name=="Bennett") %>% group_by(year) %>% ggplot(aes(year, n))+geom_point()+ggtitle("use of Bennett for females")
babynames %>% filter(year>1880, sex=="M", name=="Bennett") %>% group_by(year) %>% ggplot(aes(year, n))+geom_point()+ggtitle("use of Bennett for males")
babynames %>% filter(year>1880, name=="Bennett") %>% group_by(year,sex) %>% ggplot(aes(year, n, color=sex))+geom_point()+ggtitle("use of Bennett")
babynames %>% filter(name=="Bennett", sex=="F", year %in% (2004:2020)) %>% group_by(year) %>% ggplot(aes(year, n))+geom_point()

                     