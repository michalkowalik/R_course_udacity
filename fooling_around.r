getwd()
setwd('e:/garage/R')

statesInfo <- read.csv('stateData.csv')
subset(statesInfo, state.region == 1)
stateSubset <-statesInfo[statesInfo$state.region == 1, ]
