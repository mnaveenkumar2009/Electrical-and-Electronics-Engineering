# The following data is the readings of the voltage and current obtained from the ohm's law
# experiment over 5 trials
Voltage <- c(20, 40, 60, 80,100)
Current <- c(10, 21, 30, 42, 51)

# file name
png(file = "output/ohmslaw1.jpg")
# Plot the graph.
plot(Current, Voltage, type="l", xlab="Current",ylab="Voltage",col="blue",main="Voltage vs current")

#linear regression
relation <- lm(Voltage~Current)

print(relation) # 1.9383
# print(summary(relation))  # uncomment this to print summary

Resistance <- Voltage/Current

print(Resistance)
print(mean(Resistance))
print(median(Resistance))

png(file = "output/ohmslaw2.jpg")
plot(Current, Voltage, xlab="Current",ylab="Voltage",col="blue",main="Voltage vs current",abline(lm(Voltage~Current),cex=1.3,pch=16))