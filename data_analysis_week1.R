library(SDSFoundations)
bike <- BikeData

males <- bike[bike$gender == 'M',]
male_times <- males$time

mean(male_times)

# 1. Make a table to show how many daily riders are in the original dataset.
daily_raiders <- table(bike$cyc_freq)
print(daily_raiders)

# 2. How many of the daily riders are male?
male_daily_raiders <- table(males$cyc_freq)
print(male_daily_raiders)

# 3. What is the average age of daily riders? (Round to 1 decimal place.)
daily <- bike[bike$cyc_freq == 'Daily',]
mean(daily$age)

# 4. What is the average age of the female daily riders? (Round to 1 decimal place)

mean(daily[daily$gender == 'F',]$age)

# 5. What is the average age of the male daily riders? (Round to 1 decimal place.)

mean(daily[daily$gender == 'M',]$age)

# 6. How many daily male riders are age 30 or older?
thirty <- daily[daily$gender == 'M',]
nrow(thirty[thirty$age >= 30,])
