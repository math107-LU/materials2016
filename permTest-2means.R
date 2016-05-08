## --------------------------------------------------------------
## Randomization test in R
## Testing a difference in means
## Mosquito attractiveness example
## --------------------------------------------------------------

# Load the moasic and ggplot2 packages
library(mosaic)
library(ggplot2)

# Load the data 
mosquitos <- read.csv("data/mosquitoes-beer.csv")
head(mosquitos)
summary(mosquitos)

# Calculate the observed difference in means
mean(count ~ treatment, data = mosquitos)
observed <- 
  mean(count ~ treatment, data = mosquitos) %>%
  diff()

observed

# To simulate a single trial, we need to shuffle the treatment labels
mean(count ~ shuffle(treatment), data = mosquitos)
mean(count ~ shuffle(treatment), data = mosquitos) %>%
  diff()

# Create the randomization distribution
mosquito_null <- do(1000) * mean(count ~ shuffle(treatment), data = mosquitos) %>%
  diff()
head(mosquito_null)

# Plotting the randomization distribution
ggplot(data = mosquito_null) + 
  geom_histogram(mapping = aes(x = water)) + 
  xlab("mean difference")

# Superimpose a line indicating the observation
ggplot(data = mosquito_null) + 
  geom_histogram(mapping = aes(x = water)) +
  xlab("mean difference") +
  geom_vline(xintercept = observed, linetype = 2, colour = "blue")

# Calculate the proportion of simulated diff in means as or more extreme
# than the observed
prop(~ water <= observed, data = mosquito_null)
