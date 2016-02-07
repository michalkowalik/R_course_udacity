# In this problem set, you'll continue
# to explore the diamonds data set.

# Your first task is to create a
# scatterplot of price vs x.
# using the ggplot syntax.

# This assignment is not graded and
# will be marked as correct when you submit.

# ENTER YOUR CODE BELOW THIS LINE
# ===========================================
ggplot(aes(x = price, y = x), data = diamonds) +
  geom_point()

# correlation between price and x:
cor.test(diamonds$price, diamonds$x)
#(0.884)

# correlation between price and y and z:
cor.test(diamonds$price, diamonds$y)
cor.test(diamonds$price, diamonds$z)

# Create a simple scatter plot of price vs depth.

# This assignment is not graded and
# will be marked as correct when you submit.

# ENTER YOUR CODE BELOW THIS LINE
#==================================================
ggplot(aes(x = price, y = depth), data = diamonds) +
  geom_point(alpha = 1/100) 

# correlation between price and depth:
cor.test(diamonds$depth, diamonds$price)


# Create a scatterplot of price vs carat
# and omit the top 1% of price and carat
# values.

# This assignment is not graded and
# will be marked as correct when you submit.

# ENTER YOUR CODE BELOW THIS LINE
# ========================================
ggplot(aes(x = carat, y = price), data = diamonds) +
  geom_point()

# Create a scatterplot of price vs. volume (x * y * z).
# This is a very rough approximation for a diamond's volume.

# Create a new variable for volume in the diamonds data frame.
# This will be useful in a later exercise.

# Don't make any adjustments to the plot just yet.

# This assignment is not graded and
# will be marked as correct when you submit.

# ENTER YOUR CODE BELOW THIS LINE
# =================================================================
diamonds$volume = diamonds$x * diamonds$y * diamonds$z

ggplot(aes(x = volume, y = price), data = diamonds) +
  geom_point()

# correlation of price and volumet for diamonds with volume > 0 and <=800:

d2 <- subset(diamonds, volume > 0 & volume <= 800)
with(subset(diamonds, volume > 0 & volume <= 800), cor.test(price, volume))


# Subset the data to exclude diamonds with a volume
# greater than or equal to 800. Also, exclude diamonds
# with a volume of 0. Adjust the transparency of the
# points and add a linear model to the plot. (See the
# Instructor Notes or look up the documentation of
# geom_smooth() for more details about smoothers.)

# We encourage you to think about this next question and
# to post your thoughts in the discussion section.

# Do you think this would be a useful model to estimate
# the price of diamonds? Why or why not?

# This assignment is not graded and
# will be marked as correct when you submit.

# ENTER YOUR CODE BELOW THIS LINE
# ========================================
p <- ggplot(aes(x = volume, y = price), data = d2) +
  geom_point(alpha = 1/50) + stat_smooth(method ="lm")

print(p)

# Use the function dplyr package
# to create a new data frame containing
# info on diamonds by clarity.

# Name the data frame diamondsByClarity

# The data frame should contain the following
# variables in this order.

#       (1) mean_price
#       (2) median_price
#       (3) min_price
#       (4) max_price
#       (5) n

# where n is the number of diamonds in each
# level of clarity.

clarity_groups <- group_by(diamonds, clarity)
diamondsByClarity <- summarise(clarity_groups, 
                               mean_price = mean(price),
                               median_price = median(price),
                               min_price = min(price),
                               max_price= max(price),
                               n = n()) %>% arrange(clarity)


# We’ve created summary data frames with the mean price
# by clarity and color. You can run the code in R to
# verify what data is in the variables diamonds_mp_by_clarity
# and diamonds_mp_by_color.

# Your task is to write additional code to create two bar plots
# on one output image using the grid.arrange() function from the package
# gridExtra.

diamonds_by_clarity <- group_by(diamonds, clarity)
diamonds_mp_by_clarity <- summarise(diamonds_by_clarity, mean_price = mean(price))

diamonds_by_color <- group_by(diamonds, color)
diamonds_mp_by_color <- summarise(diamonds_by_color, mean_price = mean(price))

library(gridExtra)
barplot(diamonds_mp_by_clarity$mean_price, names.arg = diamonds_mp_by_clarity$clarity)
barplot(diamonds_mp_by_color$mean_price, names.arg = diamonds_mp_by_color$color)  

