
*Michal Chowaniak Project model B;

/* PLEASE READ THIS FIRST BEFORE EXECUTING THIS FILE

There are two data files needed to execute this SAS file.

1. Michal_Chowaniak_project_dataset.csv
2. Michal_Chowaniak_project_dataset_predictions.csv

There are two infile statements which have to be updated if this SAS file is executed in differEnt folder than below.

1. First infile statement is on line 20
2. Second infile statement is on line 232

*/

*import data set;
data youngpeople;
infile "S:\CSC423\Project\Michal_Chowaniak_project_dataset.csv" firstobs=2 delimiter=',' missover;
input finances shopping clothing entertainment looks gadgets eating age height weight siblings gender $ l_r_handed $ education $ only_child $ village_town $ house_apt $;
run;

title "young people dataset";
proc print;
run;

*Create boxplot for finances  by age;
TITLE "Boxplots - finance by age";
PROC SORT; 
BY finances; 
RUN; 
PROC BOXPLOT;
PLOT age*finances ;
RUN;

*collapse variables to 0-no, 1=yes variable;
data youngpeople;
set youngpeople;

*I save all the money I can: 0-no, 1-yes;
if finances = 1 then b_fin = 0;
if finances = 2 then b_fin = 0;
if finances = 3 then b_fin = 0;
if finances = 4 then b_fin = 1;
if finances = 5 then b_fin = 1;

*I enjoy going to large shopping centres: 0 no, 1 yes;
if shopping = 1 then b_shop = 0;
if shopping = 2 then b_shop = 0;
if shopping = 3 then b_shop = 0;
if shopping = 4 then b_shop = 1;
if shopping = 5 then b_shop = 1;

*I prefer branded clothing to non branded: 0-no, 1-yes;
if clothing = 1 then b_clo = 0;
if clothing = 2 then b_clo = 0;
if clothing = 3 then b_clo = 0;
if clothing = 4 then b_clo = 1;
if clothing = 5 then b_clo = 1;

*I spend a lot of money on partying and socializing: 0-no, 1-yes;
if entertainment = 1 then b_ent = 0;
if entertainment = 2 then b_ent = 0;
if entertainment = 3 then b_ent = 0;
if entertainment = 4 then b_ent = 1;
if entertainment = 5 then b_ent = 1;

*I spend a lot of money on my appearance: 0-no, 1-yes;
if looks = 1 then b_look = 0;
if looks = 2 then b_look = 0;
if looks = 3 then b_look = 0;
if looks = 4 then b_look = 1;
if looks = 5 then b_look = 1;

*I spend a lot of money on gadgets: 0-no, 1-yes;
if gadgets = 1 then b_gadg = 0;
if gadgets = 2 then b_gadg = 0;
if gadgets = 3 then b_gadg = 0;
if gadgets = 4 then b_gadg = 1;
if gadgets = 5 then b_gadg = 1;

*I will hapilly pay more money for good, quality or healthy food: 0-no, 1-yes;
if eating = 1 then b_eat = 0;
if eating = 2 then b_eat = 0;
if eating = 3 then b_eat = 0;
if eating = 4 then b_eat = 1;
if eating = 5 then b_eat = 1;

*Gender: 0-female, 1-male;
if gender = 'female' then b_gender = 0;
if gender = 'male' then b_gender = 1;

*I am: Left handed - Right handed: 0-left, 1-right;
if l_r_handed = 'left han' then b_hand = 0;
if l_r_handed = 'right ha' then b_hand = 1;

*Highest education achieved: Currently a Primary school pupil, Primary school, Secondary school, College/Bachelor degree, masters degree, doctorate degree;
* bachelor and below 0 , above bachelor = 1;
if education = 'secondar' then b_edu = 0;
if education = 'college/' then b_edu = 0;
if education = 'primary' then b_edu = 0;
if education = 'currentl' then b_edu = 0;
if education = 'doctorat' then b_edu = 1;
if education = 'masters' then b_edu = 1;

*I am the only child: : 0-no, 1-yes;
if only_child = 'no' then b_child = 0;
if only_child = 'yes' then b_child = 1;

*I spent most of my childhood in a: City - 0, village - 1;
if village_town = 'city' then b_town = 0;
if village_town = 'village' then b_town = 1;

*I lived most of my childhood in a: house/bungalow - 1, block of flats - 0;
if house_apt = 'block of' then b_house = 0;
if house_apt = 'house/bu' then b_house = 1;

title "young people dataset";
proc print;
run;

*Create boxplot for finances  by age;
TITLE "Boxplots - finance by age";
PROC SORT; 
BY b_fin; 
RUN; 
PROC BOXPLOT;
PLOT age*b_fin ;
RUN;

*Create frequency tables for y variable;
title "Frequency";
proc freq;
tables b_fin;
run;

*Check - Multicollinearity, outliers and influencial points;
title Multicollinearity, outliers and influencial points;
proc logistic;
model b_fin ( event='1') = b_shop b_clo b_ent b_look b_gadg b_eat b_gender b_hand b_edu b_child b_town b_house age height weight siblings weight*height/ corrb influence iplots;
run;

*Remove height, correclation over 0.9;
data youngpeople;
set youngpeople;
drop height;
drop weight*height;
 
*Check - Multicollinearity, outliers and influencial points;
title Multicollinearity, outliers and influencial points;
proc logistic;
model b_fin ( event='1') = b_shop b_clo b_ent b_look b_gadg b_eat b_gender b_hand b_edu b_child b_town b_house age weight siblings / corrb influence iplots stb;
run;

*no outliers;

*some ifluetial points - keep them;

*full model;
/* Log( b_fin = 1/ b_fin =0 ) = -0.3163 + 0.0127*b_shop + 0.1247*b_clo – 0.5820*b_ent – 0.5332*b_look + 
0.0937*b_gadg + 0.3124*b_eat + 0.0454*b_gender – 0.1129*b_hand + 0.00638*b_edu + 0.1186*b_child + 
0.4420*b_town – 0.0106*b_house + 0.0332*age – 0.0126* weight – 0.0541*siblings
*/

*Split data into training and test sets;
title "Training and Test sets";
proc surveyselect data=youngpeople out=youngpeople_train8020 seed=831957
samprate=0.7 outall;
run;

proc print data=youngpeople_train8020;
run;

* check to see if the train/test split was done correctly;
title "Training and Test sets frequency";
proc freq data=youngpeople_train8020;
tables selected;
run;

*create new y variable  for training set, and = NA for testing set;
data youngpeople_train8020;
set youngpeople_train8020;
*if selected is equal to 1 then;
if selected = 1 then b_fin_train = b_fin; *y variable for training data set;
run;

title "Training set";
proc print;
run;

* run selection backward method on training set;
title Training set model selection - Backward;
proc logistic data=youngpeople_train8020; 
model b_fin_train (event='1')= b_shop b_clo b_ent b_look b_gadg b_eat b_gender b_hand b_edu b_child b_town b_house age weight siblings /
  selection=backward rsquare;
run;

* run selection stepwise method on training set;
title Training set model selection - Stepwise;
proc logistic data=youngpeople_train8020; 
model b_fin_train (event='1')= b_shop b_clo b_ent b_look b_gadg b_eat b_gender b_hand b_edu b_child b_town b_house age weight siblings /
  selection=stepwise rsquare;
run;

*Final Model;
*Log(p/(1-p) = -0.5925 – 0.5726*b_ent – 0.6075*b_look + 0.4138*b_eat + 0.4318*b_town;

*Double Check - Multicollinearity, outliers and influencial points - final model;
title Multicollinearity, outliers and influencial points;
proc logistic data=youngpeople_train8020; ;
model b_fin_train ( event='1') = b_ent b_look b_eat b_town / corrb influence iplots stb;
run;

/*
**************I WAS UNABLE TO USE DATALINES TO INPUT DATA WITH A SPACE BETWEEN, SO I DECIDED TO INPORT DATA FROM A FILE**************

*Compute predictions for a person who  spends money on entertainment					;
data new;
input finances shopping clothing entertainment looks gadgets eating age height weight siblings gender $ l_r_handed $ 8 education $ 8 only_child $ village_town $ 8 house_apt $ 8;
datalines;
. 4 4 5 4 2 4 20 150 59 2 male right ha college/ no	village	block of
;
proc print data=new;
run;
*/

**************I WAS UNABLE TO USE DATALINES TO INPUT DATA WITH A SPACE BETWEEN, SO I DECIDED TO INPORT DATA FROM A FILE**************;
*Compute predictions for a person who  spends money on entertainment
*import data set;
data new;
infile "S:\CSC423\Project\Michal_Chowaniak_project_dataset_predictions.csv" firstobs=2 delimiter=',' missover;
input finances shopping clothing entertainment looks gadgets eating age height weight siblings gender $ l_r_handed $ education $ only_child $ village_town $ house_apt $;
run;

proc print data=new;
run;

*collapse variables to 0-no, 1=yes variable;
data pred;
set new youngpeople;

*I save all the money I can: 0-no, 1-yes;
if finances = 1 then b_fin = 0;
if finances = 2 then b_fin = 0;
if finances = 3 then b_fin = 0;
if finances = 4 then b_fin = 1;
if finances = 5 then b_fin = 1;

*I enjoy going to large shopping centres: 0 no, 1 yes;
if shopping = 1 then b_shop = 0;
if shopping = 2 then b_shop = 0;
if shopping = 3 then b_shop = 0;
if shopping = 4 then b_shop = 1;
if shopping = 5 then b_shop = 1;

*I prefer branded clothing to non branded: 0-no, 1-yes;
if clothing = 1 then b_clo = 0;
if clothing = 2 then b_clo = 0;
if clothing = 3 then b_clo = 0;
if clothing = 4 then b_clo = 1;
if clothing = 5 then b_clo = 1;

*I spend a lot of money on partying and socializing: 0-no, 1-yes;
if entertainment = 1 then b_ent = 0;
if entertainment = 2 then b_ent = 0;
if entertainment = 3 then b_ent = 0;
if entertainment = 4 then b_ent = 1;
if entertainment = 5 then b_ent = 1;

*I spend a lot of money on my appearance: 0-no, 1-yes;
if looks = 1 then b_look = 0;
if looks = 2 then b_look = 0;
if looks = 3 then b_look = 0;
if looks = 4 then b_look = 1;
if looks = 5 then b_look = 1;

*I spend a lot of money on gadgets: 0-no, 1-yes;
if gadgets = 1 then b_gadg = 0;
if gadgets = 2 then b_gadg = 0;
if gadgets = 3 then b_gadg = 0;
if gadgets = 4 then b_gadg = 1;
if gadgets = 5 then b_gadg = 1;

*I will hapilly pay more money for good, quality or healthy food: 0-no, 1-yes;
if eating = 1 then b_eat = 0;
if eating = 2 then b_eat = 0;
if eating = 3 then b_eat = 0;
if eating = 4 then b_eat = 1;
if eating = 5 then b_eat = 1;

*Gender: 0-female, 1-male;
if gender = 'female' then b_gender = 0;
if gender = 'male' then b_gender = 1;

*I am: Left handed - Right handed: 0-left, 1-right;
if l_r_handed = 'left han' then b_hand = 0;
if l_r_handed = 'right ha' then b_hand = 1;

*Highest education achieved: Currently a Primary school pupil, Primary school, Secondary school, College/Bachelor degree, masters degree, doctorate degree;
* bachelor and below 0 , above bachelor = 1;
if education = 'secondar' then b_edu = 0;
if education = 'college/' then b_edu = 0;
if education = 'primary' then b_edu = 0;
if education = 'currentl' then b_edu = 0;
if education = 'doctorat' then b_edu = 1;
if education = 'masters' then b_edu = 1;

*I am the only child: : 0-no, 1-yes;
if only_child = 'no' then b_child = 0;
if only_child = 'yes' then b_child = 1;

*I spent most of my childhood in a: City - 0, village - 1;
if village_town = 'city' then b_town = 0;
if village_town = 'village' then b_town = 1;

*I lived most of my childhood in a: house/bungalow - 1, block of flats - 0;
if house_apt = 'block of' then b_house = 0;
if house_apt = 'house/bu' then b_house = 1;
run;


* logistic regression model;
title "logistic regression model";
proc logistic data=pred; 
model b_fin ( event='1') = b_ent b_look b_eat b_town;
output out=pred p=phat lower=lcl upper=ucl;
run;

*printing predicted probabilities and confidence intervals;
proc print data=pred;
title 'Predicted Probabilities and 95% Confidence Limits';
run;

*Generate classification table and identify cutoff value;
title "Cut off value";
proc logistic data=youngpeople_train8020; ;
model b_fin_train ( event='1') = b_ent b_look b_eat b_town / ctable pprob =(0.1 to 0.6 by 0.05);

*compute predicted probability for test set;
output out=youngpeople_test8020(where=(b_fin_train=.)) p=phat lower = lcl upper =ucl;
run;

*print output table for test set predicted prob.;
title "Output table for test set predicted probability";
proc print data = youngpeople_test8020;
run;

*use cut-off value to compute classification matrics, create new data set for probabilities;
data youngpeople_prob8020;
set youngpeople_test8020;
b_fin_prob = 0;
if (phat > 0.40) then b_fin_prob = 1;
run;

proc print data = youngpeople_prob8020;
run;

*Classification matrix. table observed y b_fin and predicted y b_fin_prob;
title 'observed y and predicted y'; 
proc freq data = youngpeople_prob8020; 
tables b_fin * b_fin_prob / norow nocol nopercent;
run;
