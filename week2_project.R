library(SDSFoundations)
animaldata <- AnimalData

# what was the most common way that dogs arrived in the shelter
table(animaldata$Intake.Type[animaldata$Animal.Type == 'Dog'])

# of the  dogs that were brought to the shelter as an owner surrender, how many were returned
# to their owner:

surrendedDogs <- AnimalData[AnimalData$Animal.Type == 'Dog',]
surrendedDogs <- subset(surrendedDogs, Intake.Type == 'Owner Surrender')
surrendedDogs$Days.Shelter[AnimalData$Outcome.Type == 'Return to Owner']

table(surrendedDogs$Outcome.Type)

surrendedDogs$Days.Shelter[surrendedDogs$Outcome.Type == 'Return to Owner']

table(AnimalData$Animal.Type)

