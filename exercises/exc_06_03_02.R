library(mlbench)

set.seed(314)
spirals <- mlbench.spirals(500, sd = 0.1)
spirals <- as.data.frame(spirals)
spirals_task <- TaskClassif$new(id = "spirals_task", backend = spirals, target = "classes")

rf_learner = lrn(...)
plot_learner_prediction(rf_learner, spirals_task)