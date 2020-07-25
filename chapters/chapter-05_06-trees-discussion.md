---
title: 'Chapter 5.6: Discussion'
description:
  ' This chapter aims to elucidate the pros and cons of trees. As a practical task, you would train a model for classification and regression with CART using mlr3. You would also visualize the tree structure and decision boundaries for different data situations.'
prev: /chapter-05_05-trees-stoppingcriteria
next: /chapter-06_01-forests-baggingensembles
type: chapter
id: 1
---

<exercise id="1" title="Video Lecture">

<iframe width="100%" height="480" src="https://www.youtube.com/embed/nKULLVAUk74" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

</exercise>

<exercise id="2" title="Slides">

<object data="pdfs/5/slides-cart-discussion.pdf" type="application/pdf" style="width:100%;height:480px">
    <embed src="pdfs/5/slides-cart-discussion.pdf" type="application/pdf" />
</object>

</exercise>


<exercise id="3" title="Quiz">
Which statements about CART are true?
<choice>
<opt text="CART is a stable algorithm, if the data changes slightly the tree structure remains quite similar.">
</opt>
<opt text="CART is robust to outliers." correct="true">
</opt>
<opt text="With trees it is easy to handle missing values." correct="true">
</opt>
<opt text="A simple tree is everything you need to fit a linear function `y≈a+b∗x` with numeric target.">
</opt>
</choice>
</exercise>


<exercise id="4" title="Coding">

#### *(P)* Create the spiral task

For this exercise we are, again, using simulated data. Here we use the package `mlbench` to simulate spiral data. Therefore, use the function `mlbench.spirals()` to generate 500 data points with `sd = 0.1` and store it into a object called `spirals`. Transform this object to a `data.frame` and define the task with `target = "classes"`:


<codeblock id="05_06_01">

**Hints**
- Generate data points and transfrom them to a data.frame
`set.seed(314)`
`spirals <- mlbench.spirals(500, sd = 0.1)`
`spirals <- as.data.frame(spirals)`

- Define the task
`spirals_task <- TaskClassif$new(id = "spirals_task", backend = spirals, target = "classes")`
</codeblock>


#### *(P)* Create and train the `mlr3` CART learner

Use the `classif.rpart` learner to train the tree. Use `minsplit = 20`  and `cp = 0.01` as hyperparameters:


<codeblock id="05_06_02">

**Hints**
- Use the objects defined previously
`set.seed(314)`
`spirals <- mlbench.spirals(500, sd = 0.1)`
`spirals <- as.data.frame(spirals)`
`spirals_task <- TaskClassif$new(id = "spirals_task", backend = spirals, target = "classes")`

- To define the learner use `lrn()`. Hyperparameter are passed as comma separated argument
`learner_cart <- lrn("classif.rpart", minsplit = 20, cp = 0.01)`

- Finally, use 'train()' to calculate the model
`learner_cart$train(learner_cart, spirals_task)`

</codeblock>


#### *(P)* Visualize the fitted tree

You can use the function `rpart.plot()` from the package of the same name `rpart.plot` to visualize the tree structure. For this, you have to access the internal fitted model which is stored as `state$model` element of the fitted model. Additionally, call `plot_learner_prediction()` to visualize the decision boundaries:


<codeblock id="05_06_03">

**Hints**
- Use the objects defined previously and library `rpart.plot`
`library(mlbench)`
`library(rpart.plot)`

`set.seed(314)`
`spirals <- mlbench.spirals(500, sd = 0.1)`
`spirals <- as.data.frame(spirals)`
`spirals_task <- TaskClassif$new(id = "spirals_task", backend = spirals, target = "classes")`

`learner_cart <- lrn("classif.rpart", minsplit = 20, cp = 0.01)`
`learner_cart$train(spirals_task)`

- Call `rpart.plot` of the fitted rpart model. You can access the model via the `learner.model` element of the model
`rpart.plot(learner_cart$state$model, roundint = FALSE)`

- Call `plotLearnerPrediction()` on the learner and task to get decision boundaries
`plot_learner_prediction(learner = learner_cart, task = spirals_task)`
</codeblock>



#### *(P)* Visualize the tree for different data constellations

To see how trees behave on the same data situation but different data constellation draw 500 rows randomly (using the `sample()` function) with replacement and recreate the figures:


<codeblock id="05_06_04">

**Hints**

- Use different data situation, e.g. via sampling:
`train_idx <- sample(1:500, size = 500, replace = TRUE)`
</codeblock>
</exercise>



<exercise id="5" title="Quiz">
Which statements are true?
<choice>
<opt text="The data situation is still the same, we are just using less unique data points." correct="true">
</opt>
<opt text="The tree structure for different data situations remains the same.">
</opt>
<opt text="The decision boundaries for different data situations remain the same.">
</opt>
</choice>
</exercise>


<exercise id="6" title="Coding">

#### *(P)* Visualize the tree for different hyperparameters

Finally, visualize the tree structure and decision boundaries for varying hyperparameters. Also try to understand how changes in the parameters affect the figures.

<codeblock id="05_06_05">

</codeblock>
</exercise>


<exercise id="7" title="Quiz">
Which statements are true?
<choice>
<opt text="Reducing just the complexity cp leads to bigger trees.">
</opt>
<opt text="Reducing complexity cp, minsplit at the same time leads to bigger trees." correct="true">
</opt>
<opt text="A very small minsplit leads to smaller trees.">
</opt>
<opt text="The bigger the tree the more unstable its structure becomes." correct="true">
</opt>
</choice>
</exercise>


<exercise id="8" title="CART">
<object data="code-demos/code_demo_cart.pdf" type="application/pdf" style="width:100%;height:480px">
    <embed src="code-demos/code_demo_cart.pdf" type="application/pdf" />
</object>

You can run the code snippets in the demos on your local machine. The corresponding Rmd version of this demo can be found [here](https://github.com/compstat-lmu/lecture_i2ml/blob/master/code-demos/code_demo_cart.Rmd). If you want to render the Rmd files to PDF, you need the accompanying [style files](https://github.com/compstat-lmu/lecture_i2ml/tree/master/style).

</exercise>
