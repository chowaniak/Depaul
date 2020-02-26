#DSC 424 project
#logistic regression
#Michal Chowaniak

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
library(Amelia)
library(pscl)



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
counts <- table(famreg$FHICOST)
barplot(counts, main="Cost of family medical/dental care in the past 12 months low (0) or high (1)",
        xlab="0-less then $500, 1- more than $500") 
# per above bar plot Y is balanced




#create a list of names for barplots
names <- c("FHICOST",	"F10DVCT",	"FHCPHRCT",	"FDGLWCT2",	"FWKLIMCT",	"FHSTATEX",	
           "FHSTATPR",	"FSEINCCT",	"FSSICT",	"FDIVDCT",	"FSDAPLCT",	"FHICARCT",	
           "FHIPUBCT",	"FHICOVCT",	"FM_ELDR",	"FHCHMCT",	"FDGLWCT1",	"FLIADLCT",	
           "FANYLCT",	"FHSTATFR",	"FSALCT",	"FOPENSCT",	"FINTR1CT",	"FSSAPLCT",	
           "FHISINCT",	"FHIMILCT",	"FHIEXCT",	"FM_KIDS",	"FHCDVCT",	"FNMEDCT",	
           "FREMEMCT",	"FHSTATG",	"FLAADLCT",	"FPENSCT",	"FOWBENCT",	"FINCOTCT",	
           "FHIPRVCT",	"FHICHPCT",	"FHIIHSCT",	"FM_SIZE",	"FDMEDCT",	"FHOSP2CT",	
           "FWALKCT",	"FHSTATVG",	"FSSRRCT",	"FTANFCT",	"FCHSPCT",	"FHICADCT",	
           "FHIOGVCT",	"FM_STRCP_12",	"FM_STRCP_21",	"FM_STRCP_22",	"FM_STRCP_23",	
           "FM_STRCP_31",	"FM_STRCP_32",	"FM_STRCP_33",	"FM_STRCP_41",	"FM_STRCP_42",
           "FM_STRCP_43",	"FM_STRCP_44",	"FM_STRCP_45",	"FM_TYPE_2",	"FM_TYPE_3",	
           "FM_TYPE_4",	"FM_STRP_12",	"FM_STRP_21",	"FM_STRP_22",	"FM_STRP_23",
           "FM_STRP_31",	"FM_STRP_32",	"FM_STRP_33",	"FM_STRP_41",	"FM_STRP_42",	
           "FM_STRP_43",	"FM_STRP_44",	"FM_STRP_45",	"CURWRKN_2",	"TELCELN_2",
           "FLNGINTV_2",	"FLNGINTV_3",	"FLNGINTV_4",	"F10DVYN_2",	"FDMEDYN_2",
           "FHCDVYN_2",	"FHCHMYN_2",	"FHCPHRYN_2",	"FHOSP2YN_2",	"FNMEDYN_2",	
           "FSRUNOUT_2",	"FSRUNOUT_3",	"FSLAST_2",	"FSLAST_3",	"FSBALANC_2",	
           "FSBALANC_3",	"FLAADLYN_2",	"FLIADLYN_2",	"FWKLIMYN_2",	"FWALKYN_2",
           "FREMEMYN_2",	"FANYLYN_2",	"HOUSEOWN_2",	"HOUSEOWN_3",	"FSNAP_2",	
           "INCGRP4_2",	"INCGRP4_3",	"INCGRP4_4",	"INCGRP4_5",	"INCGRP5_2",	
           "INCGRP5_3",	"INCGRP5_4",	"FSALYN_2",	"FSEINCYN_2",	"FSSRRYN_2",
           "FPENSYN_2",	"FOPENSYN_2",	"FSSIYN_2",	"FTANFYN_2",	"FOWBENYN_2",	
           "FINTR1YN_2",	"FDIVDYN_2",	"FCHSPYN_2",	"FINCOTYN_2",	"FSSAPLYN_2",
           "FSDAPLYN_2",	"FMEDBILL_2",	"FMEDBPAY_2",	"FSAF_2",	"FHICOVYN_2")

names[1]



#Create barpots for all variables
for ( i in 1:length(famreg)){
  count <- table(famreg[[i]])
  name <- names[i]
  barplot(count, main = name)
}
#barplots show x variables are imbalanced




#check for correlation on numerical variables 
famnum <- famreg[c('F10DVCT','FHCPHRCT','FDGLWCT2','FWKLIMCT','FHSTATEX',
                       'FHSTATPR','FSEINCCT','FSSICT','FDIVDCT','FSDAPLCT',
                       'FHICARCT','FHIPUBCT','FHICOVCT','FM_ELDR','FHCHMCT',
                       'FDGLWCT1','FLIADLCT','FANYLCT','FHSTATFR','FSALCT',
                       'FOPENSCT','FINTR1CT','FSSAPLCT','FHISINCT','FHIMILCT',
                       'FHIEXCT','FM_KIDS','FHCDVCT','FNMEDCT','FREMEMCT',
                       'FHSTATG','FLAADLCT','FPENSCT','FOWBENCT','FINCOTCT',
                       'FHIPRVCT','FHICHPCT','FHIIHSCT','FM_SIZE','FDMEDCT',
                       'FHOSP2CT','FWALKCT','FHSTATVG','FSSRRCT','FTANFCT',
                       'FCHSPCT','FHICADCT','FHIOGVCT')]



#check for correlation
cor.famnum = cor(famnum)
cor.famnum
corrplot(cor.famnum, method = "number")
corrplot(cor.famnum, method = "ellipse")


#drop correlated variables
famreg$FM_ELDR = NULL #
famreg$FANYLCT = NULL #
famreg$FSALCT = NULL #
famreg$FHICOVCT = NULL #
famreg$FSSRRCT = NULL #
famreg$FM_SIZE = NULL #
famreg$FSSAPLCT = NULL #
famreg$FDMEDCT = NULL #
famreg$FDGLWCT1 = NULL #


#check for correclation on numerical 
famnum <- famreg[c('F10DVCT','FHCPHRCT','FDGLWCT2','FWKLIMCT','FHSTATEX',
                   'FHSTATPR','FSEINCCT','FSSICT','FDIVDCT','FSDAPLCT',
                   'FHICARCT','FHIPUBCT','FHCHMCT',
                   'FLIADLCT','FHSTATFR',
                   'FOPENSCT','FINTR1CT','FHISINCT','FHIMILCT',
                   'FHIEXCT','FM_KIDS','FHCDVCT','FNMEDCT','FREMEMCT',
                   'FHSTATG','FLAADLCT','FPENSCT','FOWBENCT','FINCOTCT',
                   'FHIPRVCT','FHICHPCT','FHIIHSCT',
                   'FHOSP2CT','FWALKCT','FHSTATVG','FTANFCT',
                   'FCHSPCT','FHICADCT','FHIOGVCT')]

#check for correlation
cor.famnum = cor(famnum)
cor.famnum
corrplot(cor.famnum, method = "ellipse")
corrplot(cor.famnum, method = "number")








#split data set to training and test
set.seed(314)
split <- sample.split(famreg$FHICOST, SplitRatio = 0.80)
fam_train = subset(famreg, split == TRUE)
fam_test = subset(famreg, split == FALSE)
head(fam_train)
dim(fam_train)
dim(fam_test)


#check for missing
#missmap(fam_train, main = "Missing values vs observed")

#check for categorical status
is.factor(fam_train$FHICOST)




#####################
#automatic logistic regression model, forward selection on test


model.null = glm(FHICOST ~ 1, data=fam_train, family = binomial(link="logit"))

model.full = glm(FHICOST ~ ., data=fam_train, family = binomial(link="logit"))

#step(model.null, scope = list(upper=model.full), direction="forward", test="Chisq", data=fam_train)



#result of above 
#56 variables
model6 <- glm(formula = FHICOST ~ FHIPRVCT + FMEDBPAY_2 + HOUSEOWN_2 + 
                F10DVYN_2 + FINTR1CT + INCGRP4_5 + FMEDBILL_2 + FSNAP_2 + 
                FM_TYPE_2 + FHCDVCT + FHICADCT + INCGRP4_4 + INCGRP5_2 + 
                FDMEDYN_2 + FHICARCT + FSEINCYN_2 + FSAF_2 + FHOSP2YN_2 + 
                FSRUNOUT_3 + FHIIHSCT + FDIVDYN_2 + FSSICT + FANYLYN_2 + 
                FHIMILCT + FM_TYPE_4 + INCGRP4_2 + CURWRKN_2 + FHSTATEX + 
                FM_KIDS + FHCPHRYN_2 + FM_STRP_42 + HOUSEOWN_3 + FHSTATFR + 
                FSBALANC_3 + FM_STRCP_21 + FINTR1YN_2 + F10DVCT + FTANFCT + 
                TELCELN_2 + FM_STRCP_12 + FLNGINTV_4 + FHSTATPR + FLIADLCT + 
                FM_TYPE_3 + FREMEMCT + FHCHMYN_2 + FM_STRCP_23 + FHIEXCT + 
                FHIOGVCT + FDIVDCT + FWKLIMYN_2 + FWKLIMCT + FLIADLYN_2, 
              family = binomial(link = "logit"), data = fam_train)


summary(model6) #not all variable under 0.05
vif(model6) #vif under 5


anova(model6,test="Chisq")


famfit <- predict(model6, type = 'response')


#confusion matrix
table(fam_train$FHICOST, famfit > 0.5)

prop.table(table(fam_train$FHICOST, famfit > 0.5))


tp = 8304
tn = 7193
fp = 3033
fn = 2654

sensitivity = tp/(tp+fn)
sensitivity
accuracy = (tp+tn)/(tp+tn+fp+fn)
accuracy
precision = tp/(tp+fp)
precision
specificity = tn/(tn+fp)
specificity





# model is too complicated, too many variables

#End of automatic model selection forward on test
##################################################




######################################################
#logistic regression model - manual variable selection

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


model5 <- glm (FHICOST ~ ., data = fam_test2, family = binomial)
summary(model5) #not all variable under 0.05
vif(model5) #vif under 5


anova(model5,test="Chisq")


pR2(model5)


famfit <- predict(model5, type = 'response')


#confusion matrix
table(fam_test2$FHICOST, famfit > 0.5)

prop.table(table(fam_test2$FHICOST, famfit > 0.5))


tp = 2051
tn = 1729
fp = 828
fn = 689

sensitivity = tp/(tp+fn)
sensitivity
accuracy = (tp+tn)/(tp+tn+fp+fn)
accuracy
precision = tp/(tp+fp)
precision
specificity = tn/(tn+fp)
specificity



ROCRpred <- prediction(famfit, fam_test2$FHICOST)
ROCRperf <- performance(ROCRpred, 'tpr','fpr')
plot(ROCRperf, colorize = TRUE, text.adj = c(-0.2,1.7))

# AUC- the probability that the model will rank a randomly chosen positive example
#higher than a randomly chosen negative example
auc <- performance(ROCRpred, measure = "auc")
auc <- auc@y.values[[1]]
auc

#the end
############################################
