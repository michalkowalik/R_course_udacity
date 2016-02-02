library(ggplot2)
data("diamonds")

qplot(x = price, data = diamonds)

length(subset(diamonds, price < 250))


## diamonds histogram, part 2:

qplot(x = price, data = diamonds, binwidth = 20,
      color = I('black'), fill = I('orange')) +
  scale_x_continuous(limits = c(200, 2000), breaks = seq(0, 2000, 100))
  
# Break out the histogram of diamond prices by cut.

# You should have five histograms in separate
# panels on your resulting plot.

qplot(x = price, data = diamonds, binwidth = 100,
      color = I('black'), fill = I('orange')) +
  scale_x_continuous() +
  facet_wrap(~cut)

# numeric values:
by(diamonds$price, diamonds$cut, max)


# Look up the documentation for facet_wrap in R Studio.
# Then, scroll back up and add a parameter to facet_wrap so that
# the y-axis in the histograms is not fixed. You want the y-axis to
# be different for each histogram.

qplot(x = price, data = diamonds, binwidth = 100,
      color = I('black'), fill = I('orange')) +
  scale_x_continuous() +
  facet_wrap(~cut, scales="free_y")


# Create a histogram of price per carat
# and facet it by cut. You can make adjustments
# to the code from the previous exercise to get
# started.

# Adjust the bin width and transform the scale
# of the x-axis using log10.

qplot(x = price/carat, data = diamonds, binwidth = 100,
      color = I('black'), fill = I('orange')) +
  scale_x_continuous() +
  facet_wrap(~cut, scales="free_y")



Investigate the price of diamonds using box plots,
# numerical summaries, and one of the following categorical
# variables: cut, clarity, or color.

# There won’t be a solution video for this
# exercise so go to the discussion thread for either
# BOXPLOTS BY CLARITY, BOXPLOT BY COLOR, or BOXPLOTS BY CUT
# to share you thoughts and to
# see what other people found.

# You can save images by using the ggsave() command.
# ggsave() will save the last plot created.
# For example...
#                  qplot(x = price, data = diamonds)
#                  ggsave('priceHistogram.png')

# ggsave currently recognises the extensions eps/ps, tex (pictex),
# pdf, jpeg, tiff, png, bmp, svg and wmf (windows only).

p <- ggplot(diamonds, aes(factor(cut), price))
p + geom_boxplot()            

qplot(x = color, y = price,
      data = diamonds,
      geom = 'boxplot') +
  coord_cartesian(ylim = c(0, 10000))
            
by(diamonds$price, diamonds$color, summary)

# iqr for diamonds with color D: (best color)
IQR(subset(diamonds, color=='D')$price)

# investigate the weight of the diamonds (carat) using a frequency polygon.
# use different bin widths to see how the requency polygon changes. What carat size has a count great than 2000?

qplot(x = carat, 
      data = diamonds,
      xlab = 'carat',
      binwidth= .05,
      geom = 'freqpoly', color = carat) +
  scale_x_continuous(lim = c(0, 2.5), breaks = seq(0, 2.5, .2)) 
  
