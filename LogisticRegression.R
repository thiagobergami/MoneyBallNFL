#Logistic Regression

#Importing dataset
library(readxl)
dt = read_excel('all.xlsx')
test = read_excel('nfl_team_18.xlsx')
test <- test[,c("Position", "Overall")]
dt <- dt[,c("Position", "Overall", "champ")]

#splitting the dataset into the training set an test set
install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dt$champ, SplitRatio = 0.75)
training_set = subset(dt, split == TRUE)
test_set = subset(dt, split == FALSE)


#feature scaling
training_set[,1:2] = scale(training_set[,1:2])
test_set[,1:2] = scale(test_set[,1:2])
test[,1:2] = scale(test[,1:2])

training_set$champ <- as.numeric(training_set$champ)
test_set$champ <- as.numeric(test_set$champ)

classifier = glm(formula = champ ~.,
                 family = binomial,
                 data = training_set)


# Predicting the Test set results
prob_pred = predict(classifier, type = 'response', newdata = test_set[-3])
y_pred = ifelse(prob_pred> 0.5, 1, 0)

esse_ano = predict(classifier, type = 'response', newdata = test)
x_pred = ifelse(esse_ano> 0.5, 1, 0)

install.packages('ElemStatLearn')
library(ElemStatLearn)
set = test
x1 = seq(min(set[,1]) -1 , max(set[,1]) + 1, by = 0.01)
x2 = seq(min(set[,2]) -1 , max(set[,2]) + 1, by = 0.01)
grid_set = expand.grid(x1,x2)
colnames(grid_set) = c('Position', 'Overall')
prob_set = predict(classifier, type = 'response', newdata = grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, 3],
     main = 'Logistic Regression(Training set)',
     xlab = 'Age', ylab ='Estimated Salary',
     xlim = range(x1), ylim = range(x2))
contour(x1, x2, matrix(as.numeric(y_grid), length(x1), length(x2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[,3] == 1, 'green4', 'red3'))

