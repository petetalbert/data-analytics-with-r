
# Load packages -----------------------------------------------------------
library(tidyverse)

# Let's load in the data! ------------------------------------------------
office_ratings <- read_csv("data/office_ratings.csv")

# Let's use the count() function! -----------------------------------------------
# The easiest group summary is just by using the count() function which returns the number of rows and
# has the option of supplying columns to group by.
# 1) JUST COUNT THE TOTAL NUMBER OF ROWS.
count(office_ratings)

# 2) NOW COUNT THE NUMBER OF ROWS BY season.
count(office_ratings, season)

# Remember: many functions have optional arguments. You can have count sort the rows from highest to lowest with sort = TRUE.
# 3) COUNT THE NUMBER OF ROWS BY imdb_rating AND SORT HIGHEST TO LOWEST. WHAT'S THE MOST COMMON RATING?
count(office_ratings, imdb_rating, sort = TRUE)
# 8.2 was the most common imdb_rating with 23 episodes.


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
office_ratings_grouped <- group_by(office_ratings, season)

# 5) NOW SUMMARIZE THE DATA BY GETTING THE AVERAGE imdb_rating FOR EACH SEASON
summarize(office_ratings_grouped, avg_total_votes = mean(total_votes))

# 6) ADD ANOTHER COLUMN TO THE SUMMARIZED DATA THAT SUPPLIES THE NUMBER OF ROWS ALONGSIDE THE avg_total_votes.
summarize(office_ratings_grouped, avg_total_votes = mean(total_votes), n_episodes = n())

# 7) CREATE A SUMMARY THAT GIVES BOTH THE AVERAGE total_votes AND AVERAGE imdb_rating BY season. 
summarize(office_ratings_grouped, avg_total_votes = mean(total_votes), avg_imdb_rating = mean(imdb_rating))

# 8) WHICH SEASON HAD THE HIGHEST AVERAGE total_votes AND HIGHEST AVERAGE imdb_rating? HOW COULD YOU USE
# arrange() TO DETERMINE THAT?

# Need to first save off the summarized data.
office_ratings_summary <- summarize(office_ratings_grouped, avg_total_votes = mean(total_votes), avg_imdb_rating = mean(imdb_rating))

# season 1 had highest avg_total_votes
arrange(office_ratings_summary, desc(avg_total_votes))
# season 4 had highest avg_imdb_rating
arrange(office_ratings_summary, desc(avg_imdb_rating))
