

polynomialTrafo <- function (data, feature, degree) {
  feature_idx <- which(feature == names(data))
  # function 'poly' creates numerically well-behaved polynomials: orthogonal, etc.
  df_poly <- as.data.frame(poly(data[[feature]], degree))
  names(df_poly) <- paste0(feature, ".poly", seq_len(degree))
  return(cbind(data[, -feature_idx, drop = FALSE], df_poly))
}

task_data <- polynomialTrafo(data = mtcars[, c("mpg", "hp")], feature = "hp", degree = 3)
mtcars_task <- TaskRegr$new(id = "mtcars_task", backend = task_data, target = "mpg")
