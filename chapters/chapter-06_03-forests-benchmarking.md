---
title: 'Chapter 6.3: Benchmarking Trees, Forests, and Bagging K-NN'
description:
  ' The goal of this chapter is to compare the performance of random forest against stable and unstable methods. We explain the differences between trees, forest, and bagging. You would also train a random forest model using mlr3.'
prev: /chapter-06_02-forests-introduction
next: /chapter-06_04-forests-featureimportance
type: chapter
id: 1
---

<exercise id="1" title="Video Lecture">

<iframe width="100%" height="480" src="https://www.youtube.com/embed/uOamholBaZ0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

</exercise>

<exercise id="2" title="Slides">

<object data="pdfs/6/slides-forests-benchmark.pdf" type="application/pdf" style="width:100%;height:480px">
    <embed src="pdfs/6/slides-forests-benchmark.pdf" type="application/pdf" />
</object>

</exercise>


<exercise id="3" title="Quiz">
Which statements are true?
<choice>
<opt text="The OOB error shares similarities with cross-validation estimation. It can also be used for a quicker model selection." correct="true">
</opt>
<opt text="In random forests for regression, a good rule of thumb is to use mtry=`(√p)`" correct="true">
</opt>
<opt text="Proximities are used in replacing missing data, but not in locating outliers.">
</opt>
</choice>
</exercise>

<exercise id="4" title="Coding">

#### *(P)* Define the `mlr3` learner

For this exercise use the same task as for the tree tutorial:

<codeblock id="06_03_01">
</codeblock>


Define the learner with `predict_type = "prob"` and `num.trees = 1000`. We are using the `classif.ranger`. Visualize the learner with `plot_learner_prediction()`:

<codeblock id="06_03_02">

**Hints**

- Define the learner with hyperparameter `num.trees = 1000` and `predict_type = "prob"`
`rf_learner <- lrn("classif.ranger", num.trees = 1000, predict_type = "prob")`

- All hyperparameters can be accesed by the `param_set` field
`rf_learner$param_set`


</codeblock>


#### *(P)* Benchmarking the random forest

Now it's time to try different values for the number of trees and see if this has any influence on the performance. Additionally, we want to compare the random forests to a single CART. For this, we define four different learners:

1. A `classif.rpart` without any custom hyperparameters
1. A `classif.ranger` with 500 trees
1. A `classif.ranger` with 1000 trees
1. A `classif.ranger` with 1500 trees

After defining the learners conduct the benchmark using the `benchmark()` function. Use a 10-fold cross-validation as resampling technique. Finally, visualize the benchmark with `autoplot()` for the measures `auc` and `mmce`.

**Note:** Defining the same learner multiple times for a benchmark requires different ids for each learner (see `id` argument of the learners below).


<codeblock id="06_03_03">

**Hints**

- Use the objects previously defined
`library(mlbench)`

`set.seed(314)`
`spirals <- mlbench.spirals(500, sd = 0.1)`
`spirals <- as.data.frame(spirals)`
`spirals_task <- TaskClassif$new(id = "spirals_task", backend = spirals, target = "classes")`

- Define each learner separately
`cart_learner <- lrn("classif.rpart", predict_type = "prob")`
`rf_learner_500 <- lrn(id = "rf500", "classif.ranger", num.trees = 500, predict_type = "prob")`
`rf_learner_1000 <- lrn(id = "rf1000", "classif.ranger", num.trees = 1000, predict_type = "prob")`
`rf_learner_1500 <- lrn(id = "rf1500", "classif.ranger", num.trees = 1500, predict_type = "prob")`

- To create the benchmark design wrap the learners into a list and pass them to `benchmark_grid()` and define the task and the resampling strategy. Finally pass the design to `benchmark()` function.
 
`design <- benchmark_grid(tasks = spirals_task, learners = list(cart_learner, rf_learner_500,rf_learner_1000, rf_learner_1500), resamplings = rsmp("cv", folds = 10))`

`bmr <- benchmark(design)`

- Pass the measures of interest to the `autoplot` function.
`autoplot(bmr, measure = msr("classif.ce"))`
`autoplot(bmr, measure = msr("classif.auc"))`
</codeblock>
</exercise>


<exercise id="5" title="Quiz">
Which statements are true?
<choice>
<opt text="CART outperforms the random forest.">
</opt>
<opt text="Trying different values for the number of trees does not affect the performance." correct="true">
</opt>
<opt text="Tuning the number of trees can give a nice performance boost.">
</opt>
</choice>
</exercise>