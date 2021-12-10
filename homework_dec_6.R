library(ggplot2)
library(dplyr)
library(babynames)
library(births)
#Graph of Bennett over time 
babynames %>% filter(year>1880, name=="Bennett") -> bennetts
ggplot(bennetts, aes(year, prop, color=sex))+geom_point()+ggtitle("use of Bennett")
#Is bennett more popular for boys or girls?
bennetts %>% group_by(sex) %>% summarise(mean(prop))


#Which year was Bennett most popular
bennetts %>% group_by(sex) %>% slice_max(prop)



#Ranking of Bennett over the years
babynames %>% group_by(year,sex) %>% mutate(rank=row_number(desc(prop))) %>% 
  filter(name=="Bennett") %>%
  ggplot(aes(year,rank, color=sex))+geom_point()


#Bennett V. Benedict
#Creating Benedict variable 
babynames %>% group_by(name) %>% filter(name=="Bennett" | name=="Benedict")%>% 
  summarise(sum(n)) 

#graphing Bennett V Benedict
babynames %>% group_by(name) %>% filter(name=="Bennett" | name=="Benedict")-> bennett_v_benedict
ggplot(bennett_v_benedict, aes(year, prop, color=name))+geom_point()

#Total # of social security applicants over the years
babynames %>% group_by(year) %>% summarise(sum=sum(n)) -> applicants
applicants %>% ggplot(aes(year, sum))+geom_point()+ggtitle("number of social security applicants over time")

#left_join births data set
births->births
app_births <- left_join(applicants, births)       
app_births %>% ggplot()+geom_point(aes(year,births,color="red"))+
  geom_point(aes(year,sum,color="blue"))+
  scale_color_manual(values=c("blue","red"),labels=c("total applicants","total births"))+
  labs(x="year",y="number of people", title="total applicants vs births")+
  geom_abline(slope=28571)

