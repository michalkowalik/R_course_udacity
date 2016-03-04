
library(SDSFoundations)
acl <- AustinCityLimits

m <- acl[acl$Gender == 'M',]
mGenre <- table(m$Genre)
mGenre
mGrammy <- table(m$Grammy)
mGrammy

# 3.Create a contingency table to show the conditional distribution for Genre and Grammy.
twoway <- table(m$Grammy, m$Genre)
twoway

# 4. make a bar chart
barplot(twoway, legend=T, beside=T)

# 5. Calculate P(A): the probability of winning a Grammy
prop.table(mGrammy)

# N         Y 
# 0.5679012 0.4320988 

# 6. Calculate P(A|B): the probablity of winning Grammy given the artist's Genre:
prop.table(twoway,2)

#  twoway, 1
#   Country    Jazz/Blues      Rock/Folk/Indie   Singer-Songwriter
# N 0.08695652 0.06521739      0.73913043        0.10869565
# Y 0.20000000 0.11428571      0.62857143        0.05714286

# Twoway, 2
#   Country    Jazz/Blues      Rock/Folk/Indie   Singer-Songwriter
# N 0.3636364  0.4285714       0.6071429         0.7142857
# Y 0.6363636  0.5714286       0.3928571         0.2857143

