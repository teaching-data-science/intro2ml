learner <- lrn("classif.log_reg", predict_type = "prob")
task <-  tsk("pima")
task$filter(rows = which(complete.cases(task$data())))
res_desc <- rsmp("cv", folds = 3L)

set.seed(123)
res <- resample(task, learner, res_desc)
test_prediction <- res$prediction()

autoplot(res, "roc")
res$score(msr("classif.auc"))