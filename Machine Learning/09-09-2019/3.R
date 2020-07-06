N = 25000
x = 0:N
y = dbinom(x,25000,0.6)
png(file = "output/binom.png")
plot(x,y)