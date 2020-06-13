set.seed(123)
design <- benchmark_grid(
  tasks = tsk("iris"),
  learners = list(lrn("classif.lda"), 
                 lrn("classif.qda"), 
                 lrn("classif.naive_bayes")),
  resamplings = rsmp("cv", folds = 10)
)
bmr <- benchmark(design)

autoplot(bmr)