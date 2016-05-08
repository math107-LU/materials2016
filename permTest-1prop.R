## --------------------------------------------------------------
## Randomization test in R
## Testing a proportion
## Paul the octopus example
## --------------------------------------------------------------

# Load the moasic and ggplot2 packages
library(mosaic)
library(ggplot2)

# To simulate a single trial, we need to flip a fair coin 8 times
rflip(8)

# Automating flipping a fair coin 8 times, a large number of times
paul_null <- do(1000) * rflip(8)
head(paul_null)

# Plotting the randomization distribution
ggplot(data = paul_null) + 
  geom_histogram(mapping = aes(x = prop)) + 
  xlab("proportion")

# Superimpose a line indicating the observation
ggplot(data = paul_null) + 
  geom_histogram(mapping = aes(x = prop)) + 
  xlab("proportion") +
  geom_vline(xintercept = 1, linetype = 2, colour = "blue")

# Calculate the proportion of simulated props as or more extreme
# than the observed
prop(~ prop >= 1, data = paul_null)
