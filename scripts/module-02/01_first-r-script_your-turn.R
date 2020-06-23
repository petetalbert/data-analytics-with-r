# Load packages -----------------------------------------------------------
# In your R scripts, you always want to first load any packages you plan on using. Again, using
# library() loads the package so you can use the functions it contains. If you haven't already installed the tidyverse,
# it is commented out below.
# install.packages("tidyverse")
# 1) LOAD THE TIDYVERSE
library(___)


# Let's load in the data! ------------------------------------------------
# To work with data in R, we need it in a spreadsheet-like format. In R, this is called a data frame. The function
# read_csv() takes a .csv file (essentially a spreadsheet data file) loads it into our environment as
# a data.frame.
# 2) IMPORT office_ratings.csv AND ASSIGN IT THE OBJECT NAME office_ratings.
___ <- read_csv("data/___.csv")


# We can print by just running the object name.
# 3) JUST TYPE OUT office_ratings BELOW AND VERIFY THAT IT PRINTS TO THE CONSOLE.


# Let's print the data! ------------------------------------------------
# We can view our data in the Viewer by clicking on the object in our Global Environment (top-right pane), or by using the View() function

# 4) USE THE View() FUNCTION TO VIEW office_ratings.

View(___)