library(ggplot2)

set.seed(123)
task <- tsk("iris")
task$select(c("Sepal.Length", "Sepal.Width"))

gg1 = plot_learner_prediction(lrn("classif.lda", predict_type = "prob"), task = task) +
   guides(alpha = "none", shape = "none")
gg2 = plot_learner_prediction(lrn("classif.qda", predict_type = "prob"), task = task) +
   guides(alpha = "none", shape = "none")
gg3 = plot_learner_prediction(lrn("classif.naive_bayes", predict_type = "prob"), task = task) +
   guides(alpha = "none", shape = "none")

gridExtra::grid.arrange(gg1, gg2, gg3, ncol = 1)