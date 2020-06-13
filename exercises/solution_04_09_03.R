learners <- list(lrn("classif.lda"), 
                 lrn("classif.qda"), 
                 lrn("classif.naive_bayes"))
task <- tsk("iris")
res_desc <- rsmp("cv", folds = 3)
design <- benchmark_grid(
  tasks = task,
  learners = learners,
  resamplings = res_desc
)

set.seed(123)
bmr <- benchmark(design)