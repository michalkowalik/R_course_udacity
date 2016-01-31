getwd()
list.files()
pf <- read.csv('pseudo_facebook.tsv', sep = '\t')

# parameters in the dataset:
names(pf)

# bithdays with ggplot2:
# install.packages('ggplot2')
library(ggplot2) 
qplot(x = factor(dob_day) , data = pf) +
  scale_x_discrete(breaks = 1:31) +
  facet_wrap(~dob_month, ncol=3)
#  scale_x_discrete(breaks=1:31)
# colors and schemes in notes!

# histograof facebook friends:
qplot(x= friend_count, data = pf)
  

# remove long tail data:
qplot(x = friend_count, data = pf, xlim=c(0,1000))

# or:
qplot(x = friend_count, data = pf) +
  scale_x_continuous(limits = c(0, 1000))

# change bin width:
qplot(x = friend_count, data = pf, binwidth = 25) +
  scale_x_continuous(limits = c(0, 1000), breaks = seq(0, 1000, 50))

# Equivalent ggplot syntax: 
#  ggplot(aes(x = friend_count), data = pf) + 
#  geom_histogram(binwidth = 25) + 
#  scale_x_continuous(limits = c(0, 1000), breaks = seq(0, 1000, 50))

# friends histograms by gender:
qplot(x = friend_count, data = subset(pf, !is.na(gender)), binwidth = 25) +
  scale_x_continuous(limits = c(0, 1000), breaks = seq(0, 1000, 50)) +
  facet_wrap(~gender)

# statistics by gender:
table(pf$gender)
# statictics by... (summary)
by(pf$friend_count, pf$gender, summary)

# tenure (also color in plot)
# not really needed here
# t <- pf$tenure / 365

qplot(tenure / 365, data = pf,
      xlab = "Number of years using Facebook",
      ylab = "Number of users in sample",
      binwidth = 1/6, color = I('black'), fill = I('#099DD9')) + 
  scale_x_continuous(breaks = seq(1, 7, 1), limits = c(0, 7))
  

# user ages: (kind of an assignment:)
qplot(x = age, data = subset(pf, !is.na(gender)), 
      binwidth = 1, color = I('black'), fill = I('orange')) +
  scale_x_continuous(breaks = seq(0, 100, 10)) + 
  facet_wrap(~gender)
  
# transforming data: 3 histograms on single plot:

library(gridExtra)

p1 <- ggplot(pf, aes(friend_count)) + geom_histogram() + scale_x_log10()
p2 <- ggplot(pf, aes(log10(friend_count + 1)))  + geom_histogram(binwidth = .025)
p3 <- ggplot(pf, aes(sqrt(friend_count + 1)))  + geom_histogram(binwidth = .25)

grid.arrange(p1, p2, p3, ncol = 1)


## frequency polygons:

 qplot(x = www_likes, data = subset(pf, !is.na(gender)), binwidth = 10) +
   facet_wrap(~gender)

qplot(x = www_likes, 
     data = subset(pf, !is.na(gender)),
     xlab = 'www likes',
     binwidth = 10, geom = 'freqpoly', color = gender) +
  scale_x_continuous(lim = c(0, 1000), breaks = seq(0, 1000, 100)) 
  
# official response:
qplot(x = www_likes, 
     data = subset(pf, !is.na(gender)),
     xlab = 'www likes',
     geom = 'freqpoly', color = gender) +
  scale_x_continuous() +
  scale_x_log10()
 
# who has more likes:

wm <- subset(pf$www_likes, pf$gender == 'male')
wf <- subset(pf$www_likes, pf$gender == 'female')

summary(wm)
sum(wm)


## by is the official response:
by(pf$www_likes, pf$gender, sum)


## box plot!
qplot(x= gender, y = friendships_initiated, 
      data = subset(pf, !is.na(gender)), 
      geom = 'boxplot') + coord_cartesian(ylim = c(0, 500))

by(pf$friendships_initiated, pf$gender, summary)


### Getting logical:

pf$mobile_check_in <- NA
pf$mobile_check_in <- ifelse(pf$mobile_likes > 0, 1, 0)
pf$mobile_check_in <- factor(pf$mobile_check_in)
summary(pf$mobile_check_in)

# precentage of users using mobile checkin:
nrow(subset(pf, mobile_check_in == 1)) / nrow(pf)
# or:
sum(pf$mobile_check_in == 1) / length(pf$mobile_check_in)


 