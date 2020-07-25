library(ggplot2)

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

set.seed(314)
tuner <- tnr("random_search")
tuner$tune(instance)
# 'Best' model
instance$result

# Visualization
res <- instance$archive()
par_combs <- as.data.frame(matrix(unlist(res$params), nrow = length(res$params), byrow = T))
colnames(par_combs) <- names(res$params[[1]])
par_combs$auc <- res$classif.auc
ggplot(data = par_combs, aes(x = mtry, y = min.node.size, color = auc)) + geom_point()
