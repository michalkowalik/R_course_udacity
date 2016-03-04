library(SDSFoundations)
bull <- BullRiders


plot(bull$YearsPro, bull$BuckOuts,
     xlab = 'Years Pro',
     ylab = 'Buckouts',
     main = 'Yabba yabba')
abline(lm(bull$BuckOuts~bull$YearsPro))

plot(bull$Events, bull$BuckOuts, 
     xlab = 'No ofEvents',
     ylab = 'Buckouts',
     main = 'Plot of events vs buckouts')
abline(lm(bull$BuckOuts~bull$Events))


# Correlation:

cor(bull$YearsPro, bull$BuckOuts)
cor(bull$Events, bull$BuckOuts)

myvars <- c('YearsPro', 'Events', 'BuckOuts')
cor(bull[,myvars])
