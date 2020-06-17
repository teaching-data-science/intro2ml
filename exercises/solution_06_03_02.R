library(mlbench)

set.seed(314)
spirals <- mlbench.spirals(500, sd = 0.1)
spirals <- as.data.frame(spirals)
spirals_task <- TaskClassif$new(id = "spirals_task", backend = spirals, target = "classes")

rf_learner <- lrn("classif.ranger", num.trees = 1000, predict_type = "prob")

plot_learner_prediction(rf_learner, spirals_task)
