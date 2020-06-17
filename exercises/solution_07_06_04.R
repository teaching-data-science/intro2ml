learner <- lrn("classif.ranger", predict_type = "prob")
param_set <- ParamSet$new(list(
   ParamInt$new("mtry", lower = 1L, upper = 30L), 
   ParamInt$new("min.node.size", lower = 1L, upper = 50L)
))
res_desc <- rsmp("cv", folds = 3L)
evals50 <- term("evals", n_evals = 50L)
  
instance <- TuningInstance$new(
  task = tsk("sonar"),
  learner = learner,
  resampling = res_desc,
  measures = msr("classif.auc"),
  param_set = param_set,
  terminator = evals50
)