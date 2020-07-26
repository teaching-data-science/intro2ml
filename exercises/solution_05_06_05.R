# Choose different hyperparameter configurations
minsplit <- 20
cp <- 0.01

learner_cart <- lrn("classif.rpart", minsplit = minsplit, cp = cp)
learner_cart$train(spirals_task)

rpart.plot(learner_cart$state$model, roundint = FALSE)
plot_learner_prediction(learner = learner_cart, task = spirals_task)