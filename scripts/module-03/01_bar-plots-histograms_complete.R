
# Load packages -----------------------------------------------------------
library(tidyverse)

# Let's load in the data! ------------------------------------------------
office_ratings <- read_csv("data/office_ratings.csv")


# Let's make a bar plot with geom_bar() -----------------------------------
# Remember: geom_bar() doesn't take a y aesthetic mapping, just an x, because it only counts the data.

# 1) MAKE A PLOT THAT COUNTS THE NUMBER OF EPISODES BY SEASON WITH geom_bar().
ggplot(office_ratings, aes(x = season)) +
  geom_bar()

# 2) NOW DO THE SAME WITH geom_col().
# Hint: we need an intermediate step.

office_ratings_counted <- count(office_ratings, season)

ggplot(office_ratings_counted, aes(x = season, y = n)) +
  geom_col()

# 3) MAKE A BAR PLOT THAT GIVES THE AVERAGE IMDB RATING BY SEASON.
# Would we use geom_bar() or geom_col()? Hint: we aren't counting anymore.

office_ratings_grouped <- group_by(office_ratings, season)

office_ratings_summary <- summarize(office_ratings_grouped, avg_imdb_rating = mean(imdb_rating))

ggplot(office_ratings_summary, aes(x = season, y = avg_imdb_rating)) +
  geom_col()

# Let's make a histogram with geom_histogram() -----------------------------------

# 1) MAKE A PLOT THAT GIVES A HISTOGRAM OF imdb_rating.
ggplot(office_ratings, aes(x = imdb_rating)) +
  geom_histogram()

# 2) EDIT THE SAME PLOT TO HAVE A TOTAL OF 20 BINS; THEN MAKE ANOTHER PLOT WITH THE BINWIDTH SET TO 0.25.
ggplot(office_ratings, aes(x = imdb_rating)) +
  geom_histogram(bins = 20)

ggplot(office_ratings, aes(x = imdb_rating)) +
  geom_histogram(binwidth = 0.25)

# 3) LASTLY, TAKE YOUR PLOT WITH THE BINWIDTH SET TO 0.25, AND PUT season WITHIN the as.factor() function FOR fill.
# (We will talk much more about the fill option and the new data type, factors.)
# What is this plot showing us? Do you see any trend or pattern?
ggplot(office_ratings, aes(x = imdb_rating, fill = as_factor(season))) +
  geom_histogram(binwidth = 0.25)
