library(SDSFoundations)
bull <- BullRiders

# subset of riders that participated in at least one event in 2012:
new_bull12 <- subset(BullRiders, Events12 > 0)
View(new_bull12)

# histogram of earnings for 2012
hist(new_bull12$Earnings12)
median(new_bull12$Earnings12)
max(new_bull12$Earnings12)

# scatterplot of earning and ride percentage:
plot(new_bull12$RidePer12, new_bull12$Earnings12,
     xlab = 'ride percentage',
     ylab = 'earnings',
     main = 'Plot of events vs buckouts')

cor(new_bull12$RidePer12, new_bull12$Earnings12)


#scatterplot of earning and cup points:
library(ggplot2)
ggplot(aes(x = CupPoints12, y = Earnings12),
       data = new_bull12) + geom_point()

cor(new_bull12$CupPoints12, new_bull12$Earnings12)


# identify specific case
which(new_bull12$Earnings12 == max(new_bull12$Earnings12))
new_bull12[4,]


#Subset the data
nooutlier <- new_bull12[new_bull12$Earnings12 < 1000000 ,] 

cor(nooutlier$RidePer12, nooutlier$Earnings12)

cor(nooutlier$CupPoints12, nooutlier$Earnings12)

