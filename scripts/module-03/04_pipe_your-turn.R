
# Load packages -----------------------------------------------------------
library(tidyverse)

# Let's load in the data! ------------------------------------------------
office_ratings <- read_csv("data/office_ratings.csv")


# Let's rewrite some of our old code with the pipe (%>%) now! -----------------------------------
# Remember: Ctrl/Cmd + Shift + M is a shortcut for %>%.

# 1) BELOW IS SOME CODE WE'VE WORKED WITH A LOT. REWRITE THIS USING THE PIPE (%>%).
office_ratings_grouped <- group_by(office_ratings, season) 
summarize(office_ratings_grouped, avg_imdb_rating = mean(imdb_rating))

# Hint: always think "data" first, then your first operation on the data, then your second operation on the data.

office_ratings %>% 
  ___ %>% 
  ___

# 2) KEEP THE OPERATIONS GOING BY SORTING HIGHEST TO LOWEST, THE avg_imdb_rating.
# Hint: use arrange().

office_ratings %>% 
  ___ %>% 
  ___ %>% 
  arrange(___)

# 3) GO ALL THE WAY FROM GROUPING AND SUMMARIZING TO PLOTTING BY PIPING YOUR DATA INTO A ggplot FUNCTION.
#    AGAIN, GROUP BY season AND SUMMARIZE BY GETTING THE avg_imdb_rating. THEN USE mutate() TO CHANGE THE season COLUMN TO A FACTOR.
#    LASTLY, PLOT THE DATA USING geom_col().

office_ratings %>% 
  group_by(___) %>% 
  summarize(avg_imdb_rating = mean(___)) %>% 
  mutate(season = as_factor(___)) %>% 
  ggplot(aes(x = season, y = avg_imdb_rating)) +
  geom____()
