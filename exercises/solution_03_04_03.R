library(titanic)
my_titanic <- na.omit(titanic::titanic_train[, c("Survived", "Age", "Fare")])
my_titanic$Survived <- factor(my_titanic$Survived)
task_titanic <- TaskClassif$new(id = "titanic_task", backend = my_titanic, 
                                target = "Survived")
learner_logreg <- lrn("classif.log_reg", predict_type = "prob")

plot_learner_prediction(learner = learner_logreg, task = task_titanic)
