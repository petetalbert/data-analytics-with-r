
# Load packages -----------------------------------------------------------
# In your R scripts, you always want to first load any packages you plan on using. Again, using
# library() basically loads the package so you can use the functions it contains.

library(tidyverse)


# Let's load in some data! ------------------------------------------------
# To work with data in R, we need it in a spreadsheet-like format. In R, this is called a data frame. The function
# read_csv() takes a .csv file (essentially a spreadsheet data file) loads it into our environment as
# a data.frame.

office_ratings <- read_csv("module-02/office_ratings.csv")

# Let's make our first plot! -----------------------------------------------

# first I want to summarize the data, so it's ready to plot.
office_ratings_grouped <- group_by(office_ratings, season)
office_ratings_summary <- summarize(office_ratings_grouped, 
                                    avg_total_votes = mean(total_votes))

# here is the code that creates the plot.
ggplot(office_ratings_summary, 
       aes(x = season, 
           y = avg_total_votes)) + 
  geom_col()


# okay, lot's of fancy tinkering to get the plot looking professional. We will discuss this in much greater detail in our dedicated session on ggplot.
# you'll need to install a new package called "scales". Remember: just run install.packages("scales") once, then load 
# it with library(scales) each time you want to use it.
library(scales)

ggplot(data = office_ratings_summary, mapping = aes(x = as.character(season), y = avg_total_votes)) + 
  geom_col(fill = "slategray") +
  scale_y_continuous(labels = comma_format(accuracy = 1)) +
  theme_minimal() +
  labs(
    title = "The Office received less total IMDB votes on average\nas the show went along",
    subtitle = "Average total votes per season of The Office",
    x = "Season",
    y = "Avg total votes"
  ) +
  theme(panel.grid.minor.y = element_blank(),
        panel.grid.major.x = element_blank(),
        plot.title = element_text(face = "bold"))

# Nice looking plot, right? All made with code!








