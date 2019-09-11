used_cars <- read.csv("usedcars.csv")
# print(str(used_cars))
# print((used_cars$color))

print(summary(used_cars))
# print(range(used_cars$year))
# print(fivenum(used_cars$mileage))
# print(IQR(used_cars$mileage))

png(file = "output/boxplot.png")
par(mfrow= c(1,2))
boxplot(used_cars$mileage)
boxplot(used_cars$price)
png(file = "output/hist_priceplot.png")
hist(used_cars$price)
abline(v = mean(used_cars$price),
    col= "red",
    lwd = 2)
abline(v = median(used_cars$price),
    col= "green",
    lwd = 2)
png(file = "output/hist_mileageplot.png")
hist(used_cars$mileage)

abline(v = mean(used_cars$mileage),
    col= "red",
    lwd = 2)
abline(v = median(used_cars$mileage),
    col= "green",
    lwd = 2)

png(file = "output/pricevsmil.png")
plot(used_cars$mileage,used_cars$price)

print(table(used_cars$year))
print(prop.table(table(used_cars$year)))


# print(cor(used_cars$mileage, used_cars$price))
# print(matrix( 
#    c(
#     cor(used_cars$mileage, used_cars$mileage),
#     cor(used_cars$price, used_cars$mileage),
#     cor(used_cars$mileage, used_cars$price),
#     cor(used_cars$price, used_cars$price)
#     ),
#     nrow=2,              # number of rows 
#     ncol=2,              # number of columns 
#     byrow = TRUE) 
# )
library(gmodels)
CrossTable(x = used_cars$model,y = used_cars$color)

Cons = used_cars$color %in% c("Black","Gray","Silver","White")
print(used_cars* Cons)