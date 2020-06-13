
iris_task <- TaskClassif$new(id = "iris_task", 
                             backend = iris[,c("Species", "Sepal.Width", "Petal.Width")], 
                             target = "Species")
kknn_learner <- lrn("classif.kknn", k = 3)

plot_learner_prediction(learner = kknn_learner, task = iris_task)
