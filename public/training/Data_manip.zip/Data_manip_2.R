#SGSSS SUMMER SCHOOL
#DATA MANIPULATION WITH R
#11.06.2019
#SIMONA SIMONA

#=======================================
# SESSION 2: SUBSETTING AND MERGING DATA
#=======================================

# Developdata.csv. This is raw data from the world bank website and we shall create a clean dataset
# Including gdp, child mortality and life expectancy values for all developing countries
# The data we want is only for 2016

#==============================================================================================
# Working directory
#==============================================================================================

getwd() # shows us the path to the working directory for our R session

# We need to make Data_manip folder our working directory

setwd("C:/Users/simona/Documents/Data_manip") # we change to our folder accordingly

# The path will be different, just change it accordingly

# Again, you can also do this by using the session menu----> Set Working Directory----> Choose Directory

#==============================================================================================
# Reading in data
#==============================================================================================

dev <- read.csv("Developdata.csv")

# dev <- read.csv(file.choose()) # you can use this if the code above gives you problems

#============================================================================================
# Examining the dataset
#============================================================================================

dim(dev) # rows and columns

names(dev) # variable names

View(dev)

# It looks like we can't deal with the column names the dataset comes with, we shall create our own which

colnames(dev) <- c("country","code","series","series.code","2000","2001","2002","2003","2004","2005","2006",
                   "2007","2008","2009","2010","2011","2012","2013","2014","2015","2016")

View(dev) # much better

# We are looking for GDP per capita, life expectancy at birth total and mortality rate under-5
# We care going to use the series.code to subset the data
# We are making 3 datasets based on each variable of interest

#==========
# gdp
#==========
gdp <- subset(dev, dev$series.code== "NY.GDP.PCAP.CD") # pick only data with this NY.GDP.PCAP.CD series code
View(gdp)

# We are only interested in the data for the year 2016

gdp <- gdp[, c("country","2016")] # indexing. We have gotten the country and 2016 variables
View(gdp)

# See that there is something wrong with row names? You want your serial numbers to increase by 1 uo to 137

rownames(gdp) <- 1:137
names(gdp)[2] <- "gdp" # change the column name from 2016 to gdp

# We do the same for our remaining variables

#================
# life expectancy
#================

lifeexp <- subset(dev, dev$series.code== "SP.DYN.LE00.MA.IN")
lifeexp <- lifeexp[, c("country","2016")]
View(lifeexp)
rownames(lifeexp) <- 1:137
names(lifeexp)[2] <- "lifeexp"

#==================
# child mortality
#==================

cmortality <- subset(dev, dev$series.code== "SH.DYN.MORT")
cmortality <- cmortality[, c("country","2016")]
View(cmortality)
rownames(cmortality) <- 1:137
names(cmortality)[2] <- "cmortality"


#======================================================================
# Merging the data
#======================================================================

dev2 <- merge(gdp,lifeexp, by = "country") # Only allows 2 datasets at a time
dev2 <- merge(dev2,cmortality, by = "country")

# Please note that there is one common variable among all of them to merge by. In this case it is "country"

#=============================
library(dplyr)
dev2 <- right_join(gdp,lifeexp, by = "country") # using the dplyr package. It also only works with 2 datasets at a time
?right_join # to find out more about the function
dev2 <- right_join(dev2, cmortality, by = "country")

##############################
# Exercise
#############################

# Pick current health expenditure from the original dataset and join it to our dev2 dataset
# Save the new data in working diretory

####################
# END              #
####################

