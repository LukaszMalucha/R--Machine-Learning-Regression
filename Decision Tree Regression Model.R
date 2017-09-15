# Decision Tree Regression Model

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

## No feature scaling needed with dec. trees

# Fitting Decision Tree Regression to the dataset
# install.packages('rpart')
library(rpart)          ## Package for decision tree
regressor = rpart(formula = Salary ~ .,
                  data = dataset,
                  control = rpart.control(minsplit = 1)) ### SET CONDITION ON A SPLITS!

# Predicting a new result with Decision Tree Regression
y_pred = predict(regressor, data.frame(Level = 6.5))

# Visualising the Decision Tree Regression results (higher resolution)
# install.packages('ggplot2')
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01) ### Set resolution to 0.01 for better visibility
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Reality Check (Decision Tree Regression)') +
  xlab('Level') +
  ylab('Salary')

# Plotting the tree
plot(regressor)
text(regressor)