# Multiple Linear Regression

# Importing the dataset
dataset = read.csv('50_Startups.csv')

# Encoding categorical data - transform state into dummy vector variable 1,2,3
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1, 2, 3))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting Multiple Linear Regression to the Training set
## TRICK ***  '.' replace all the oter arguments (instead of typing them with '+')
regressor = lm(formula = Profit ~ ., 
               data = training_set)
## type 'summary(regressor)' into console to check the statistical values
## One dummy variable is automatically removed to avoid dummy variable trap

# Predicting the Test set results - use regressor on our test set to compare accuracy
y_pred = predict(regressor, newdata = test_set)

## type 'y_pred' in a console to check the values

### Building the OPTIMAL MODEL using Backward Elimination method (p-value > 6%)

regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State, 
               data = training_set)
summary(regressor)

### Eliminate State

regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend, 
               data = training_set)
summary(regressor)

### Eliminate Administration

regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend, 
               data = training_set)
summary(regressor)

### Marketing Spend p.value = 7%; R.D.Spend < 1%









