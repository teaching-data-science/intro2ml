# Choose different observations for training the model
train_idx <- sample(1:500, size = 500, replace = TRUE)

spirals_task <- TaskClassif$new(id = "spirals_task", backend = spirals, target = "classes")

learner_cart <- lrn("classif.rpart", minsplit = 20, cp = 0.01)
learner_cart$train(spirals_task)

rpart.plot(learner_cart$state$model, roundint = FALSE)
plot_learner_prediction(learner = learner_cart, task = spirals_task)
