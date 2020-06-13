learner <- lrn("classif.lda")
task <- tsk("iris")
res_desc <- rsmp("cv", folds = 10)

set.seed(123)
res <- resample(learner = learner, task = task, resampling = res_desc)
