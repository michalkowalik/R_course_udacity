yo <- read.csv('yogurt.csv')
library(ggplot2)

ggplot(data = yo,
       aes(x = time, y = price)) +
    geom_jitter(alpha = 1/4, shape = 21, fill = I('#F79240'))

