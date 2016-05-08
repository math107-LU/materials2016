## --------------------------------------------------------------
## Randomization test in R
## Comparing proportions
## Cocaine addiction treatment example
## --------------------------------------------------------------

# Load the moasic and ggplot2 packages
library(mosaic)
library(ggplot2)

# Load the data 
cocaine <- read.csv("data/CocaineTreatment.csv")
head(cocaine)
summary(cocaine)

# Calculate a two way table
tally(Relapse ~ Drug, data = cocaine)

# Calculate the observed difference in proportions
observed <- diffmean( Relapse == "yes" ~ Drug, data = cocaine)
observed

# To simulate a single trial, we need to shuffle the treatment labels
mean(Relapse == "yes" ~ shuffle(Drug), data = cocaine)
diffmean(Relapse == "yes" ~ shuffle(Drug), data = cocaine)

# Create the randomization distribution
cocaine_null <- do(1000) * diffmean(Relapse == "yes" ~ shuffle(Drug), data = cocaine)
head(cocaine_null)

# Plotting the randomization distribution
ggplot(data = cocaine_null) + 
  geom_histogram(mapping = aes(x = diffmean)) + 
  xlab("Difference in proportions")

# Superimpose a line indicating the observation
ggplot(data = cocaine_null) + 
  geom_histogram(mapping = aes(x = diffmean)) + 
  xlab("Difference in proportions") +
  geom_vline(xintercept = observed, linetype = 2, colour = "blue")

# Calculate the proportion of simulated props as or more extreme
# than the observed
prop(~ diffmean >= observed, data = cocaine_null)
