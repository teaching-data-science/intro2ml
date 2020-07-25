set.seed(123)
class <- sample(c(1, 2), size = 100, replace = TRUE)
df_sim <- data.frame(x = rnorm(100, mean = 2*class, sd = class), y = rnorm(100, mean = 2*class, sd = class), class = as.character(class))

task_sim <- TaskClassif$new(id = "2_gaussians", backend = df_sim, target = "class")
kknn_learner <- lrn("classif.kknn", k = 1)

plot_learner_prediction(learner = kknn_learner, task = task_sim)
