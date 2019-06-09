#SGSSS SUMMER SCHOOL
#GENTLE INTRODUCTION TO R
#11.06.2019
#LAB 1. BASICS
#SIMONA SIMONA
#=================================================================================
# SESSION 2: Basic Data Analysis
#=================================================================================

# Table of Contents
#======================================
## The working directory
## Reading data into R
## Inspecting data
## A bit of indexing of data frames
## Univariate descriptive statistics
## Bivarite analysis
## Multiple regression
## Logistic regression


#==============================================================================================
# Working Directory
#==============================================================================================

# A folder on our computer containg the R files. They could have other files too
# An R session always has a working directory
# We need to know which one it is and then change it if necessary

getwd() # shows us the path to the working directory for our current R session

# We shall be using the Into_to_R folder in this workshop and so we need to make it our working directory
setwd("~/Courses/Intro_to_R/lmicdata.csv") # we change to our folder accordingly

# It should certainly be different on your computer. Just follow its path

# You can alternatively using the session menu ----> Set Working directory ----> Choose working directory

#============================================================================================
# Reading in data
#============================================================================================

# Data is most of the time read in form of data frame
# We are going to use the low and middle-country data (lmicdata.csv) and we use the following code
# Note: the code will not work 

lmic <- read.csv("lmicdata.csv")
?read.csv
#============================================================================================
# Inspecting the data
#============================================================================================

names(lmic)  # gives you the names of all the variables
dim(lmic)    # dimensions
str(lmic)    # basic structure of the data frame
head(lmic)   # first 6 rows
tail(lmic)   # last 6 rows

#====================================
# A bit of Indexing data frames
#====================================

lmic # two dimensional with rows and columns

# lmic[x,y] # x= rows, y= columns

lmic[3,5] # element at row 3 and column 4

lmic[, c(2,3,4)] # get columns 2,3,4 and all rows

lmic[c(1:10), ] # get rows 1 to 10

# We can use the same code with the actual columns names

lmic[, c("cmortality", "lifeexp", "lifeexpf")]

lmic[, -c(1,7)] # remove column 1 and 7

# The dollar sign picks the variable

# It is used to extract a variable from an R data frame

lmic$year # gets the year column from the data frame
lmic$cmortality # gets the child mortality variable from the data frame

#################################
# EXERCISE 1
#################################

#1. Read in the titanic data from your working directory and name it "titanic"
#2. Check the mames of the variables in the dataset
#2. How many rows and columns does the dataset have
#3. Get the first 3 columns of the dataset
#4. Create a new dataset containing all the columns of the dataset and the first 100 rows

#============================================================================================
# Univariate Descriptive statistics
#============================================================================================

# We use them to summerise our data before analysis. We basically have the mean, median and mode
#The mean is the arithmetic average og our variable
#The mean is middle value of the value of the variable when is is arranged in order
#The mode is the most occuring category of the variable
#The mean and median are easy to get, you use their names as functions 

mean(lmic$cmortality)
median(lmic$cmortality)

# If there are missing values, R will coerce them into "NAs". To remove them, we use an argument na.rm=T
# To see how to do that look at the help command
?mean
mean(lmic$lifeexpm, na.rm=T)

# na.rm=T can be used also for many other functions, such as for the standard deviation

# To get multiple descriptive statistics all at once

summary(lmic$gdp)
summary(lmic$lifeexpm)

# Mode can only be calculated from categorical data

table(titanic$pclass) # the mode is 3rd class, meaning there were more people in the third class
plot <- table(titanic$pclass) # use the graph to check the mode
barplot(plot)
barplot(plot, col = "red")

install.packages("ggplot2")
# Do you want to install from a source package which need compilation. You can say yes if this question pops up

install.packages("devtools")
devtools::install_github("tidyverse/ggplot2")

library(ggplot2)

ggplot(data = titanic)+
  geom_bar(mapping = aes(x= factor(sex)))

#=======================================================================================
# Bivariate analysis
#=======================================================================================

# Cross tables
# Associations between 2 categorical variables

table(titanic$pclass, titanic$survived)
table(titanic$pclass, titanic$survived)

table <- table(titanic$pclass, titanic$survived)
barplot(table)

#ggplot2

ggplot(data = titanic)+
  geom_bar(mapping = aes(x= factor(pclass), fill= factor(survived)))

#Chi-square test
chisq.test(titanic$pclass, titanic$survived)
chisq.test(titanic$sex, titanic$survived)


?chisq.test

#===========================================================================================
# Correlation
#===========================================================================================

# Measure of association between two continuous variables
# Doesnt mean causation
# Tells us how two variables (x and y) move together==linearity

cor(lmic$gdp, lmic$cmortality)
cor.test(lmic$gdp, lmic$cmortality)

plot(lmic$gdp, lmic$cmortality)
abline(lm(lmic$cmortality~lmic$gdp), col="red")

#ggplot2
devdata <- read.csv("devdata.csv")

ggplot(devdata, aes(x= gdp, y= cmortality))+
  geom_point()+
  geom_smooth(method = "lm")

# Ploting with countries

ggplot(devdata, aes(x= gdp, y= cmortality, label = country))+
  geom_text(check_overlap = TRUE)+
  geom_smooth(method = "lm")

#=================================================================================================
# Bivariate regression
#=================================================================================================

#Suppose we want to know whether x affects y, and not simply whether they are related (correlation);

# Regression, generally, allows us to simultaneously test the
# direction, strength, and statistical significance of a relationship

model.1 <- lm(cmortality ~ gdp, data = devdata)
summary(model.1)

#=================================================================================================
# Multiple regression
#=================================================================================================
#Rarely does one variable explain everything
#It allows us to simultaneously examine the effect of multiple
#predictor variables on an outcome variable and build models

summary(model.1 <- lm(cmortality ~ gdp + hexp + immun, data= devdata))

#=================================================================================================
# Logistic regression
#=================================================================================================

model1 <- glm(survived ~ pclass + sex + age + fare, family = binomial, data = titanic)
summary(model1)





