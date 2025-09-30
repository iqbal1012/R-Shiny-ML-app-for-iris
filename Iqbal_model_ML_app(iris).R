############################################################################################################
# Md Iqbal Hossain
# PhD Candidate, 
# Computational and Applied Mathematics with a Concentration in Statistics at Old Dominion University
# https://github.com/iqbal1012?tab=repositories
############################################################################################################

# Importing libraries
library(RCurl) # for downloading the iris CSV file
library(randomForest)
library(caret)

# Importing the Iris data set
iris <- read.csv(text = getURL("https://raw.githubusercontent.com/iqbal1012/R-Shiny-ML-app-for-iris/refs/heads/main/iris.csv") )
dim(iris); str(iris)
# Performs stratified random split of the data set
TrainingIndex <- createDataPartition(iris$Species, p=0.8, list = FALSE)
TrainingSet <- iris[TrainingIndex,] # Training Set
TestingSet <- iris[-TrainingIndex,] # Test Set

write.csv(TrainingSet, "training.csv")
write.csv(TestingSet, "testing.csv")

TrainSet <- read.csv("training.csv", header = TRUE)
TrainSet <- TrainSet[,-1]

# Building Random forest model

model <- randomForest(as.factor(Species) ~ ., data = TrainSet, ntree = 500, mtry = 4, importance = TRUE)

# Save model to RDS file
saveRDS(model, "model.rds")

