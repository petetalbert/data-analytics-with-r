
# Load packages -----------------------------------------------------------
library(tidyverse)

# Let's load in the data! ------------------------------------------------
office_ratings <- read_csv("data/office_ratings.csv")

# Quick note about functions. ---------------------------------------------
# Often, functions take additional, optional arguments that allow us to get the output we want.
# In R, if any of the values in a list is NA, the function often returns NA. In order to get the sum
# of a list with an NA value in it, we need to supply the optional argement na.rm and set it equal to TRUE.

# set of numbers
x <- c(2, 5, 8, 9, NA)

# 1) RUN THE SUM FUNCTION BELOW WITH THE LIST OF NUMBERS IN THE OBJECT x.
sum(x)

# 2) RUN THE SUM FUNCTION AGAIN, THIS TIME SETTING THE na.rm OPTIONAL ARGUMENT TO TRUE.
sum(x, na.rm = TRUE)

# Let's arrange-----------------------------------------------
# arrange() allows us to sort a data frame by different columns.

# 3) SORT office_ratings BY total_votes HIGHEST TO LOWEST
arrange(office_ratings, desc(total_votes))

# 4) SORT office_ratings BY total_votes HIGHEST TO LOWEST AND THEN BY imdb_rating HIGHEST TO LOWEST
arrange(office_ratings, desc(total_votes), desc(imdb_rating))

# Let's filter! -----------------------------------------------
# filter() allows us to filter down the data frame by different logical operations (an evaluation that
# returns either TRUE or FALSE):
#   Operator  Meaning
### >         greater than
### >=        greater than or equal to
### <         less than
### <=        less than or equal to
### ==        equals
### !=        does not equal

# We can also string together different logical operators with AND and OR statements.
#   Operator  Meaning
### &         and
### |         or

# If we need to make lots of OR statements, it's easiest to use the %in% operator followed by a c() with the different values we want
# For example, filter(office_ratings, epsiode %in% c(24, 27, 30))

# Lastly, we don't have any NA values in the office_ratings dataset but if we did we could filter them by doing the following:
#   Operator  Meaning
### is.na()   missing values
### !is.na()  non-missing values

# 5) FILTER office_ratings WHERE imdb_rating IS GREATER THAN 8.5.
filter(office_ratings, imdb_rating > 8.5)

# 6) FILTER office_ratings WHERE imdb_rating IS GREATER THAN 8.5 AND total_votes IS GREATER THAN OR EQUAL TO 3500.
# we can supply more than one criterion!
filter(office_ratings, imdb_rating > 8.5 & total_votes > 3500)

# 7) FILTER office_ratings WHERE season IS 1, 2, 4, or, 9. HINT, IN THIS INSTANCE, IT'S EASIEST TO USER %in%.
filter(office_ratings, season %in% c(1, 2, 3, 9))

