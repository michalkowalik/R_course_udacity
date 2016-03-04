library(SDSFoundations)
animaldata <- AnimalData

str(animaldata)

nrow(subset(head(animaldata, 10), Outcome.Type == 'Adoption'))



#Find the number of animals that were adopted
table(animaldata$Outcome.Type)

#Pull out only adopted animals
adopted <- animaldata[animaldata$Outcome.Type=="Adoption",]

#Pull out just the days in shelter for the adopted animals
daystoadopt <- adopted$Days.Shelter

#Visualize and describe this variable
hist(daystoadopt)
fivenum(daystoadopt)
mean(daystoadopt)
sd(daystoadopt)
which(animaldata$Days.Shelter==max(daystoadopt))

males<-animaldata[animaldata$Sex == 'Male',] 
males

median(daystoadopt)
IQR(daystoadopt)

sd(daystoadopt)
animaldata[425,]

fivenum(daystoadopt)
