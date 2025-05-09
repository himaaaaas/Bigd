#Bar Graphs
install.packages("ggplot2")
library(ggplot2)
install.packages("gcookbook")
library(gcookbook)
data("uspopchange")
install.packages("dplyr")
library(dplyr)

upc<-uspopchange %>% 
  arrange(desc(Change)) %>%  
  slice(1:10)   

ggplot(upc,aes(x=Abb,y=Change,fill = Region))+
  geom_col()

ggplot(upc,aes(x=Abb,y=Change,fill = Region))+
  scale_fill_manual(values = c("green","red"))+geom_col()

ggplot(upc,aes(x=Abb,y=Change,fill = Region))+
  scale_fill_manual(values = c("green","red"))+
  geom_col(color="black")+xlab("state")+ylab("The change")

ggplot(upc,aes(x=reorder(Abb,-Change),y=Change,fill = Region))+
  scale_fill_manual(values = c("green","red"))+
  geom_col(color="black")+labs(x="state",y="The change")


data(climate)  
climate_sub<-climate %>% 
  filter(Source=="Berkeley"& Year>=1900) %>% 
  mutate(pos=Anomaly10y>=0)

ggplot(climate_sub,aes(x=Year,y=Anomaly10y,fill = pos))+
  geom_col(color="black")+
  scale_fill_manual(values = c("blue","red"))



data("uspopchange")
upc <- uspopchange %>% 
  arrange(-Change) %>% 
  slice(1:10)
ggplot(upc, aes(x=Abb, y=Change, fill = Region)) +
  geom_col(colour="black") +
  scale_fill_manual(values = c("green", "yellow")) +
  xlab("State") + ylab("The Change")

ggplot(upc, aes(x=reorder(Abb,-Change), y=Change, fill = Region)) +
  geom_col(colour="black") +
  scale_fill_manual(values = c("green", "yellow")) +
  xlab("State") + ylab("The Change")
