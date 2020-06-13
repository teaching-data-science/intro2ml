library(ggplot2)

# Change degree here
degree <- 3

# You can leave this code as it is, just use the objects from above and
# degree as variable in the task data generation:
task_data <-
mtcars_task <-
lm_learner <-


hp_pred <- seq(min(mtcars$hp), max(mtcars$hp), length.out = 100)
pred_data <- polynomialTrafo(data.frame(hp = hp_pred), "hp", degree)

plot_data <- data.frame(mpg_pred = predict(lm_learner$state$model, pred_data), hp = hp_pred)
ggplot() + geom_point(data = mtcars, aes(x = hp, y = mpg)) + geom_line(data = plot_data, aes(x = hp, y = mpg_pred))