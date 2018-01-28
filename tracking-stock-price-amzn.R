library(readr)
library(tidyverse)
library(stringr)

##########
# GET DATA
##########

amzn <- read_csv("http://sharpsightlabs.com/wp-content/uploads/2017/09/AMZN_stock.csv")
# inspect
amzn
# change names to lowercase
colnames(amzn) <- tolower(colnames(amzn))
# inspect
amzn

######
# PLOT
######

# first draft 
ggplot(data = amzn,
       aes(x = date, y = close)) + 
  geom_line()


# final draft 
ggplot(data = amzn,
       aes(x = date, y = close)) + 
  geom_line(color = 'cyan') + 
  labs(x = 'Date',
       y = 'Closing\nPrice',
       title = "Amazon's stock price has increased dramatically\nover the last 20 years") +
  theme(text = element_text(family = "Gill Sans", color = "#464646"),
        panel.background = element_rect(fill = "#444B5A"),
        panel.grid.minor = element_line(color = "#4D5566"),
        panel.grid.major = element_line(color = "#586174"),
        plot.title = element_text(size = 28),
        axis.title = element_text(size = 18, color = "#555555"),
        axis.title.y = element_text(vjust = 1, angle = 0),
        axis.title.x = element_text(hjust = 0))
