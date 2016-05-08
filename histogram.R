# Loading the data
HollywoodMovies2011 <- read.csv("HollywoodMovies2011.csv")

# loading ggplot2
library(ggplot2)

# drawing a histogram
ggplot(data = HollywoodMovies2011) + 
  geom_histogram(mapping = aes(x = Budget), binwidth = 10) +
  xlab("Budget (millions)")