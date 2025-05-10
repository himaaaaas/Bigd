#q1
library(tidyverse)
data("mpg")
#i
table(mpg$model,mpg$class)
#ii
#select the numirc col and store it in mpg_1
mpg_1= mpg%>%
  select_if(is.numeric)
#iii
#normalize function
normalize = function(x)
{
  return((x-min(x))/(max(x)-min(x)))
}
#iv
#use lapply to normalize many col in the same step
mpg_n=lapply(mpg_1[c("displ","cty","hwy")],normalize)






#q2
#i
#it is normal as the data fill be free inside the 
#ram as it is way bigger than the data
#ii
install.packages("ff")
install.packages("ffbase")
install.packages("ffbase2")
library(ffbase)
library(ff)
#iii
#make directory using shell instruction
getwd()
setwd("C:\\uni\\Semester X\\Intro To Big Data\\mozakra fash5")
shell("mkdir air_ffdf")
#make the temp directory
options(fftempdir = "C:\\uni\\Semester X\\Intro To Big Data\\mozakra fash5\\air_ffdf")
tempoo="air_ffdf"
#iv
#read the file and asemo kol 100000 fyh file lewad7o
airline.ff=read.table.ffdf(file="flights_sep_oct15.txt",
                          sep=",", VERBOSE = TRUE , header=TRUE,
                          next.rows=100000 ,colClasses=NA )
#v
airline_1=read_file("flights_sep_oct15.txt")
#make format to get the size of the files
format(object.size(airline.ff),"MB")
format(object.size(airline_1),"MB")



#q3
#i
library(readr)
#read the file
wbcd=read.csv("wisc_bc_data.csv", stringsAsFactors = FALSE)
#ii
#drop the first col
wbcd=wbcd[-1]
#iii
#change the B and M to Benign and Malignant
wbcd$diagnosis=factor(wbcd$diagnosis , levels = c("B","M"), labels = c("Benign","Malignant"))
#iv
table(wbcd$diagnosis)
#v
normalize = function(x)
{
  return((x-min(x))/(max(x)-min(x)))
}
#vi
#select the numeric col only and store them in wbcd_numeric
wbcd_numeric=wbcd%>%
  select_if(is.numeric)
wbcd_n=lapply(wbcd_numeric,normalize)
#change it to dataframe
wbcd_n=data.frame(wbcd_n)
#extra machine learnin using KNN
#ta2seem el data
wbcd_train=wbcd_n[1:469,]
wbcd_test=wbcd_n[470:569,]
wbcd_train_labels=wbcd[1:469,1]
wbcd_test_labels=wbcd[470:569,1]
#required libraries for the machine learning
library(class)
library(gmodels)
#maching learning done
wbcd_test_pred=knn(train=wbcd_train,test = wbcd_test,cl = wbcd_train_labels,k = 21)
#check the model accuracy
CrossTable(x=wbcd_test_labels,y=wbcd_test_pred,prop.chisq = FALSE)







#q4
#i
curve(x^3-5*x+1,from=-5,to=5)
#ii
myfun=function(xvar)
{
  1/(1+exp(-xvar+10))
}
#iii
curve(myfun(x),add=TRUE,from=-5,to=5)







#q5
library(tidyverse)
library(ggplot2)
data("mpg")
#using pipeline
mpg_1=mpg%>%
  filter(cty>25)%>%
  select(cty,hwy)

ggplot(mpg_1)+
  aes(x=cty,y=hwy)+
  geom_point()
#using the method given in the question
Temp1=filter(mpg,cty>25)
Temp2=select(Temp1,cty,hwy)
ggplot(Temp2)+
  aes(cty,hwy)+
  geom_point()





#q6
#i
install.packages("gcookbook")
library(gcookbook)
library(ggplot2)
data("uspopchange")
#ii
upc=uspopchange%>%
  arrange(desc(State))%>%
  slice(1:25) #to slice the data and take the first 25 only
ggplot(upc)+
  aes(x=Abb,y=Change,fill=Region)+
  geom_col()
#iii
ggplot(upc)+
  aes(x=Abb,y=Change,fill=Region)+
  scale_fill_manual(values=c("green","red","purple","orange"))+#used to fill the colors inside the bars by specfic colors 
  xlab("State")+
  ylab("Population Change")+
  geom_col(col="black")


  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  