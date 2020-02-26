#Project 
#logistic regression
#DSC project

#import libraries
library(foreign)
library(corrplot)
library(car)
library(QuantPsyc)
library(leaps)
library(RColorBrewer)
library(Hmisc) 
library(psych)
library(ggplot2)
library(MASS)
library(reshape2)
library(RCurl)
library(tidyverse)
library(plyr)
library(caTools)
library(ROCR)
library(caret)
library(glmnet)
install.packages('e1071', dependencies=TRUE)




# Set the working directory
setwd("C:/Depaul_Win7/DSC 424 Advanced Data Analysis/Project/family")


#Read data
famreg <- read.csv("fam_all_dummies.csv", sep=",", header=T)


famreg$FHICOST <- as.factor(famreg$FHICOST)
famreg$X = NULL
dim(famreg)
str(famreg)
head(famreg)

# Bar Plot
counts <- table(famcleaned$FHICOST)
barplot(counts, main="Cost of family medical/dental care in the past 12 months low (0) or high (1)",
        xlab="0-low cost, 1-high cost") 

# per above bar plot Y is balanced



#split data set to training and test
set.seed(314)
split <- sample.split(famreg$FHICOST, SplitRatio = 0.80)
fam_train = subset(famreg, split == TRUE)
fam_test = subset(famreg, split == FALSE)
head(fam_train)
dim(fam_train)
dim(fam_test)




#logistic regression model
model <- glm (FHICOST ~ ., data = fam_train, family = binomial)
summary(model)


predict <- predict(model, type = 'response')


#confusion matrix
table(fam_train$FHICOST, predict > 0.5)


ROCRpred <- prediction(predict, fam_train$FHICOST)
ROCRperf <- performance(ROCRpred, 'tpr','fpr')
plot(ROCRperf, colorize = TRUE, text.adj = c(-0.2,1.7))




#drop non significant variables
fam_train_sig <- fam_train[c('FHICOST','F10DVCT','FHIMILCT','FHIPRVCT','FHIIHSCT',
                            'FHICADCT','FM_STRCP_12','FM_STRCP_21','FM_STRP_41',
                            'CURWRKN_2','TELCELN_2','F10DVYN_2','FHCPHRYN_2',
                            'FHOSP2YN_2','FSRUNOUT_2','FSBALANC_3','HOUSEOWN_2',
                            'HOUSEOWN_3','FSNAP_2','INCGRP4_2','INCGRP4_3',
                            'INCGRP4_4','INCGRP4_5','FSALYN_2','FINTR1YN_2',
                            'FMEDBILL_2','FMEDBPAY_2','FSAF_2')]

model2 <- glm (FHICOST ~ ., data = fam_train_sig, family = binomial)
summary(model2)




#drop more non significant variables
fam_train_sig2 <- fam_train[c('FHICOST','F10DVCT','FHIMILCT','FHIPRVCT','FHIIHSCT',
                              'FHICADCT','FM_STRCP_12','FM_STRCP_21','FM_STRP_41',
                              'CURWRKN_2','TELCELN_2','F10DVYN_2','FHCPHRYN_2',
                              'FHOSP2YN_2','FSBALANC_3','HOUSEOWN_2',
                              'HOUSEOWN_3','FSNAP_2','INCGRP4_2','INCGRP4_3',
                              'INCGRP4_4','INCGRP4_5','FINTR1YN_2',
                              'FMEDBILL_2','FMEDBPAY_2','FSAF_2')]



model3 <- glm (FHICOST ~ ., data = fam_train_sig2, family = binomial)
summary(model3)

vif(model3) #vif normal, under 5

#drop variables vif over 5, F10DVCT,F10DVYN_2
fam_train_sig3 <- fam_train[c('FHICOST','FHIMILCT','FHIPRVCT','FHIIHSCT',
                              'FHICADCT','FM_STRCP_12','FM_STRCP_21','FM_STRP_41',
                              'CURWRKN_2','TELCELN_2','FHCPHRYN_2',
                              'FHOSP2YN_2','FSBALANC_3','HOUSEOWN_2',
                              'HOUSEOWN_3','FSNAP_2','INCGRP4_2','INCGRP4_3',
                              'INCGRP4_4','INCGRP4_5','FINTR1YN_2',
                              'FMEDBILL_2','FMEDBPAY_2','FSAF_2')]

model4 <- glm (FHICOST ~ ., data = fam_train_sig3, family = binomial)
summary(model4) #all variable under 0.05
vif(model4) #vif under 5


#check for correlation
cor.fam_train_sig3 = cor(fam_train_sig3)
cor.fam_train_sig3
corrplot(cor.fam_train_sig3, method = "number")
corrplot(cor.fam_train_sig3, method = "ellipse")
#no correlation



predict2 <- predict(model4, type = 'response')


#confusion matrix
table(fam_train_sig3$FHICOST, predict2 > 0.5)


ROCRpred <- prediction(predict2, fam_train_sig3$FHICOST)
ROCRperf <- performance(ROCRpred, 'tpr','fpr')
plot(ROCRperf, colorize = TRUE, text.adj = c(-0.2,1.7))










#################################################
#run model on  test data


fam_test2 <- fam_test[c('FHICOST','FHIMILCT','FHIPRVCT','FHIIHSCT',
                              'FHICADCT','FM_STRCP_12','FM_STRCP_21','FM_STRP_41',
                              'CURWRKN_2','TELCELN_2','FHCPHRYN_2',
                              'FHOSP2YN_2','FSBALANC_3','HOUSEOWN_2',
                              'HOUSEOWN_3','FSNAP_2','INCGRP4_2','INCGRP4_3',
                              'INCGRP4_4','INCGRP4_5','FINTR1YN_2',
                              'FMEDBILL_2','FMEDBPAY_2','FSAF_2')]

#check for correlation
cor.fam_test2 = cor(fam_test2)
cor.fam_test2
corrplot(cor.fam_test2, method = "number")
corrplot(cor.fam_test2, method = "ellipse")
#low or medium correclation





model5 <- glm (FHICOST ~ ., data = fam_test2, family = binomial)
summary(model5) #not all variable under 0.05
vif(model5) #vif under 5


predict3 <- predict(model5, type = 'response')

#confusion matrix
table(fam_test2$FHICOST, predict3 > 0.5)

prop.table(table(fam_test2$FHICOST, predict3 > 0.5))










##################################################
#Lasso logistic regression

x <- model.matrix(FHICOST~.,fam_train)[,-1]
y <- ifelse(fam_train$FHICOST == 1,1,0)


set.seed(123)

cv.lasso <- cv.glmnet(x, y, alpha = 1, family="binomial" )
plot(cv.lasso)

cv.lasso$lambda.min

#simples model
cv.lasso$lambda.1se

#regression coefficients
coef(cv.lasso, cv.lasso$lambda.min)
coef(cv.lasso, cv.lasso$lambda.1se)



# Make predictions on the train data
x.test <- model.matrix(FHICOST ~., fam_train)[,-1]
#probabilities <- lasso.model %>% predict(newx = x.test)
probabilities <- cv.lasso %>% predict(newx = x.test)
predicted.classes <- ifelse(probabilities > 0.5, 1, 0)

# Model accuracy
observed.classes <- fam_train$FHICOST
mean(predicted.classes == observed.classes)

#confusion matrix for test
table(observed.classes, predicted.classes)




#### Lasso regression on test set



# Fit the final model on the training data
lasso.model <- glmnet(x, y, alpha = 1, family = "binomial",
                lambda = cv.lasso$lambda.1se)

# Display regression coefficients
coef(model) #zero have not effect on the model
summary(lasso.model)

# Make predictions on the test data
x.test <- model.matrix(FHICOST ~., fam_test)[,-1]
probabilities <- lasso.model %>% predict(newx = x.test)
predicted.classes <- ifelse(probabilities > 0.5, 1, 0)

# Model accuracy
observed.classes <- fam_test$FHICOST
mean(predicted.classes == observed.classes)

#confusion matrix for test
table(observed.classes, predicted.classes)


