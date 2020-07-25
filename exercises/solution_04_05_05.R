pima_task <-  tsk("pima")
pima_task$filter(rows = which(complete.cases(pima_task$data()))) 
learner <- lrn("classif.log_reg", predict_type = "prob")
learner$train(task = pima_task)
model_prediction <- learner$predict(task = pima_task)

model_prediction$confusion
model_prediction$set_threshold(0.2)
model_prediction$confusion