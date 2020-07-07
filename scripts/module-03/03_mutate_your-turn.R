
# Load packages -----------------------------------------------------------
library(tidyverse)

# Let's load in the data! ------------------------------------------------
office_ratings <- read_csv("data/office_ratings.csv")


# Let's get more familiar with the mutate() function! -----------------------------------

# 1) MAKE A NEW COLUMN USING mutate() THAT MAKES THREE BINS OF imdb_rating: "Less than 8," "Between 8 and 9," AND "Greater than 9."
#    SAVE IT AS A NEW OBJECT.
# Instead of using the if_else() function, since there are more than two groups, let's use the case_when() function.
# With case_when(), you right a sequence of two-sided formulas. The left hand side (LHS) determines which values match this case. 
# The right hand side (RHS) provides the replacement value. Each side is separated by a tilde (~).

office_ratings_new <- mutate(office_ratings, imdb_rating_binned = case_when(imdb_rating < ___ ~ "Less than 8",
                                                                            imdb_rating >= ___ & imdb_rating < ___ ~ "Between 8 and 9",
                                                                            imdb_rating >= ___ ~ "Greater than 9"))

# 2) PLOT THE DATA USING geom_bar() WHERE fill IS SET TO THE NEW COLUMN YOU CREATED, AND THE x IS SET TO season.
# Note: the order of the unique values is wrong: Greater than 9 should be last, not in the middle.
ggplot(office_ratings_new, aes(x = season, fill = ___)) +
  geom_bar()

# 3) USE mutate() and fct_relevel() TO CHANGE THE ORDER OF THE VALUES IN YOUR NEW COLUMN.
#    MAKE SURE TO SAVE IT AGAIN.
office_ratings_new <- mutate(office_ratings_new, imdb_rating_binned = fct_relevel(imdb_rating_binned, "___", "___", "___"))

# 4) PLOT THE DATA AGAIN WITH YOUR COLUMN AS A CORRECTLY ORDERED FACTOR. USE A DIFFERENT COLOR PALETTE WITH scale_fill_brewer() 
#    WITH palette SET TO ANY NUMBER 1 - 18. TRY DIFFERENT PALETTES AND PICK ONE YOU LIKE.
ggplot(office_ratings_new, aes(x = season, fill = ___)) +
  geom_bar() +
  scale_fill_brewer(palette = ___)

# 5) EXTRACT THE MONTH FROM EACH air_date BY AGAIN USING mutate() IN CONJUNCTION WITH THE month() FUNCTION FROM THE lubridate PACKAGE.
#    FIRST, LOAD THE LUBRIDATE PACKAGE. 
library(lubridate)

office_ratings_new <- mutate(office_ratings_new, air_date_month = month(___, label = TRUE))

# 6) USE COUNT TO DETERMINE WHAT THE MOST COMMON air_date MONTH WAS FOR THE SERIES. DON'T FORGET TO SORT!

count(office_ratings_new, ___, sort = ___)
