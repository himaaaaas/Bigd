#12th 2024
#q1
library(tidyverse)
library(ggplot2)
data("pressure")
#first method
ggplot(pressure)+
  aes(x=temperature,y=pressure,col="red")+
  geom_line()+
  geom_point()+
  geom_line(aes(y=pressure/2),col="blue")+
  geom_point(aes(y=pressure/2),col="blue")+
  geom_line(aes(y=pressure*2),col="purple")+
  geom_point(aes(y=pressure*2),col="purple")
#second method
plot(x=pressure$temperature,y=pressure$pressure,type='l')
points(x=pressure$temperature,y=pressure$pressure)
lines(x=pressure$temperature,y=pressure$pressure/2,col='red')
points(x=pressure$temperature,y=pressure$pressure/2,col="red")
lines(x=pressure$temperature,y=pressure$pressure*2,col='blue')
points(x=pressure$temperature,y=pressure$pressure*2,col='blue')





#q2
#i
library(gcookbook)
data("uspopchange")
#ii
upc=uspopchange%>%
  arrange(desc(State))%>%
  slice(1:10)
ggplot(upc)+
  aes(x=Abb,y=Change,fill=Region)+
  geom_col()
#iii
ggplot(upc)+
  aes(x=Abb,y=Change,fill=Region)+
  scale_fill_manual(values = c("red","purple","green","blue"))+
  xlab("State")+
  ylab("Population Change")+
  geom_col(col="black")






#q3
library(tidyverse)
library(ggplot2)
data("diamonds")
#i
diamonds_n=diamonds%>%
  select_if(is.numeric)
#ii
diamonds_mean=as.data.frame(lapply(diamonds_n,mean))
#iii
diamonds_fact=diamonds%>%
  select_if(negate(is.numeric))
#vi
barplot(table(diamonds_fact$color))
#v
diamonds_char=as.data.frame(lapply(diamonds_fact,length))
diamonds_char