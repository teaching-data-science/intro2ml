# helper function to extract polynomial features:
polynomialTrafo <- function (data, feature, degree) {
  feature_idx <- which(feature == names(data))

# function 'poly' creates numerically well-behaved polynomials: orthogonal, etc.
  df_poly <- as.data.frame(poly(data[[feature]], degree))
  names(df_poly) <- paste0(feature, ".poly", seq_len(degree))
  return(cbind(data[, -feature_idx, drop = FALSE], df_poly))
}

# Example: Create polynomial feature map with degree 2 of wt
data_trafo <- polynomialTrafo(mtcars[, c("mpg", "wt")], "wt", 2)
head(data_trafo)