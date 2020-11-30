library(party)
library(psych)
library(caret)
happi <- read.csv("D:/COOLYEAH/SEMESTER 5/DM dan KnowMan/dmkm-main/r/dataset/SomervilleHappinessSurvey2015.txt")
head(happi)
str(happi)
happi$D <- as.factor(happi$D)

#Split
set.seed(123)
sampel <- sample(2,nrow(happi),replace = T, prob = c(0.8,0.2))
trainingdat <- happi[sampel==1, ]
testingdat <- happi[sampel==2, ]
print(paste("Jumlah train data :", nrow(trainingdat)))
print(paste("Jumlah test data :", nrow(testingdat)))
library(class)
for(i in 1:10){
  prediksiknn <- knn(trainingdat, testingdat, trainingdat$D, k=i)
  akurasi <- 100*sum(testingdat$D==prediksiknn)/nrow(testingdat)
  cat("K = ", i," akurasinya ",akurasi, '%', '\n')
}
knn3 <- knn(trainingdat , testingdat , trainingdat$D, k=3)
confusionMatrix(knn5, testingdat$D)
