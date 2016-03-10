library('SDSFoundations')

world <- WorldBankData

gbr <- world[world$Country.Code == 'GBR',]

gbr2000 <- gbr[gbr$year >= 2000 & gbr$year < 2010,]

time <- gbr2000$year - 2000

mv <- gbr2000$motor.vehicles

plot(time, mv)

expFit(time, mv)
logisticFit(time, mv)

#which model fits best?
tripleFit(time, mv)

expFitPred(time, mv, 12)
logisticFitPred(time, mv, 12)

## Pre-lab:
# Subset data for just the United States and name the new data frame "us"
us <- world[world$Country.Code == "USA",]

# Select the years from 1990 and name the new data frame "us_select"
us_select <- us[us$year >= 1990, ]

# Create a new variable in our datset called internet.mil to make the number of users more interpretable (into millions)
us_select$internet.mil <- us_select$internet.users / 1000000

# Create a new variable in our dataset called time that represents "years since 1990"
us_select$time <- us_select$year - 1990

# Select the first 10 years (from 1990 to 1999) and name the new data frame "us_select_10"
us_select_10 <- us_select[us_select$time < 10,]

# Use a function to fit an exponential and logistic model for 1990-1999
expFit(us_select_10$time, us_select_10$internet.mil)
logisticFit(us_select_10$time, us_select_10$internet.mil)

# Based on the prior model parameters, predict the number of internet users in 2006
e <- expFitPred(us_select_10$time, us_select_10$internet.mil, 16)
l <- logisticFitPred(us_select_10$time, us_select_10$internet.mil, 16)

# What model describes the first decade of internet in USA? which model is the best long-term fit?
