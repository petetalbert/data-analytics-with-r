
# Load packages -----------------------------------------------------------
library(tidyverse)

# Let's load in the data! ------------------------------------------------
office_ratings <- read_csv("data/office_ratings.csv")

# Let's make our first plot! -----------------------------------------------

# The data we want to plot is what we were working with in the previous exercise. I just supply it for you here:
office_ratings_grouped <- group_by(office_ratings, season)
office_ratings_summary <- summarize(office_ratings_grouped, avg_total_votes = mean(total_votes))


# 1) PLOT THE DATA WHERE season IS ON THE X-AXIS AND avg_total_votes IS ON THE Y-AXIS.
ggplot(office_ratings_summary, aes(x = ___, y = ___)) + 
  geom_col()

# 2) MAKE THE SAME PLOT AS ABOVE BUT THIS TIME PLOT THE avg_imdb_rating
office_ratings_summary <- summarize(office_ratings_grouped, avg_imdb_rating = ___)

ggplot(office_ratings_summary, aes(x = season, y = ___)) + 
  geom_col()

# 3) WHAT HAPPENS WHEN I MAKE A PLOT WITH geom_bar() AND DON'T SUPPLY A Y-AXIS VALUE ON THE ORIGINAL DATA?
ggplot(office_ratings, aes(x = season)) + 
  geom_bar()


# 4) RUN THE PLOT BELOW AND TAKE A LOOK AT SOME OF THE NEW FUNCTIONS WE'VE ADDED. WE WILL DIVE MUCH MORE INTO THIS
# IN THE NEXT MODULE!

# okay, lot's of fancy tinkering to get the plot looking professional. We will discuss this in much greater detail in our dedicated session on ggplot.
# you'll need to install a new package called "scales". Remember: just run install.packages("scales") once, then load
# it with library(scales) each time you want to use it; I've commented out the code if want to just use that.
# install.packages("scales")
library(scales)

ggplot(data = office_ratings_summary, mapping = aes(x = as.factor(season), y = avg_imdb_rating)) + 
  geom_col(fill = "slategray") +
  scale_y_continuous(labels = comma_format(accuracy = 1)) +
  theme_minimal() +
  labs(
    title = "The Office received on average, lower IMDB\nratings on average after season 5",
    subtitle = "Average IMDB rating per season of The Office",
    x = "Season",
    y = "Avg total votes"
  ) +
  theme(panel.grid.minor.y = element_blank(),
        panel.grid.major.x = element_blank(),
        plot.title = element_text(face = "bold"))

# Nice looking plot, right? All made with code!