library(mlbench)

set.seed(314)
spirals <- mlbench.spirals(500, sd = 0.1)
spirals <- as.data.frame(spirals)
spirals_task <- TaskClassif$new(id = "spirals_task", backend = spirals, target = "classes")

learner_cart <- lrn("classif.rpart", minsplit = 20, cp = 0.01)
learner_cart$train(spirals_task)
