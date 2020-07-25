library(mlbench)

set.seed(314)
spirals <- mlbench.spirals(500, sd = 0.1)
spirals <- as.data.frame(spirals)
spirals_task <- 

cart_learner <- lrn("classif.rpart", predict_type = "prob")
rf_learner_500 <- lrn(id = "rf500", "classif.ranger", num.trees = ..., predict_type = "prob")
rf_learner_1000 <- lrn(id = "rf1000", "classif.ranger", num.trees = ..., predict_type = "prob")
rf_learner_1500 <- lrn(id = "rf1500", "classif.ranger", num.trees = ..., predict_type = "prob")

design <- benchmark_grid(
  tasks = ...,
  learners = ...,
  resamplings = ...
)

bmr <- benchmark(design)

autoplot(bmr, measure = ...)
autoplot(bmr, measure = ...)