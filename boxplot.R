# loading the data
HollywoodMovies2011 <- read.csv("HollywoodMovies2011.csv")

# loading ggplot2
library(ggplot2)

# drawing a boxplot
ggplot(data = HollywoodMovies2011) +
  geom_boxplot(mapping = aes("var", WorldGross)) +
  xlab("") +
  ylab("World gross (millions)") +
  scale_x_discrete(breaks = NULL) +
  coord_flip()