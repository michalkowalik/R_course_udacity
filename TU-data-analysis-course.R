#Assign the value 6+2 to x
x <- 6+2
x

# vectors in R:

myvariable <- c(72, 28, -9, 12, 11)
myvariable * 3
sqrt(myvariable)

myvar2 <- myvariable * 3

length(myvar2)
sum(myvar2)

# indexing

myvariable[2]

## returns boolean values for every test:
myvariable > 0
## that returns all positive numbers in myvariable:
myvariable[myvariable > 0]

# importing a dataframe:

# read.delim
# View 

# table (frequency data)

# indexing in data frame: dataname[row, column]

BikeData$age[7]

head(BikeData, 10)

## pre-lab:
bike <- BikeData

# Find the number of students in the dataset
table(bike$student)

# Pull out student data into a new dataframe
student <-bike[bike$student==1,]

# Find how often the students ride, using the new dataframe
table(student$cyc_freq)

# Create a vector for the distance variable
distance <-student$distance

# Find average distance ridden
mean(distance)

# pre-lab, part 2:

# Import the BikeData dataset, name it "bike"

# Find the number of students in the dataset
table(bike$student)

# Pull out student data into a new dataframe
student <-bike[bike$student==1,]

# Find how often the students ride, using the new dataframe
table(student$cyc_freq)

# Create a vector for the distance variable
distance <-student$distance

# Find average distance ridden
mean(distance)
