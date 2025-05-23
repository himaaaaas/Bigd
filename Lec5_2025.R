getwd()
setwd("e:/R_DATA")
getwd()
wbcd <- read.csv("wisc_bc_data.csv", stringsAsFactors = FALSE)
str(wbcd)
wbcd <-wbcd[-1]
head(wbcd)
table(wbcd$diagnosis)
wbcd$diagnosis<-factor(wbcd$diagnosis, levels = c("B", "M"), labels = c("Benign", "Malignant"))
table(wbcd$diagnosis)
summary(wbcd[c("radius_mean", "area_mean", "smoothness_mean")])
normalize <- function(x){
  return((x-min(x))/(max(x)- min(x)))
}
normalize(c(1, 2, 3, 4, 5))
normalize(c(10, 20, 30, 40, 50))

wbcd_n<-lapply(wbcd[2:31], normalize)
wbcd_n
wbcd_n<-as.data.frame(lapply(wbcd[2:31], normalize))

wbcd_train <-wbcd_n[1:469, ]
wbcd_test <-wbcd_n[470:569, ]
wbcd_train_labels <- wbcd[1:469,1 ]
wbcd_test_labels <-wbcd[470:569,1 ]

install.packages("class")
library(class)

wbcd_test_pred<-knn(train=wbcd_train, test=wbcd_test,
                    cl=wbcd_train_labels, k=21)
wbcd_test_labels

install.packages("gmodels")
library(gmodels)
CrossTable(x=wbcd_test_labels, y=wbcd_test_pred, prop.chisq = FALSE)
