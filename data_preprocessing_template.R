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

                              ###### OPTIONAL ######


# Taking care of missing data
from sklearn.preprocessing import Imputer
imputer = Imputer(missing_values = 'NaN', strategy = 'mean', axis = 0)
imputer = imputer.fit(X[:, 1:3])
X[:, 1:3] = imputer.transform(X[:, 1:3])


# Encoding categorical data
# Encoding the Independent Variable
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
labelencoder_X = LabelEncoder()                             ## Categorical data encoded into number
X[:, 0] = labelencoder_X.fit_transform(X[:, 0])             
onehotencoder = OneHotEncoder(categorical_features = [0])   ## Encode countries into 1-0-0 to not affect equation.
X = onehotencoder.fit_transform(X).toarray()
# Encoding the Dependent Variable
labelencoder_y = LabelEncoder()
y = labelencoder_y.fit_transform(y)
