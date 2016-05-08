# Load the data
HollywoodMovies2011 <- read.csv("HollywoodMovies2011.csv")

# loading dplyr
library(dplyr)

# calculate a frequency table
HollywoodMovies2011 %>%
  group_by(Genre) %>%
  summarise(count = n())

# calculate a relative frequency table
HollywoodMovies2011 %>%
  group_by(Genre) %>%
  summarise(count = n()) %>%
  mutate(rfreq = count / sum(count))
