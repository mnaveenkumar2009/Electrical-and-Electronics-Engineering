# The data given in 5.csv is the probabilty of power cut of each day
data <- read.csv("5.csv")
print(data)

# library(party)

png(file = "decision_tree.png")

# Create the tree.
  output.tree <- ctree(
   Power~ Age, 
  data = data)

# Plot the tree.
plot(output.tree)