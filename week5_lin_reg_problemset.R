library(SDSFoundations)

wr <- WorldRecords


# 1. Create a subset of the data that contains World Record cases for the men’s Mile event.
mm <- wr[wr$Event == 'Mens Mile',]
mm

# 2. Create a subset of the data that contains World Record cases for the women's Mile event. 
wm <- wr[wr$Event == 'Womens Mile',]
wm

# 3. Create a scatterplot for each relationship of Mile time and year: one for men and one for women.  
plot(mm$Year, mm$Record)
plot(wm$Year, wm$Record)

# 4. Confirm from these plots that a linear model is appropriate.  

# 5. Run a linear model for each event and then interpret the results. Be sure to calculate R-squared values for each model.
linFit(mm$Year, mm$Record)
linFit(wm$Year, wm$Record)


# week 5 problemset:

#1.  Create a new data frame that contains the world record cases in the men's pole vault event in years 1970 and later. 

mpv <- subset(wr, Event == 'Mens Polevault' & Year >= 1970)
View(mpv)

plot(mpv$Year, mpv$Record)
linFit(mpv$Year, mpv$Record)


#

C  <- c(140,280,420,560)
h <- c(0,2,4,6)
plot(h,C)
linFit(h,C)
