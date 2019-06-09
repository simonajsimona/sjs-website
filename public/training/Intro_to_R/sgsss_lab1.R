#SGSSS SUMMER SCHOOL
#GENTLE INTRODUCTION TO R
#11.06.2019
#LAB 1. BASICS
#SIMONA SIMONA
#=================================================================================
# SESSION 1: INTRODUCTION TO STATISTICAL PROGRAMMING
#=================================================================================

# Table of Contents
#======================================
  ## Comments
  ## Arithmetic in R
  ## Objects and assignment operators
  ## Vectors basics
  ## Functions and arguments
  ## Data frames
  ## R Packages



#==============
#Comments
#==============

# The first thing we need to know is how to create comments in R

# Comments are very important because they remind us the purpose of our code

# In R we use the hash # key for comments. Everything you write after the hash
# key will be treated as a comment and R will not evaluate it
# Comment above the code when your comment is longer and to the right of the code when the comment is shorter
# If the comment is above the cose, leave space before the code

# To run an R code, you should click anywhere on the code line and click the run button. You can also use Ctrl + Enter
# To run a group of code at the same time, you can highlight them and click the run button

#===================================================================================
# Arithmetic in R
#===================================================================================

# Works works like any calculater
30+16 
30-16
32/16
3*16
2^3
15/3^2
(30+16*(20-6))^2
#===================================================================================
# Objects and Assignment Operators
#===================================================================================
#Our arithmetic so far were not saved in R memory. Once we close R that will be the end
# To store data in R memory, we need to use the assignment operator to put data into an object
# We can store a variety of data types including numeric and characters

# Ojects are containers

#Once we put data in an object, it will appear in the Global environment pane. 
#Notice that there is currently nothing showing there

# "<-" is an asignment operator

x <- 5           # assign the number 5 to an object x
x                # call or evaluate x
y <- 5*3         # assign arithmetic to y
y                # evaluate y
z <- "Foster"    # assign a character Foster to z. Character in parentheses
z                # evaluate z

x + 3            # increamenting an object
x / f            # Arithmetic on objects

Y                ## Warning:  R is case sensitive

# Style
#=========================
y =  23  # Bad code
y <- 23  # Good code, more popular and intuitive

# Leave some space in your code

x<-23   # Bad code
x <- 23 # Good code

# Object naming conventions
# When the name of the object is not a letter, there are many conventions you could use. All lower case and underscore are common. But whatever you choose, be consistent
summerschool <- 40      # all lower case
summer_school <- 40     # under_score seperator
summer.school <- 40     # period seperator
summerSchool <- 40      # lower camel case
SummerSchool <- 40      # upper camel case


summer-school <- 40     # It doesn't work
124 <- 40               # Nope, numbers don't work as objects

# short cut for the assignment <- operator. Use Alt + "-" on your key board

###################################
#EXERCISE 1
###################################
#1. Assign one number to an object
#2. Assign your name to an object
#3. Calculate th value of y in the following regression equation
    
    #b <- 2.55
    #x <- 12.62
    #e <- 1.32
    #y <- b*x + e
    #y
#==================================================================================
# Vectors Basics
#==================================================================================

# Array of elements of the same basic type
# Building blocks for more complex data structures
# We use the c function to combine or concatinate the vector elements

a <- c(1, 2, 3, 4, 5) # vector of numeric values
a
b <- c("January", "February", "March", "April", "May") # vector of character values
b
c <- c("TRUE", "FALSE", "FALSE", "TRUE", "FALSE") # vector of logical values
c

# If you want to create a vector containing a sequance of numbers, you use the : operator

d <- 11:15   #no need for the c function
d

#If we Apply a maths operation to a vector, it will apply to all elements
a-2
c*3
c*d

# indexing vectors
#=======================

vector_values <- LETTERS    # creates an object with the letters of the alphabet
length(vector_values)       # gives you the length of a vector. How many elements it has basically

vector_values[6]         # picking letter number 6
vector_values[10:19]     # i want letters from 10 to 19
vector_values[ -c(10:19)] # i want letters 10 to 19 removed from this vector


#====================================================================================
# Functions and arguments
#====================================================================================
# Functions are objects which perform specific tasks and arguments control what functions do
# Functions always have open and closed brackets
# We put our arguments inside the brackets

seq(2, 10)    #seq() is a sequence function, 2,10 are arguments telling the function to start from 2 and end on 10.
seq(2, 10, 2) # the 2 says only include even numbers or multiples of 2

rep(3, 6) # replicate function. Arguments are saying 3, 6 times

# Being an expert in R is basically about knowing functions and what they can do for you

# If you want to know what a particular function does, you can seek help in R about the function and the arguments it has
# We use help for this, which is a question mark that we put before the function in question
# The function here doesn't have to have open and closed brackets at the end

?seq
?mean

################################################################################
#=============================================================================== 
# Data frames
#===============================================================================

# They are a special object. Basically a dataset

# Usually 2 dimensional matrix with rows and columns
# Rows are observations and columns are variables
# R can handle several of them at one point
# We can create some by combining vectors and using the data.frame() function. Note that vectors same lengths

data <- data.frame(a,b,c,d) #data is name of our dataset
View(data) # opens a spread sheet

#==============================================================================
#Saving our data frame and reading it into R
#==============================================================================

#saving (exporting) your data

write.csv(data, "data.csv") # Look for it on your computer

#reading your csv data frame

data1 <- read.csv(file.choose())# In a pop up window, navigate to where your data is
#The new data1 will have 5 variables because R creates an additional columns for serial numbers. 

#You can ignore this for now

View(data1) # to see the spread sheet of your data. You can also simply click on the data in the Global environment pane
dim(data1) # shows how many rows and columns it has

#=====================================================================================
# Remove objects from the Global environment
#=====================================================================================

# rm() is the function we use. Just specify which object as an argument
rm(a) # to remove the object "a"
rm("b","c","d","f","data1")# to remove a number of objects
rm(list = ls())# to remove all the objects in the Global environment. [You may want to be sure before you run this code because the environment will be cleared]

#==============================================================================
# R Packages and Installing them on our Computer
#==============================================================================

# They are what makes R special
# Download them from CRAN (Comprehensive R Archive Network)
# Install using the install.packages() function
# We shall start by installing the foreign packages which helps us read in different formats of data

install.packages("foreign")

# Sometimes it will bring a pop up which tells you to specify the CRAN mirror: R repository basically
# In which case you will select the location closest to you as we did when we were downloading the program

# The package name should always be in parentheses

# Check in the Packages tab to see it is there

library(foreign) # to load the package in our session. No parentheses here
#or
require(foreign)


#############################################
# EXERCISE 2
#############################################

#1. Create a vector containing the seven days of the week
#2. Write a code which picks the 4th day of the week
#3. Replicate the data frame named data 4 times and name the new data frames differently 
#4. Install a package called car from cran
#5. Load the package you have created at 5
#6. Check if your package in appearing in the Packages tab

#####################################################################################

#NEXT: Data analysis 
