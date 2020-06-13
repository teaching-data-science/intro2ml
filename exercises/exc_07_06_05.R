library(ggplot2)

learner <- ...
param_set <- ...
res_desc <- ...
evals50 <- term(...)
  
instance <- TuningInstance$new(
  task = ...,
  learner = ...,
  resampling = ...,
  measures = ...,
  param_set = ...,
  terminator = ...
)

set.seed(314)
tuner <- tnr(...)
tuner$
# 'Best' model
instance$result
  
# Visualization
res <- instance$archive()
par_combs <- as.data.frame(matrix(unlist(res$params), nrow = length(res$params), byrow = T))
colnames(par_combs) <- names(res$params[[1]])
par_combs$auc <- res$classif.auc
ggplot(data = par_combs, aes(x = mtry, y = min.node.size, color = auc)) + geom_point()