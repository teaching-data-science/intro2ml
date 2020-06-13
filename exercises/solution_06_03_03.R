library(mlbench)

set.seed(314)
spirals <- mlbench.spirals(500, sd = 0.1)
spirals <- as.data.frame(spirals)
spirals_task <- TaskClassif$new(id = "spirals_task", backend = spirals, target = "classes")

cart_learner <- lrn("classif.rpart", predict_type = "prob")
rf_learner_500 <- lrn(id = "rf500", "classif.ranger", num.trees = 500, predict_type = "prob")
rf_learner_1000 <- lrn(id = "rf1000", "classif.ranger", num.trees = 1000, predict_type = "prob")
rf_learner_1500 <- lrn(id = "rf1500", "classif.ranger", num.trees = 1500, predict_type = "prob")

design <- benchmark_grid(
  tasks = spirals_task,
  learners = list(cart_learner, rf_learner_500, rf_learner_1000, rf_learner_1500),
  resamplings = rsmp("cv", folds = 10)
)

bmr <- benchmark(design)

autoplot(bmr, measure = msr("classif.ce"))
autoplot(bmr, measure = msr("classif.auc"))
