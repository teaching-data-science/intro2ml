---
title: 'Chapter 4.8: Test Error'
description:
  ' There are two types of errors: training error and test error. The focus of this section is on the test error and difficulties related with it.'
prev: /chapter04-07-evaluation-trainingerror
next: /chapter04-09-evaluation-resampling
type: subchapter
id: 1
---

<exercise id="1" title="Video Lecture">

<iframe width="100%" height="480" src="https://www.youtube.com/embed/GOTPjCXhiS8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

</exercise>

<exercise id="2" title="Slides">

<object data="pdfs/4/slides-evaluation-test.pdf" type="application/pdf" style="width:100%;height:480px">
    <embed src="pdfs/4/slides-evaluation-test.pdf" type="application/pdf" />
</object>

</exercise>


<exercise id="3" title="Quiz">
Which statements are true?
<choice>
<opt text="Overfitting means that the model performs very well on the training data.">
</opt>
<opt text="Overfitting means that the model performs much better on the training data than on the test data." correct="true">
</opt>
<opt text="A good test performance is an indicator of overfitting.">
</opt>
<opt text="The linear model is well known to overfit very fast.">
</opt>
<opt text="Overfitting risk increases with model complexity" correct="true">
</opt>
<opt text="Constraining the hypothesis space helps the learner to find a good hypothesis." correct="true">
</opt>
<opt text="Goodness-of-fit measures like `R2`, likelihood, AIC, BIC and deviance are all based on the test error">
</opt>
</choice>
</exercise>


<!--<exercise id="4" title="Coding">-->

<!--#### *(P)* Overfitting k-NN-->

<!--To visually see how the number of nearest neighbors affects the overfitting behavior we simulate data as followed:-->


<!--A. Draw 100 observations of a binary target variable with equal distributed classes `1` and `2`:-->

<!--```-->
<!--class <- sample(c(1, 2), size = 100, replace = TRUE)-->
<!--```-->

<!--B. Simulate data with two normally distributed features `x` and `y` and a target variable `class`, where class `1` should have a mean of $2$ and standard deviation of $1$; class `2` should have a mean of $4$ and standard deviation of $2$, and `class` should contain the classes as factor or character variable:-->

<!--```-->
<!--df_sim <- data.frame(x = rnorm(100, mean = 2*class, sd = class), y = rnorm(100, mean = 2*class, sd = class), class = as.character(class))-->
<!--```-->


<!--C. Generate a task out of the simulated data with `target = "class"` and define the k-NN learner with `k = 1`-->

<!--```-->
<!--task_sim <- TaskClassif$new(id = "2_gaussians", backend = df_sim, target = "class")-->
<!--kknn_learner <- lrn("classif.kknn", k = 1)-->
<!--```-->


<!--D. Finally, call `plot_learner_prediction()` on the learner and task:-->
<!--```-->
<!--plot_learner_prediction(learner = kknn_learner, task = task_sim)-->
<!--```-->

<!--E. Now, put all together and vary `k` to see how the overfitting behavior of k-NN reacts on the choice of `k`:-->

<!--<codeblock id="04_08">-->

<!--</codeblock>-->

<!--</exercise>-->
