#Logistic Regression

#Importing dataset
library(readxl)
training_set = read_excel('all.xlsx')
test_set = read_excel('nfl_team_18.xlsx')
test_set <- test_set[,c("Position", "Overall")]
training_set <- training_set[,c("Position", "Overall", "champ")]

#feature scaling
training_set[,1:2] = scale(training_set[,1:2])
test_set[,1:2] = scale(test_set[,1:2])

classifier = glm(formula = champ~.,
                 family = binomial,
                 data = training_set)