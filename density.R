# Loading the data
HollywoodMovies2011 <- read.csv("HollywoodMovies2011.csv")

# loading ggplot2
library(ggplot2)

# drawing a density plot
ggplot(data = HollywoodMovies2011) + 
  geom_density(mapping = aes(x = Budget))
