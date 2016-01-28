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

# histogram of facebook friends:
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
qplot(x = friend_count, data = pf, binwidth = 25) +
  scale_x_continuous(limits = c(0, 1000), breaks = seq(0, 1000, 50)) +
  facet_wrap(~gender)



