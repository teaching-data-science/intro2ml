pima_task <-  tsk("pima")
pima_task$filter(rows = which(complete.cases(pima_task$data())))
