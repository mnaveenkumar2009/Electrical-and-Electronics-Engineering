# The data given in 2.csv is the probabilty of power cut of each day
data <- read.csv("2.csv")
print(data)

# We are given that there was a power cut and we need to find out 
# the probabilty of the power cut occuring on a particular day.
# Let P(X|Y) be the probability of Power cut on day Y

# We need to find P(Y|X)

# Using Baye's Theorom P(Yi|X) = P(X|Yi)*P(Yi)/ sum of all j from 1 to 7 (P(X|Yj)*P(Yj))

# P(Yi)= 1/7 for all i from 1 to 7 so we can cancel these from both numerator and denominator

#find the denominator as it's same for all days
den=sum(data$Probability_powercut)

# Create the data frame.
data2<- data.frame(
   Day = c (1:7), 
   Probability=data$Probability_powercut/den
)
# Print the data frame.			
print(data2) 
print(sum(data2$Probability)) # gives 1 as expected
