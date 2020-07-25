---
title: 'Chapter 7.6: Nested Resampling'
description:
  ' Just like we can generalize holdout splitting to resampling to get more reliable estimates of the predictive performance, we can generalize the training/validation/test approach to "nested resampling." In this chapter, you will learn why and how nested resampling is done. As a practical task, you will define the search space for parameter tuning and will conduct tuning for a specific learner.'
prev: /chapter-07_05-tuning-trainingvalidationtesting
next: null
type: chapter
id: 1
---

<exercise id="1" title="Video Lecture">

<iframe width="100%" height="480" src="https://www.youtube.com/embed/-d338rc076s" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

</exercise>

<exercise id="2" title="Slides">

<object data="pdfs/7/slides-tuning-nestedresampling.pdf" type="application/pdf" style="width:100%;height:480px">
    <embed src="pdfs/7/slides-tuning-nestedresampling.pdf" type="application/pdf" />
</object>

</exercise>



<exercise id="3" title="Quiz">
Which statements are true?
<choice>
<opt text="How well tuning works depends on the learner and the impact of the hyperparameters on that learner." correct="true">
</opt>
<opt text="Grid search often works better than random search.">
</opt>
<opt text="Grid search scales exponentially with the dimension of the parameter space." correct="true">
</opt>
<opt text="Grid search evaluates many points from the parameter space that aren't of interest." correct="true">
</opt>
<opt text="Random search works often better due to it's better exploration of the hyperparameter space." correct="true">
</opt>
<opt text="Random search scales very well with the dimension of the hyperparameter space.
">
</opt>
<opt text="Random search as well as grid search has the problem of discretization.">
</opt>
</choice>
</exercise>


<exercise id="4" title="Coding">

#### *(P)* The sonar task

In this hands-on we want to tune a random forest using the `classif.ranger` learner. The goal is to find hyperparameter values for `mtry` and `min.node.size` to achieve a high AUC. The task we are using is the task `"sonar"`. Taking a look at the help page of the task (`??mlbench::Sonar`) gives a nice description:

> This is the data set used by Gorman and Sejnowski in their study of the classification of sonar signals using a neural network [1]. The task is to train a network to discriminate between sonar signals bounced off a metal cylinder and those bounced off a roughly cylindrical rock.
>
> Each pattern is a set of 60 numbers in the range 0.0 to 1.0. Each number represents the energy within a particular frequency band, integrated over a certain period of time. The integration aperture for higher frequencies occur later in time, since these frequencies are transmitted later during the chirp.
>
> The label associated with each record contains the letter "R" if the object is a rock and "M" if it is a mine (metal cylinder). The numbers in the labels are in increasing order of aspect angle, but they do not encode the angle directly.

<codeblock id="07_06_01">
</codeblock>

#### *(P)* Define the learner and parameter set

As mentioned above, we want to find good values for `mtry` and `min.node.size`. Therefore, define a hyperparameter space using `ParamSet$new()`. Before defining the parameter set define the `ranger` learner (do also note that we want to optimize for the AUC which requires the estimation of probabilities):

<codeblock id="07_06_02">
</codeblock>



Now, define the parameter set with:

- $\texttt{mtry} \in [1,30]$
- $\texttt{min.node.size} \in [1,50]$


<codeblock id="07_06_03">

**Hints**
- To see all available parameter, it's type, the range, and if it is tuneable or not
`learner$param_set`


</codeblock>



#### *(P)* Choose the general tuning scenario and resampling strategy

Set 50 iterations as the stopping criterion for the tuner. For the resampling of each value we use a 3-fold cross-validation. As the measure optimized by the tuner use the AUC:


<codeblock id="07_06_04">

**Hints**
- Use the objects as defined before
`learner <- lrn("classif.ranger", predict_type = "prob")`
`param_set <- ParamSet$new(list( ParamInt$new("mtry", lower = 1L, upper = 30L), ParamInt$new("min.node size", lower = 1L, upper = 50L)))`

- As resampling description use 3-fold cross-validation
`res_desc <- rsmp("cv", folds = 3L)`

- To specify the number of iterations, use the 'evals' option and set n_evals to 50
`evals50 <- term("evals", n_evals = 50L)`

- The measure we want to optimize is the AUC
`msr("classif.auc")`
</codeblock>



#### *(P)* Run and visualize the tuning

Finally, create a random search tuner und use it to tune the tuning scenario `instance` with `tune()`. **Note** that the tuning could take some time to finish.

<codeblock id="07_06_05">

**Hints**

- Use the objects defined previously
`learner <- lrn("classif.ranger", predict_type = "prob")`
`param_set <- ParamSet$new(list(ParamInt$new("mtry", lower = 1L, upper = 30L), ParamInt$new("min.node.size", lower = 1L, upper = 50L)))`
`res_desc <- rsmp("cv", folds = 3L)`
`evals50 <- term("evals", n_evals = 50L)`
`instance <- TuningInstance$new(task = tsk("sonar"), learner = learner, resampling = res_desc,measures = msr("classif.auc"), param_set = param_set, terminator = evals50)`

- Create a tuner with random search strategy
`tuner <- tnr("random_search")`

- Tune the tuning scenario
`tuner$tune(instance)`
</codeblock>
</exercise>


<exercise id="5" title="Kaggle Challenge">
<object data="code-demos/code_demo_kaggle.pdf" type="application/pdf" style="width:100%;height:480px">
    <embed src="code-demos/code_demo_kaggle.pdf" type="application/pdf" />
</object>

You can run the code snippets in the demos on your local machine. The corresponding Rmd version of this demo can be found [here](https://github.com/compstat-lmu/lecture_i2ml/blob/master/code-demos/code_demo_kaggle.Rmd). If you want to render the Rmd files to PDF, you need the accompanying [style files](https://github.com/compstat-lmu/lecture_i2ml/tree/master/style).

</exercise>

