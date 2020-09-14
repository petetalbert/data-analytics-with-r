
# Load packages -----------------------------------------------------------
library(tidyverse)

# Let's load in the data! ------------------------------------------------
office_ratings <- read_csv("data/office_ratings.csv")


# Let's make a line graph with geom_line() -----------------------------------
# geom_line() is a lot like geom_col() because it requires both an x and y aesthetic mapping.

# 1) MAKE A PLOT THAT MAPS THE imdb_rating ACROSS TIME (USING air_date).
ggplot(office_ratings, aes(x = air_date, y = imdb_rating)) +
  geom_line()


# 2) MAKE THE SAME PLOT BUT SUBSITUTE air_date FOR epsiode.
ggplot(office_ratings, aes(x = episode, y = imdb_rating)) +
  geom_line()

# That doesn't look right! Why are there those vertical lines?

# 3) PUT season WITHIN the as.factor() function FOR color (LIKE THE LAST EXERCISE WITH HISTOGRAMS)
ggplot(office_ratings, aes(x = episode, y = imdb_rating, color = as.factor(season))) +
  geom_line()

# That's looking better; but it's still pretty ugly. Let's use our new ggplot function facet_wrap instead of color.

# 4) REMOVE THE color AESTHETIC, AND INSTEAD PUT SEASON IN facet_wrap(~)
ggplot(office_ratings, aes(x = episode, y = imdb_rating)) +
  geom_line() +
  facet_wrap(~ season)

# Let's make a scatterplot with geom_point() -----------------------------------
# Again, geom_point needs both an x and y aesthetic.

# 1) MAKE A SCATTERPLOT BY PLOTTING total_votes ON THE X-AXIS AND imdb_rating ON THE Y-AXIS.
ggplot(office_ratings, aes(x = total_votes, y = imdb_rating)) +
  geom_point()

# 2) FILTER THE DATA FIRST, BY ONLY LOOKING AT imdb_rating BETWEEN 7 AND 9, AND total_votes BETWEEN 1000 AND 3000.
office_ratings_filtered <- filter(office_ratings, imdb_rating >= 7 & imdb_rating <= 9 & total_votes >= 1000 & total_votes <= 3000)

ggplot(office_ratings_filtered, aes(x = total_votes, y = imdb_rating)) +
  geom_point()

#3) LASTLY, TAKE THE PREVIOUS PLOT AND ADD A REGRESSION LINE TO IT WITHOUT THE STANDARD ERROR BAND.
# Hint: a regression line is also called a liner model or "lm"; and the standard error (se) is defaulted to TRUE.
ggplot(office_ratings_filtered, aes(x = total_votes, y = imdb_rating)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)
