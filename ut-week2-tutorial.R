library(SDSFoundations)
summary(AnimalData)
View(AnimalData)

#----

head(AnimalData)

table(AnimalData$Sex)
plot(AnimalData$Sex,
     main='Animals by Gender', 
     xlab='Gender', 
     ylab = 'Frequency')


# ----- (positive sqewed distribution)
hist(AnimalData$Age.Intake,
     main = 'Histogram of Intake Ages',
     xlab = 'Age at Intake')

# ---- histogram by variable

femaleAge <- AnimalData$Age.Intake[AnimalData$Sex == 'Female']
maleAge <- AnimalData$Age.Intake[AnimalData$Sex == 'Male']

hist(femaleAge,
     main = 'Histogram of Female Ages',
     xlab = 'Age at Intake')

hist(maleAge,
     main = 'Histogram of Male Ages',
     xlab = 'Age at Intake',
     breaks = 20)

# --- which
max(maleAge)
i <- which(AnimalData$Age.Intake == 17)
AnimalData[i,]

# ----- Univariate descriptive statistics

mean(AnimalData$Age.Intake)
median(AnimalData$Age.Intake)

sd(AnimalData$Age.Intake)

# 5-number summary:
fivenum(AnimalData$Age.Intake)