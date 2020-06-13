
iris_task <- TaskClassif$new(id = "iris_task", 
                             backend = iris[,c("Species", "Sepal.Width", "Petal.Width")], 
                             target = "Species")
kknn_learner <- lrn("classif.kknn", k = 3)

kknn_learner$train(iris_task)