# James Machado, Ben Maletta, Alice
# Professor Carver
# Analyzing Big Data 2
# Analysis 1: Introduction to Modeling with R and R Studio

library(readr)  # provide additional data-reading functions
library(corrplot) # attractive correlation graphs

setwd("~/Dropbox/BA MBA/Spring 2017/BUS 212F ABD 2/Analyses/wineproject")

# 1) Read the white wine quality data into a tibble. 

white_wine_quality <- read_delim("winequality-white.csv", delim = ";")


# 2) As shown in class, partition the full dataset into a 60% Training 
# set and a 40% Test set using a random number seed that you choose (don’t use 1234).  
# USE JUST THE TRAINING SET for steps 3 through 6.

    # As standard practice in model-building with "big data" we first split the large data 
    # frame into two partitions:
    #
    #* a TRAINING set, used to initially develop a model for use
    #* a TEST set, used to validate the model with a new "out of sample" batch of data

#  before using pseudo-random numbers, set a starting point
set.seed(1567)   # initialize the randomm number generator
# "white_rndm_vectors" will be a vectors of randomly generated 1s and 2s. There will be as
# many values as there are rows of data in the myvars df. 60% of the white_rndm_vectors 
# values will equal 1 nad 40% will equal 2.

white_rndm_vectors <- sample(2,nrow(white_wine_quality),replace=TRUE, prob=c(0.6,0.4)) 
head(as.data.frame(white_rndm_vectors), 20) # show first 20 values of ind

white_train <- white_wine_quality[white_rndm_vectors==1,]  # new df "white_train" will 
# consists of randomly 
# chosen rows from white_wine_quality, corresponding to the 1's in white_rndm_vectors.
white_test <- white_wine_quality[white_rndm_vectors==2,]

dim(white_train)
dim(white_test)


# 3) Calculate and report means, standard deviation and a 5-number summary 
# (minimum, 1st quartile, median, 3rd quartile, and maximum) for the variables 
# in the Training set. 

summary(white_train)

# 4) Create a graph that shows the distribution of the final column (our 
# dependent, or target, variable). Show the graph in your report.



###
### DON'T KNOW WHAT THIS MEANS I THINK I DID IT RIGHT THOUGH
###

ww_train_quality <- white_train$quality 
ww_hist <- hist(ww_train_quality, breaks=10, col="red", xlab="Quality Level (0 = Lowest, 10 = Highest)", 
                main="Histogram with Normal Curve of White Wine Quality Levels") 
ww_xfit <- seq(min(ww_train_quality),max(ww_train_quality),length=40) 
ww_yfit<-dnorm(ww_xfit,mean=mean(ww_train_quality),sd=sd(ww_train_quality)) 
ww_yfit <- ww_yfit*diff(ww_hist$mids[1:2])*length(ww_train_quality) 
lines(ww_xfit, ww_yfit, col="blue", lwd=2)




# 5) Compute and report correlations among the quantitative variables in 
# the Training set. Comment on the strength of linear relationships among 
# these variables in the Training set.  Include both the correlation values 
# and a plot of the correlations in your report.

cm_white <- cor(white_train, method="pearson")
cm_white
corrplot(cm_white, method= "ellipse", type="lower" )
# Make sure to comment on the strength of linear relationships among these variables
# in the Training set

# 6) Using the two X variables that are most strongly correlated with wine 
# quality, run a linear regression using wine quality variable as the Y 
# variable in the Training set.

# two most strongly vorrelated variables with white wine quality
#                       density 
#   residual sugar	    0.837961733

wwlm1 <- lm(quality ~ `residual sugar` + density, data = white_train)
summary(wwlm1)


# 7) Run the same regression model (i.e. the same 2 independent predictors) 
# using the Test set data. 

wwlm2 <- lm(quality ~ `residual sugar` + density, data = white_test)
summary(wwlm2)

# 8) Write a brief summary comparing the results of the two regressions. 
# Compare the significance and goodness of fit of the model using the Test 
# set data in comparison to the results from the Training set. 



# 9) Repeat steps 1 through 5 for the red wine data. Report the correlations 
# for the red wine. Comment on the extent to which wine quality varies similarly 
# and is related to the same factors for both red and white wine.


# Read the white wine quality data into a tibble. 

red_wine_quality <- read_delim("winequality-red.csv", delim = ";")


# 2) As shown in class, partition the full dataset into a 60% Training 
# set and a 40% Test set using a random number seed that you choose (don’t use 1234).  
# USE JUST THE TRAINING SET for steps 3 through 6.

# As standard practice in model-building with "big data" we first split the large data 
# frame into two partitions:
#
#* a TRAINING set, used to initially develop a model for use
#* a TEST set, used to validate the model with a new "out of sample" batch of data

#  before using pseudo-random numbers, set a starting point
set.seed(1478)   # initialize the randomm number generator
# "white_rndm_vectors" will be a vectors of randomly generated 1s and 2s. There will be as
# many values as there are rows of data in the myvars df. 60% of the white_rndm_vectors 
# values will equal 1 nad 40% will equal 2.

red_rndm_vectors <- sample(2,nrow(red_wine_quality),replace=TRUE, prob=c(0.6,0.4)) 
head(as.data.frame(red_rndm_vectors), 20) # show first 20 values of ind

red_train <- red_wine_quality[red_rndm_vectors==1,]  # new df "white_train" will 
# consists of randomly 
# chosen rows from white_wine_quality, corresponding to the 1's in white_rndm_vectors.
red_test <- red_wine_quality[red_rndm_vectors==2,]

dim(red_train)
dim(red_test)


# 3) Calculate and report means, standard deviation and a 5-number summary 
# (minimum, 1st quartile, median, 3rd quartile, and maximum) for the variables 
# in the Training set. 

summary(red_train)

# Create a graph that shows the distribution of the final column (our 
# dependent, or target, variable). Show the graph in your report.

###
### DON'T KNOW WHAT THIS MEANS I THINK I DID IT RIGHT THOUGH
###

rw_train_quality <- red_train$quality 
rw_hist <- hist(rw_train_quality, breaks=10, col="red", xlab="Quality Level (0 = Lowest, 10 = Highest)", 
        main="Histogram with Normal Curve of Red Wine Quality Levels") 
rw_xfit <- seq(min(rw_train_quality),max(rw_train_quality),length=40) 
rw_yfit<-dnorm(rw_xfit,mean=mean(rw_train_quality),sd=sd(rw_train_quality)) 
rw_yfit <- rw_yfit*diff(rw_hist$mids[1:2])*length(rw_train_quality) 
lines(rw_xfit, rw_yfit, col="blue", lwd=2)



# Compute and report correlations among the quantitative variables in 
# the Training set. Comment on the strength of linear relationships among 
# these variables in the Training set.  Include both the correlation values 
# and a plot of the correlations in your report.

cm_red <- cor(red_train, method="pearson")
cm_red
corrplot(cm_red, method= "ellipse", type="lower" )
# Make sure to comment on the strength of linear relationships among these variables
# in the Training set


# two most strongly vorrelated variables with white wine quality
#            fixed acidity 
#    pH	      -0.66990663

rwlm1 <- lm(quality ~ `fixed acidity` + pH, data = red_train)
summary(rwlm1)

# Run the same regression model (i.e. the same 2 independent predictors) 
# using the Test set data. 

rwlm2 <- lm(quality ~ `fixed acidity` + pH, data = red_test)
summary(rwlm2)











### STOP HERE FOR NOW ###


# One additional step: use the the original lm2 model to predict values for test set
# then evaluate the accuracy of the  fitted values

fittest <- predict.lm(lm2, newdata=test)
testeval <- as.data.frame(cbind(test$ArrDelay, fittest))
plot(train$ArrDelay, lm2$fitted.values)
plot(test$ArrDelay, fittest, main="LM2 using Test data")

results <-cbind(train$ArrDelay, lm2$fitted.values)
# naive goodness of fit for training data
cm2 <- cor(results, method="pearson")
cm2
corrplot(cm2, method= "ellipse", type="lower" )
#
# naive goodness of fit with training coefficients and test data
cm3 <- cor(testeval, method="pearson")
cm3
corrplot(cm3, method= "ellipse", type="lower" )

