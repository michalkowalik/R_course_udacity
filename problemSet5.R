# Create a histogram of diamond prices.
# Facet the histogram by diamond color
# and use cut to color the histogram bars.

# The plot should look something like this.
# http://i.imgur.com/b5xyrOu.jpg

# Note: In the link, a color palette of type
# 'qual' was used to color the histogram using
# scale_fill_brewer(type = 'qual')

# This assignment is not graded and
# will be marked as correct when you submit.

# ENTER YOUR CODE BELOW THIS LINE
# ===========================================
library(ggplot2)
data("diamonds")

ggplot(data = diamonds, aes(x = price, fill = cut)) +
    geom_histogram() +
    scale_fill_brewer(type = 'qual') +
    facet_wrap(~ color)

# Create a scatterplot of diamond price vs.
# table and color the points by the cut of
# the diamond.

# The plot should look something like this.
# http://i.imgur.com/rQF9jQr.jpg

# Note: In the link, a color palette of type
# 'qual' was used to color the scatterplot using
# scale_color_brewer(type = 'qual')

# This assignment is not graded and
# will be marked as correct when you submit.

# ENTER YOUR CODE BELOW THIS LINE
# ===========================================

ggplot(data = diamonds,
       aes(x = table, y = price)) +
    geom_point(aes(colour = cut)) +
    scale_fill_brewer(type = 'qual')
