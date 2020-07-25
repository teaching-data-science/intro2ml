library(titanic)

my_titanic <- na.omit(titanic::titanic_train[, c("Survived", "Age", "Fare")])
my_titanic$Survived <- factor(my_titanic$Survived)