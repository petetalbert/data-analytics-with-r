
# Load packages -----------------------------------------------------------
# In your R scripts, you always want to first load any packages you plan on using. Again, using
# library() basically loads the package so you can use the functions it contains.

library(tidyverse)


# Let's load in some data! ------------------------------------------------
# To work with data in R, we need it in a spreadsheet-like format. In R, this is called a data frame. The function
# read_csv() takes a .csv file (essentially a spreadsheet data file) loads it into our environment as
# a data.frame.

office_ratings <- read_csv("module-02/office_ratings.csv")


# Quick note about functions. ---------------------------------------------

x <- c(2, 5, 8, 9, NA)

mean(x)
mean(x, na.rm = TRUE)


# Let's arrange and filter! -----------------------------------------------

arrange(office_ratings, desc(imdb_rating))

filter(office_ratings, imdb_rating < 7.3)

# we can supply more than one criterion!
filter(office_ratings, imdb_rating < 7.3 & total_votes > 1500)

