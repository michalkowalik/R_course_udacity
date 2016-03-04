library(SDSFoundations)
animaldata <- AnimalData

# comparing weight of adult cats and dogs

adult <- subset(animaldata, Age.Intake > 0)
table(adult$Animal.Type)

# make histogram of weight for both cats and dogs:
library(ggplot2)

qplot(data = adult,
      x = Weight) +
  facet_wrap(~ Animal.Type)


qplot(data = subset(adult, Animal.Type == "Cat"),
      x = Weight)



adult_cats <-subset(adult, Animal.Type == "Cat")
mean(adult_cats$Weight)
sd(adult_cats$Weight)

z <- (13 - mean(adult_cats$Weight)) / sd(adult_cats$Weight)
print(z)

1-pnorm(z)

?fivenum
fivenum(adult_cats$Weight)
median(adult_cats$Weight)

quantile(adult_cats$Weight)

adult_dogs <- subset(adult, Animal.Type == "Dog")
median(adult_dogs$Weight)

quantile(adult_dogs$Weight)
max(adult_dogs$Weight)

hist(adult_cats$Weight)

