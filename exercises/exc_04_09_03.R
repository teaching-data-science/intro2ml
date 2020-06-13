learners <- list(...)
task <-
res_desc <-
design <- benchmark_grid(
  tasks = ...,
  learners = ...,
  resamplings = ...
)

set.seed(123)
bmr <- benchmark(...)