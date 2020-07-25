pima_task <-  tsk("pima")
pima_task$filter(rows = which(complete.cases(pima_task$data())))
learner <- lrn("classif.log_reg", predict_type = "prob")
learner$train(task = pima_task)