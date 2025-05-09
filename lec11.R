#setwd("e:/R_DATA")
df <- read.csv("C:/Users/ihhim/OneDrive/Desktop/BigData/need_puf_2014.csv",header = TRUE,sep = ",")
colnames(df)

yy<-lapply(colnames(df),
           function(x){
             class(df[,x])
           })
yy

#s<-function(x){
#     class(df[,x])
#   }
#yy<-lapply(colnames(df),s)

classes<-unlist(lapply(colnames(df),
                       function(x){
                         class(df[,x])
                       }
)
)                       
classes

ii<-which(classes=="character")
ii

for (i in ii) {
  df[,i]<-factor(df[,i])
}

iii<-unlist(lapply(colnames(df),function(x){
      class(df[,x])
}
))
iii

ind<-which(iii=="factor")
ind

for (i in ind) {
  df[,i]<-as.integer(df[,i])
  
}

write.table(df,"need_data.csv",sep = ",",
            row.names = FALSE,col.names = TRUE)

install.packages("bigmemory")
library(bigmemory)

need.mat<-read.big.matrix("need_data.csv",header = TRUE,
                          sep = ",",type = "double",
                          backingfile = "need_data.bin",
                          descriptorfile = "need_data.desc")
need.mat
object.size(need.mat)
dim(need.mat)
dimnames(need.mat)
head(need.mat)

install.packages("bigtabulate")
library(bigtabulate)
library(biganalytics)
bigtable(need.mat,c("PROP_AGE"))
bigtable(need.mat,c("PROP_AGE","PROP_TYPE"))
summary(need.mat[,"Econs2012"])
need.bands<-bigsplit(need.mat,ccols = "EE_BAND",
                     splitcol = "Econs2012")

need.bands
