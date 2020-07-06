# We are given the voltage data of the past 7 days.
# We need to plot the probability mass function assuming past data affects the new voltage

voltage <- c(5,5,4,5,6,6,4)
c=ecdf(voltage)

png(file = "output/cdf.png")
plot(c)
