---
title: 'Chapter 4.5: Measures Classification ROC Visualisation'
description:
  ' In this chapter, you learn how to deal with unbalanced binary classification problems and how to visualize some ROC curves. As a practical task, you would calculate and plot the ROC.'
prev: /chapter-04_04-evaluation-measuresclassificationroc
next: /chapter-04_06-evaluation-overfitting
type: chapter
id: 1
---

<exercise id="1" title="Video Lecture">

<iframe width="100%" height="480" src="https://www.youtube.com/embed/m5We8ITYEVk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

</exercise>

<exercise id="2" title="Slides">

<object data="pdfs/4/slides-evaluation-measures-classification-roc-space.pdf" type="application/pdf" style="width:100%;height:480px">
    <embed src="pdfs/4/slides-evaluation-measures-classification-roc-space.pdf" type="application/pdf" />
</object>

</exercise>



<exercise id="3" title="Quiz">
Which statements are true?
<choice>
<opt text="Logistic regression minimizes the binomial loss." correct="true">
</opt>
<opt text="The Brier score is like the MSE just with probabilities." correct="true">
</opt>
<opt text="The log-loss punishes being very wrong less than the Brier score.">
</opt>
<opt text="Accuracy and mean classification error are calculated using the predicted probabilities.">
</opt>
<opt text="The confusion matrix tabulates the true against predicted classes." correct="true">
</opt>
<opt text="A misclassification error rate of `0.5%` is always great.">
</opt>
</choice>
</exercise>




<exercise id="4" title="Quiz">
Which statements are true?
<choice>
<opt text="If the proportion of positive to negative instances in the training data changes, the ROC curve will not change.">
</opt>
<opt text="If the proportion of positive to negative instances in the test data changes, the ROC curve will not change." correct="true">
</opt>
<opt text="Several evaluation metrics can be derived from a confusion matrix." correct="true">
</opt>
<opt text="The area under the ROC curve is called AUC." correct="true">
</opt>
<opt text="AUC = 0 means that the model is optimal.">
</opt>
</choice>
</exercise>


<exercise id="5" title="Coding">

#### *(P)* The pima dataset

The pima dataset contains diagnostic measurements, with which one wants to predict if an individual has diabetes or not. The task is predefined in `mlr3` and can be accessed with the query `pima`:

<codeblock id="04_05_01">
</codeblock>

We only want to consider the complete cases. Use the `filter` method combined with the `complete.cases` function therefor:

<codeblock id="04_05_02">

**Hints**
- With `which` we get the indices of the complete cases
`which(complete.cases(pima_task$data()))`
</codeblock>

#### *(P)* A first model

1. As a first approach, we want to train a logistic regression on the whole task. Therefore, define the model and train it. Set the `predict_type` of the learner to `"prob"`:

<codeblock id="04_05_03">

**Hints**

- Only complete cases
`pima_task$filter(rows = which(complete.cases(pima_task$data()))`

- Use `classif.log_reg` as learner with `predict.type = prob`
`learner <- lrn("classif.log_reg", predict_type = "prob")`

- Use the pima task defined before
`task = pima_task`
</codeblock>


2. Calculate the prediction on the whole task with the class method `predict()` of the learner object:

<codeblock id="04_05_04">

**Hints**

- Define the model as previously
`pima_task <-  tsk("pima")`
`pima_task$filter(rows = which(complete.cases(pima_task$data())))`
`learner <- lrn("classif.log_reg", predict_type = "prob")`
`learner$train(task = pima_task)`

- Predict using the learner object
`model_prediction <- learner$predict(task = pima_task)`
</codeblock>


3. Print the confusion matrix for the `model_prediction` by accessing its class property `confusion` (extra: use the class method `set_threshold()` to vary the decision threshold used):

<codeblock id="04_05_05">

**Hints**
- Use the `TaskClassif$new()` function of mlr3. The identifier for the task `id` can be arbitrarily chosen, but must be set.
`iris_task <- TaskClassif$new(id = ..., backend = ..., target = ...)`
</codeblock>


4. Finally, plot the ROC (with `autoplot()` using the keyword `"roc"`). Do also calculate the AUC and mmce with the class method `score()` (extra: use the class method `set_threshold()` to vary the decision threshold used):

<codeblock id="04_05_06">

**Hints**
- Use the previously defined objects
`pima_task <-  tsk("pima")`
`pima_task$filter(rows = which(complete.cases(pima_task$data())))`
`learner <- lrn("classif.log_reg", predict_type = "prob")`
`learner$train(task = pima_task)`
`model_prediction <- learner$predict(task = pima_task)`

- The ROC can be easily plotted with
`autoplot(model_prediction, "roc")`

- To calculate the performance on a prediction object use its class method `score()` 
`model_prediction$score(list(msr("classif.auc"), msr("classif.ce")))`

- To set the threshold of a prediction object use its class method `set_threshold()`
`model_prediction$set_threshold(0.2)`
</codeblock>
</exercise>


<exercise id="6" title="Quiz">
Which statements are true?
<choice>
<opt text="The AUC with about `86%` is good." correct="true">
</opt>
<opt text="The model is able to classify `74` out of `130` correct as negative.">
</opt>
<opt text="Using the prediction of the train data is the ordinary and correct way of calculating the ROC.">
</opt>
<opt text="The calculation of the ROC should be done on a test set." correct="true">
</opt>
<opt text="The AUC is not effected by the threshold whereas the mmce is." correct="true">
</opt>
</choice>
</exercise>


<exercise id="7" title="Coding">

#### *(P)* ROC and AUC on test data

Using just the train dataset for predictions leads to overoptimistic ROC and AUC estimations. In this section we use `resample()` to obtain predictions of the whole dataset obtained by

1. To get a correct ROC use resample to evaluate the learner with a 3-fold cross validation:

<codeblock id="04_05_07">

**Hints**

- Use `classif.log_reg` as learner with `predict.type = prob`
`learner <- lrn("classif.log_reg", predict_type = "prob")`

- Access the task with the query `pima` and filter for the complete cases. Afterwards
`task <-  tsk("pima")`
`task$filter(rows = which(complete.cases(task$data())))`

- Use a 3-fold cross validation for resampling
`res_desc <- rsmp("cv", folds = 3L)`

</codeblock>

2. The Resampling object has a class method `prediction()`. This method returns a Prediction object which contains the test predictions of each fold, therefore we have test based predictions of each observation. Extract the object from the `res` object and store it:


<codeblock id="04_05_08">

**Hints**

- Use the objects defined previously
`learner <- lrn("classif.log_reg", predict_type = "prob")`
`task <-  tsk("pima")`
`task$filter(rows = which(complete.cases(task$data())))`
`res_desc <- rsmp("cv", folds = 3L)`

`set.seed(123)`
`res <- resample(task, learner, res_desc)`

- To access the test predictions of each call the `prediction()` class method
`test_prediction <- res$prediction()`

</codeblock>

3. Finally, calculate the ROC and AUC based on the `test_prediction` object:


<codeblock id="04_05_09">

**Hints**
- Use the objects defined previously
`learner <- lrn("classif.log_reg", predict_type = "prob")`
`task <-  tsk("pima")`
`task$filter(rows = which(complete.cases(task$data())))`
`res_desc <- rsmp("cv", folds = 3L)`

`set.seed(123)`
`res <- resample(task, learner, res_desc)`
`test_prediction <- res$prediction()`

- The ROC can be easily plotted with
`autoplot(test_prediction, "roc")`

- To calculate the performance on a prediction object use its class method `score()` 
`test_prediction$score(msr("classif.auc"))`

- To set the threshold of a prediction object use its class method `set_threshold()`
`test_prediction$set_threshold(0.2)`
</codeblock>


**Note** that the ROC and performance measures for each fold can also be directly computed from a Resampling object:


<codeblock id="04_05_010">
</codeblock>
</exercise>


<exercise id="8" title="ROC">
<object data="code-demos/code_demo_roc.pdf" type="application/pdf" style="width:100%;height:480px">
    <embed src="code-demos/code_demo_roc.pdf" type="application/pdf" />
</object>

You can run the code snippets in the demos on your local machine. The corresponding Rmd version of this demo can be found [here](https://github.com/compstat-lmu/lecture_i2ml/blob/master/code-demos/code_demo_roc.Rmd). If you want to render the Rmd files to PDF, you need the accompanying [style files](https://github.com/compstat-lmu/lecture_i2ml/tree/master/style).

</exercise>