# week 5 problemset
library(SDSFoundations)
acl <- AustinCityLimits

# 1.a. How many artists in the dataset have 100 000 or more likes on facebook?
table(acl$Facebook.100k)

# 1.b. Which age group has the highest number of artists that have 100 000 or morr likes on facebook?

popular <- acl[acl$Facebook.100k == 1,]
histogram(popular$Age)

# 1.c. For each age group, fill the proportion of artists who have 100 000 or more likes on facebook

mAgeGroup <- table(acl$Age.Group)
mAgeGroup

mPopular <- table(acl$Facebook.100k)
mPopular

tWay <- table(acl$Facebook.100k, acl$Age.Group)
tWay

prop.table(tWay, 2)

