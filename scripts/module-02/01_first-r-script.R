
# Load packages -----------------------------------------------------------
# In your R scripts, you always want to first load any packages you plan on using. Again, using
# library() loads the package so you can use the functions it contains. If you haven't already installed the tidyverse,
# it is commented out below.
# install.packages("tidyverse")
library(tidyverse)


# Let's load in some data! ------------------------------------------------
# To work with data in R, we need it in a spreadsheet-like format. In R, this is called a data frame. The function
# read_csv() takes a .csv file (essentially a spreadsheet data file) loads it into our environment as
# a data.frame.

office_ratings <- read_csv("data/office_ratings.csv")

# We can print by just running the object name.
office_ratings


