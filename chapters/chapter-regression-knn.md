---
title: 'Chapter 2.4: k-NN'
description:
  ' description...'
prev: /chapter-regression-polynomialregmodels
next: /chapter-classification-classificationtasks
type: chapter
id: 1
---

<exercise id="1" title="Video Lecture">

<iframe width="100%" height="480" src="https://www.youtube.com/embed/g8H6-MkN_q0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

</exercise>

<exercise id="2" title="Slides">

<object data="pdfs/2/slides-regression-knn.pdf" type="application/pdf" style="width:100%;height:480px">
    <embed src="pdfs/2/slides-regression-knn.pdf" type="application/pdf" />
</object>

</exercise>



<exercise id="3" title="Quiz">
Which statements are true?
<choice>
<opt text="The properties of k-NN are induced by the chosen distance metric." correct="true">
</opt>
<opt text="k-NN can only be used for classification tasks.">
</opt>
<opt text="Nk(x)Nk(x) contains the subset of the feature space XX that is at least as close to xx as the kk-th closest neighbor of xx in the training data set." correct="true">
</opt>
<opt text="1-NN always 'predicts' perfectly on observations of the training data set." correct="true">
</opt>
<opt text="k-NN with k=nk=n always predicts the same target variable value for all possible inputs xx." correct="true">
</opt>
<opt text="The Gower distance between two observations which have different values for all features is always 1.">
</opt>
<opt text="The Gower distance between two observations which have the same values for all features is always 0." correct="true">
</opt>
<opt text="If you use the Euclidean distance, k-NN results do not change if you rescale the features.">
</opt>
<opt text="If you use the Gower distance, k-NN results do not change if you rescale the features." correct="true">
</opt>
<opt text="The presence of irrelevant features doesn't affect the accuracy of k-NN.">
</opt>
<opt text="k-NN makes no assumptions about the underlying data distribution." correct="true">
</opt>
</choice>
</exercise>


<exercise id="4" title="Coding">

#### *(P)* Create the `mlr3` learner

Create a k-NN learner with `k = 3` using the `kknn` function from the same named package `kknn`:

<codeblock id="02_04_01">

**Hints**
- Use the `lrn()` function of mlr: 
`lrn(...)`

- Use the `classif.kknn` learner:
`classif.kknn`

- You can specify how many neighbors by setting `k`

</codeblock>

#### *(P)* Train the `mlr3` learner

Now train the learner `kknn_learner` defined above on the task `iris_task` defined in session 2:

<codeblock id="02_04_02">

**Hints**
- Use `iris_task` and `kknn_learner` from above:
`iris_task <- TaskClassif$new(id = "iris_task", backend = iris[,c("Species", "Sepal.Width", "Petal.Width")],target = "Species")`
`kknn_learner <- lrn("classif.kknn", k = 3)`

- Use the class method `train()` of the learner object:
`kknn_learner$train(...)`

- Just pass the `iris_task` to train the `kknn_learner`

</codeblock>

#### *(P)* Visualize decision boundaries

Again, define the `kknn_learner` and visualize the prediction of the learner with `plot_learner_prediction()`. Rerun the code for different `k`. What can you observe by varying the hyperparameter?

<codeblock id="02_04_03">
</codeblock>
</exercise>