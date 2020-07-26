library(mlr3)
tsk("sonar")

lrn = mlr_learners$get("classif.rpart")

print(lrn)