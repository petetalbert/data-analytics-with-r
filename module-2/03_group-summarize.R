
# Load packages -----------------------------------------------------------
# In your R scripts, you always want to first load any packages you plan on using. Again, using
# library() basically loads the package so you can use the functions it contains.

library(tidyverse)


# Let's load in some data! ------------------------------------------------
# To work with data in R, we need it in a spreadsheet-like format. In R, this is called a data frame. The function
# read_csv() takes a .csv file (essentially a spreadsheet data file) loads it into our environment as
# a data.frame.

office_ratings <- read_csv("office_ratings.csv")


# Let's group and summarize! -----------------------------------------------

# easiest group summary is just a count.
count(office_ratings, season)

# Remember: many functions have optional arguments. You can have count sort the rows from greatest to least with sort = TRUE.
count(office_ratings, season, sort = TRUE)

office_ratings_grouped <- group_by(office_ratings, season)

summarize(office_ratings_grouped, avg_total_votes = mean(total_votes))
