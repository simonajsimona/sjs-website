##############################################################################################
#SGSSS SUMMER SCHOOL
#DATA MANIPULATION WITH R
#11.06.2019
#SIMONA SIMONA

#============================================
# SESSION 1: DATA MANIPULATION - BASICS
#============================================

#==============================================================================================
# Working directory
#==============================================================================================

# A folder on our computer containg the R files. They could have other files too. For this session, we shall use the Data_manip folder
# An R session always has a working directory
# We need to know it and then change it if necessary

getwd() # shows us the path to the working directory for our R session

# We need to make Data_manip folder our working directory
setwd("C:/Users/simona/Documents/Data_manip") # we change to our folder accordingly

# The path will be different, just change it accordingly

# You can also do this by using the session menu----> Set Working Directory----> Choose Directory

#=============================================================================================
# Reading in data
#=============================================================================================

# We are going to start by using the titanic dataset

titanic <- read.csv("titanic.csv")

# titanic <- read.csv(file.choose()) # you can use this if the code above gives you problems

#============================================================================================
# Examining the dataset
#============================================================================================

dim(titanic) # rows and columns

names(titanic) # variable names

View(titanic) # view data in a spreadsheet 

fix(titanic) # edit the data by hand but you may not want to do this

str(titanic) # structure of the data

head(titanic) # first 6 rows

tail(titnic) # last 6 rows

#============================================================================================
# Indexing datasets
#============================================================================================

# titanic[x,y] # x= rows, y= columns or observations and variables

titanic[3,5] # element at row 3 and column 4

titanic1 <- titanic[, c(3,6,7)] # Gets columns 3,6,7 and all rows

titanic1 <- titanic[, c("name","sibsp","parch")] # does the same thing as above but uses actual variable names

titanic1 <- titanic[,-c(1,2,4,8:14)] # does the same thing by elimination method this time

titanic1[1:10, ] # get rows 1 to 10 from our new dataset

####################
# Exercise 1
####################

#1. Create a new dataset and name it titanic2. It should have all titanic data rows but only with columns 1,2,4,5 and 9
#2. Create another dataset, name it whatever you want. It should contain the first 200 observations and the first 5 variables
#3. Run the following codes. Find whats wrong with them and fix it
     nameSake <- titanic[, c(1,2,5,6] # I want to get columns 1,2,5 and 6 from the titanic dataset
     nameSake2 <- titanic[1:50] # I am trying to get the first 50 rows
     nameSake3 <- titanc[,-c1,2,5,7,9] # I want to create a dataset without variables 1,2,5,7,9

#============================================================================================
# Variable inspection
#============================================================================================

# We are now using our titanic2 dataset we created during the exercise
     
titanic2 <- titanic[, c(1,2,4,5,9)] # do this if we didnt create it during the exercise
     
names(titanic2) # check the variable names

head(titanic2)

#======================================
# Checking and changing variable types
#======================================

# Our data shows that 3 variables are categorical (pclass, survived and sex). In R categorical data types are called factors
# 2 variables are  continuous (age and fare). Continuous data types are numeric
# We use the class() to check the data types of variables
# Other data types are integers
# We always specify the name of the data first and then dollar sign to get a specific variable 

class(titanic2$pclass)
titanic2$pclass <- as.factor(titanic2$pclass) # change from integer into factor

class(titanic2$survived)
titanic2$survived <- as.factor(titanic2$survived) # change to factor

class(titanic2$sex) # no need to change 

class(titanic2$age) # no need to change

class(titanic2$fare) # we don't this one either

#========================================
# Changing variable names
#========================================

names(titanic2)
# want to change sex to gender, use the following code

names(titanic2)[3] <- "gender" # indexing method. 3 because sex is variable number 3
names(titanic2)[names(titanic2)=="sex"] <- "gender"

# using the dplyr package. Don't run this code if the code above worked well

install.packages("dplyr")
library(dplyr)

titanic2 <- titanic2 %>% rename(gender = sex) # uses the deplyr package


#=============================================================================================
#  Recoding variable
#=============================================================================================

table(titanic2$pclass)

# We may want to label the variable differently e.g 1st class, 2nd class. 3rd class

levels(titanic2$pclass) <- c("1st class","2nd class","3rd class") # this will not work if the variable is not a factor

table(titanic2$pclass) # check the variable again

#levels(titanic2$pclass) <- c(1,2,3) # reverse transformation

# We want to do the same with the survived variable. We change it to survive or not survive
table(titanic2$survived)

levels(titanic2$survived) <- c("not survive","survive")
#========================================================================
# Using the car package to collapse variables and creating new variables
#========================================================================

titanic2$agecat <- cut(titanic2$age, 4) # Cut the age variable into 4 roughly equal catories
table(titanic2$age)
titanic2$agecat2 <- cut(titanic2$age, breaks = c(0,15,35,65,80)) # supply the cut-points
table(titanic2$agecat2)

titanic2$agecat3 <- cut(titanic2$age, breaks = c(0,15,35,65,80), labels = c("child","young","adult","elderly"))
table(titanic2$agecat3)

install.packages("car")
library(car)

titanic2$agecat4 <- recode(titanic2$age,"0:15=0;16:35=1;36:65=2;66:80=3")
table(titanic2$agecat4)
titanic2$agecat4 <- recode(titanic2$agecat4,"0='child';1='young';2='adult';3='elderly'")
table(titanic2$agecat4)
#=============================================================================================
# Saving data
#=============================================================================================

# We need to save the clean dataset we have just created.
# Before saving, make sure this R session is pointed to your desired working directory
getwd() # check where your working directory is

write.csv(titanic2, file = "titanic_data.csv") # save data in a csv format

save(titanic2, file ="titanic.Rda") # save an Rda format

#########################################################################


