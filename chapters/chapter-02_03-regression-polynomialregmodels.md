---
title: 'Chapter 2.3: Polynomial Regression Models'
description:
  ' Linear regression models can be made more flexible if one uses polynomials. After completing this chapter, you would know how polynomial regression models work. In particular, you would be able to transform a linear regression into a non-linear regression.'
prev: /chapter-02_02-regression-linearregmodels
next: /chapter-02_04-regression-knn
type: chapter
id: 1
---

<exercise id="1" title="Video Lecture">

<iframe width="100%" height="480" src="https://www.youtube.com/embed/q1ETfSxEfSg" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

</exercise>

<exercise id="2" title="Slides">

<object data="pdfs/2/slides-regression-polynomials.pdf" type="application/pdf" style="width:100%;height:480px">
    <embed src="pdfs/2/slides-regression-polynomials.pdf" type="application/pdf" />
</object>

</exercise>


<exercise id="3" title="Quiz">
Which statements are true?
<choice>
<opt text="Using linear regression it is only possible to model linear effects of a feature">
</opt>
<opt text="Overfitting is a present danger in polynomial regression" correct="true">
</opt>
</choice>
</exercise>


<exercise id="4" title="Coding">

#### *(P)* Create a regression task

Create a regression task using the `mtcars` dataset with target variable `mpg` and polynomial feature `hp` of degree 3 (use the helper function below to generate a dataset for polynomial regression):

<codeblock id="02_03_01">

**Hints**

- Define the polynomialTrafo function
`polynomialTrafo <- function (data, feature, degree) {feature_idx <- which(feature == names(data))`

- Function `poly` creates numerically well-behaved polynomials: orthogonal, etc.
`df_poly <- as.data.frame(poly(data[[feature]], degree))`
`names(df_poly) <- paste0(feature, ".poly", seq_len(degree))`
`return(cbind(data[, -feature_idx, drop = FALSE], df_poly))`

- Use `polynomialTrafo` to get the desired dataframe
`task_data <- polynomialTrafo(data = mtcars[, c("mpg", "hp")], feature = "hp", degree = 3)`

- Use the `task_data` in `TaskRegr$new()`
`TaskRegr$new(id = ..., backend = ..., target = ...)`

</codeblock>

<codeblock id="02_03_02">
</codeblock>


Now define a learner. Use a regression learner of the `lm` function.

<codeblock id="02_03_03">

**Hints**
- To see all available learners you can simply call `mlr_learners`
</codeblock>

#### *(P)* Train the linear model

<codeblock id="02_03_04">
</codeblock>

#### *(P)* Visualize the polynomial regression

To draw the curve you can use the code below, try different values for `degree`. How does the curve change? What can you observe?

<codeblock id="02_03_05">

**Hints**
- `task_data <- polynomialTrafo(data = mtcars[, c("mpg", "hp")], feature = "hp", degree = degree)`

- `mtcars_task <- TaskRegr$new(id = "mtcars_task", backend = task_data, target = "mpg")`

- `lm_learner <- lrn("regr.lm")`

- `lm_learner$train(mtcars_task)`
</codeblock>
</exercise>

