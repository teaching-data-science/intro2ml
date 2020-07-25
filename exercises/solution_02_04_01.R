library(mlr3)
library(mlr3learners)

kknn_learner <- lrn("classif.kknn", k = 3)

kknn_learner