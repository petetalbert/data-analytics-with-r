
# Load packages -----------------------------------------------------------
library(tidyverse)

# Let's load in the data! ------------------------------------------------
office_ratings <- read_csv("data/office_ratings.csv")


# Let's make a bar plot with geom_bar() -----------------------------------
# Remember: geom_bar() doesn't take a y aesthetic mapping, just an x, because it only counts the data.

# 1) MAKE A PLOT THAT COUNTS THE NUMBER OF EPISODES BY SEASON WITH geom_bar().
ggplot(office_ratings, aes(x = season)) +
  geom____()

# 2) NOW DO THE SAME WITH geom_col().
# Hint: we need an intermediate step.

___ <- count(office_ratings, ___)

ggplot(___, aes(x = season, y = ___)) +
  geom_col()

# 3) MAKE A BAR PLOT THAT GIVES THE AVERAGE IMDB RATING BY SEASON.
# Would we use geom_bar() or geom_col()? Hint: we aren't counting anymore.

office_ratings_grouped <- group_by(office_ratings, ___)

___ <- summarize(office_ratings_grouped, avg_imdb_rating = ___)

ggplot(___, aes(x = season, y = avg_imdb_rating)) +
  geom____()

# Let's make a histogram with geom_histogram() -----------------------------------

# 1) MAKE A PLOT THAT GIVES A HISTOGRAM OF imdb_rating.
ggplot(office_ratings, aes(x = ___)) +
  geom____()

# 2) EDIT THE SAME PLOT TO HAVE A TOTAL OF 20 BINS; THEN MAKE ANOTHER PLOT WITH THE BINWIDTH SET TO 0.25.
ggplot(office_ratings, aes(x = ___)) +
  geom____(___ = ___)

ggplot(office_ratings, aes(x = ___)) +
  geom____(___ = ___)

# 3) LASTLY, TAKE YOUR PLOT WITH THE BINWIDTH SET TO 0.25, AND PUT season WITHIN the as_factor() function FOR fill.
# (We will talk much more about the fill option and the new data type, factors.)
# What is this plot showing us? Do you see any trend or pattern?
ggplot(office_ratings, aes(x = ___, fill = as.factor(___))) +
  geom____(___ = ___)