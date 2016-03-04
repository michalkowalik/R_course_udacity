# week 4 tutorial:

library(SDSFoundations)
acl <- AustinCityLimits


gtab <- table(acl$Grammy)

prop.table(gtab)

gtab2 <- table(acl$Grammy, acl$Gender)
gtab2

prop.table(gtab2, 2)

# stacked
barplot(gtab2,
        main = 'ACM Grammy winners per gender',
        legend=T,
        beside = T) ## optional to switch from stacked to side-by-side


barplot(prop.table(gtab2, 2))


## pre-lab, week 4:
View(acl)
table(head(acl,10)$Grammy)

# first Female artist - what kind of music does it perform?
temp <- head(subset(acl, Gender == 'F' & Age > 60), 1)
temp$Genre


#Subset the data for artists age 30 or older
older <-acl[acl$Age>=30,]

# Create tables of marginal distributions
genre <- table(older$Genre)
genre
gender <- table(older$Gender)
gender

# Create contingency table 
twoway <- table(older$Gender,older$Genre)
twoway

# Visualize the counts
barplot(twoway, legend=T, beside=T)
barplot(twoway)

# Calculate P(A): the probability of each genre being played
prop.table(genre)

# Calculate P(A|B): the probability of each genre being played, given the artist’s gender
prop.table(twoway,1)
?prop.table


## Analyze the data part:


table(older$Gender)


# jazz performers that were males:
jazz <- subset(acl, Genre=='Jazz/Blues')
table(jazz$Gender)

males <- acl[acl$Gender == 'M',]
table(males$Genre)
table(acl$Gender)



