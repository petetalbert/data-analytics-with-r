
# Load packages -----------------------------------------------------------
library(tidyverse)

# Let's load in the data! ------------------------------------------------
office_ratings <- read_csv("data/office_ratings.csv")

# Let's use the count() function! -----------------------------------------------
# The easiest group summary is just by using the count() function which returns the number of rows and
# has the option of supplying columns to group by.
# 1) JUST COUNT THE TOTAL NUMBER OF ROWS.
count(___)

# 2) NOW COUNT THE NUMBER OF ROWS BY season.
count(___, ___)

# Remember: many functions have optional arguments. You can have count sort the rows from highest to lowest with sort = TRUE.
# 3) COUNT THE NUMBER OF ROWS BY imdb_rating AND SORT HIGHEST TO LOWEST. WHAT'S THE MOST COMMON RATING?
count(___, ___, sort = ___)



# Let's use the group_by() and summarize() function! -----------------------------------------------
# group_by() paired with summarize() allow us to do sophisticated summaries of our data.
# group_by() groups the data into distinct groups; summarize allows to apply any number of aggregate functions to those groups.
# aggregate functions:
#   Aggregate function  Meaning
### sum()               sums the data
### mean()              gets the average
### median()            gets the median
### sd()                gets the standard deviation
### min()               gets the smallest value
### max()               gets the largest value
### n()                 counts or tallies the number of rows

# 4) FIRST GROUP office_ratings BY season and SAVE IT AS AN OBJECT CALLED office_ratings_grouped.
___ <- group_by(office_ratings, ___)

# 5) NOW SUMMARIZE THE DATA BY GETTING THE AVERAGE imdb_rating FOR EACH SEASON
summarize(___, avg_total_votes = mean(___))

# 7) CREATE A SUMMARY THAT GIVES BOTH THE AVERAGE total_votes AND AVERAGE imdb_rating BY season. 
summarize(office_ratings_grouped, avg_total_votes = ___, avg_imdb_rating = ___)

# 8) WHICH SEASON HAD THE HIGHEST AVERAGE total_votes AND HIGHEST AVERAGE imdb_rating? HOW COULD YOU USE
# arrange() TO DETERMINE THAT?