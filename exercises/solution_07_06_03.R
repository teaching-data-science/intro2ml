param_set <- ParamSet$new(list(
   ParamInt$new("mtry", lower = 1L, upper = 30L),
   ParamInt$new("min.node.size", lower = 1L, upper = 50L)
))