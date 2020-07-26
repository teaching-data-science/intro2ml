library(mlr3)

pima_task <-  tsk("pima")
print(pima_task$filter(rows = which(complete.cases(pima_task$data()))))
