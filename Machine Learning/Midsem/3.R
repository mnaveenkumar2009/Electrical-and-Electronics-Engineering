Bollywood_Data <- read.csv("Bollywood_Data.csv")

#following is the structure of the data
print(str(Bollywood_Data))
#following is the summary of the data
print(summary(Bollywood_Data))

print(fivenum(Bollywood_Data$Youtube.Likes))
print(IQR(Bollywood_Data$Youtube.Likes))
print(range(Bollywood_Data$Youtube.Dislikes))

# par(mfrow= c(1,2))
# boxplot(Bollywood_Data$mileage)
# boxplot(Bollywood_Data$price)

# png(file = "output/hist_priceplot.png")
# hist(Bollywood_Data$price)
# abline(v = mean(Bollywood_Data$price),
#     col= "red",
#     lwd = 2)
# abline(v = median(Bollywood_Data$price),
#     col= "green",
#     lwd = 2)
# png(file = "output/hist_mileageplot.png")
# hist(Bollywood_Data$mileage)

# abline(v = mean(Bollywood_Data$mileage),
#     col= "red",
#     lwd = 2)
# abline(v = median(Bollywood_Data$mileage),
#     col= "green",
#     lwd = 2)

# png(file = "output/pricevsmil.png")
# plot(Bollywood_Data$mileage,Bollywood_Data$price)

# png(file = "output/modelvscar.png")
# plot(Bollywood_Data$model,Bollywood_Data$color)


# print(cor(Bollywood_Data$mileage, Bollywood_Data$price))
# print(matrix( 
#    c(
#     cor(Bollywood_Data$mileage, Bollywood_Data$mileage),
#     cor(Bollywood_Data$price, Bollywood_Data$mileage),
#     cor(Bollywood_Data$mileage, Bollywood_Data$price),
#     cor(Bollywood_Data$price, Bollywood_Data$price)
#     ),
#     nrow=2,              # number of rows 
#     ncol=2,              # number of columns 
#     byrow = TRUE) 
# )
# library(gmodels)
# CrossTable(x = Bollywood_Data$model,y = Bollywood_Data$transmission)

# Cons = Bollywood_Data$color %in% c("Black","Gray","Silver","White")

# print(table(Bollywood_Data$year))
# print(prop.table(table(Bollywood_Data$year)))
# png(file = "output/yearproportion.png")
# plot(prop.table(table(Bollywood_Data$year)))