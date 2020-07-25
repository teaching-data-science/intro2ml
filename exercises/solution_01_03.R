library (mlr3)
iris_task <- TaskClassif$new(id = "iris_task", 
                backend = iris[, c("Species", "Sepal.Width", "Petal.Width")], 
                target = "Species")
print (iris_task)                