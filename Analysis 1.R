# James Machado, Ben Maletta, Alice
# Professor Carver
# Analyzing Big Data 2
# Analysis 1: Introduction to Modeling with R and R Studio

library(readr)  # provide additional data-reading functions
library(corrplot) # attractive correlation graphs

setwd("~/Dropbox/BA MBA/Spring 2017/BUS 212F ABD 2/Analyses/wineproject")


# 1) Read the white wine quality data into a tibble. 


# 2) As shown in class, partition the full dataset into a 60% Training 
# set and a 40% Test set using a random number seed that you choose (don’t use 1234).  
# USE JUST THE TRAINING SET for steps 3 through 6.


# 3) Calculate and report means, standard deviation and a 5-number summary 
# (minimum, 1st quartile, median, 3rd quartile, and maximum) for the variables 
# in the Training set. 



# 4) Create a graph that shows the distribution of the final column (our 
# dependent, or target, variable). Show the graph in your report.



# 5) Compute and report correlations among the quantitative variables in 
# the Training set. Comment on the strength of linear relationships among 
# these variables in the Training set.  Include both the correlation values 
# and a plot of the correlations in your report.



# 6) Using the two X variables that are most strongly correlated with wine 
# quality, run a linear regression using wine quality variable as the Y 
# variable in the Training set.



# 7) Run the same regression model (i.e. the same 2 independent predictors) 
# using the Test set data. 



# 8) Write a brief summary comparing the results of the two regressions. 
# Compare the significance and goodness of fit of the model using the Test 
# set data in comparison to the results from the Training set. 



# 9) Repeat steps 1 through 5 for the red wine data. Report the correlations 
# for the red wine. Comment on the extent to which wine quality varies similarly 
# and is related to the same factors for both red and white wine.
