# Data Preprocessing Template with R

# I. Import dataset
dataset = read.csv('Data.csv')


# install.packages('caTools')
library(caTools)
# Splitting the dataset into the Training set and Test set
set.seed(123)
split = sample.split(dataset$DependentVariable, SplitRatio = 0.8) 
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)


