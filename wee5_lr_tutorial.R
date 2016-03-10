library(SDSFoundations)

wr <- WorldRecords
View(wr)

table(wr$Event)

mens800 <- wr[wr$Event == 'Mens 800m',]

linFit(mens800$Year, mens800$Record)


ub <- wr[wr$Athlete == 'Usain Bolt',]
View(ub)

#1c. Who was the first woman to break the women’s 1 mile world record with a time of less than 260 seconds?
wm <- subset(wr, Event == 'Womens Mile' & Record < 261)
View(wm)
## pre-lab:
# 1. Create a subset of the dataset that contains only the World Record cases for men’s shotput.
ms <- wr[wr$Event == 'Mens Shotput',]
ms
nrow(ms)

# 2. Create a subset that contains only the World Record cases for women's shotput. 
ws <- wr[wr$Event == 'Womens Shotput',]
ws
nrow(ws)

# 3. Create a scatterplot of year and record shotput distance: one for men and one for women.  
plot(ms$Year, ms$Record, main = "Mens Shotput records",
     xlab="Year", ylab = "Record")

plot(ws$Year, ws$Record, main = "Women Shotput records",
     xlab="Year", ylab = "Record")

# 4. Confirm from these plots that a linear model is appropriate.  


# 5. Run a linear model for each event and then interpret the results.

linFit(ms$Year, ms$Record)
linFit(ws$Year, ws$Record)
