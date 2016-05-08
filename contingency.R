# Creating a contingency table

# Load the data set
dream <- read.csv("dream.csv")
head(dream)

# Obtaining counts by stance & ideology pair
library(dplyr)
ctbl <- 
  dream %>%
  group_by(stance, ideology) %>%
  summarise(count = n())

# Making the two-way table (this is just formatting)
library(tidyr)
two_way_tbl <- 
  ctbl %>%
  spread(key = ideology, value = count)