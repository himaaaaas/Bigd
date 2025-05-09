#plotting a function curve
curve(x^3-5*x,from = -4,to=4,col="red")
curve(x^2,add = TRUE,col="blue")
curve(exp(x),add=TRUE,col="green")

myfun<-function(x){
  return(1/(1+exp(-x+10)))
}
curve(myfun(x),from = 0,to=20,col="red")
curve(1-myfun(x),add = TRUE,col="blue")
#####################################
myfun1<-function(xvar){
  return(1/(1+exp(-xvar+10)))
}
curve(myfun1,from = 0,to=20,col="red")
curve(1-myfun1(x),add = TRUE,col="blue")
curve((1-myfun(x))/2,add=TRUE,col="green")
############################################
#Making a basic Bar graph
install.packages("gcookbook")
library(gcookbook)
install.packages("ggplot2")
library(ggplot2)

data("pg_mean")
ggplot(pg_mean,aes(x=group,y=weight))+
  geom_col()

data("cabbage_exp")
ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) +
  geom_col(position="dodge")

ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) +
  geom_col(colour="black")

ggplot(cabbage_exp,aes(x=Date,y=Weight,fill = Cultivar))+
  geom_col(color="black",position = "dodge")

ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) +
  geom_col(position="dodge", colour="black") +
  scale_fill_brewer(palette=2)

ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) +
  geom_col(position="dodge", colour="black") +
  scale_fill_manual(values = c("red", "blue")) +
  xlab("The Date") + ylab("The Weight")
