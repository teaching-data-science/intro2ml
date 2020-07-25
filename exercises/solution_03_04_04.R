library(ggplot2)

# Change degrees and threshold here:
degree <- c(Age = 4,  Fare = 3)
threshold <- 0.5

# You can leave this code as it is, just vary degree and threshold above
# and see how the prediction surface change:
my_titanic <- na.omit(titanic::titanic_train[, c("Survived", "Age", "Fare")])
# use square root of fare to make visualisation more appealing (values at lower end more spread out...)
my_titanic$Fare <- sqrt(my_titanic$Fare)
my_titanic$Survived <- factor(my_titanic$Survived)

task_data <- polynomialTrafo(my_titanic, "Age", degree["Age"])
task_data <- polynomialTrafo(task_data, "Fare", degree["Fare"])

titanic_task <- TaskClassif$new(id = "titanic_task", backend = task_data, 
                                target = "Survived")
titanic_learner <- lrn("classif.log_reg", predict_type= "prob")
titanic_learner$train(titanic_task)

titanic_pred <- titanic_learner$predict(titanic_task)
titanic_pred$set_threshold(threshold = threshold)
logreg_train_predictions <- titanic_pred$response

my_titanic$correct_prediction <- logreg_train_predictions == my_titanic$Survived

age_fare_grid <- expand.grid(
  Age = seq(min(my_titanic$Age), max(my_titanic$Age), length.out = 100),
  Fare = seq(min(my_titanic$Fare), max(my_titanic$Fare), length.out = 100)
)
age_fare_grid_polys <- cbind(
  polynomialTrafo(age_fare_grid[, "Age", drop = FALSE], "Age", degree["Age"]),
  polynomialTrafo(age_fare_grid[, "Fare", drop = FALSE], "Fare", degree["Fare"])
)
age_fare_grid_polys_prediction <- 
  titanic_learner$predict_newdata(age_fare_grid_polys)
age_fare_grid_polys_prediction$set_threshold(threshold = threshold)

age_fare_grid$pred <- age_fare_grid_polys_prediction$response
age_fare_grid$probs <- age_fare_grid_polys_prediction$prob[,1]

ggplot(mapping = aes(x = Age, y = Fare)) +
  geom_tile(data = age_fare_grid, color = NA,
            aes(fill = as.factor(pred), 
                alpha = ifelse(probs < threshold, 1 - probs, probs)),
            show.legend = FALSE) +
  geom_point(data = subset(my_titanic, !correct_prediction),
             color = "black", size = 2, alpha = .7, show.legend = FALSE,
             shape = c(1,2)[as.factor(subset(my_titanic, !correct_prediction)$Survived)]) +
  geom_point(data = my_titanic, aes(shape = as.factor(Survived)), size = 2, alpha = .3) +
  scale_shape_manual(values = c(16, 17), name = "Survived") + 
  labs(caption = "Misclassified observations marked with strong outlines.")
# confusion matrix:
table(target = my_titanic$Survived,
      prediction = logreg_train_predictions)
