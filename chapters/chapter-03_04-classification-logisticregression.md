---
title: 'Chapter 3.4: Logistic Regression'
description:
  ' This chapter helps you understand how logistic regression works and what logistic function is. Additionally, you will learn the Bernoulli loss. Your practical task is to train a logistic regression with R and mlr3, and you can practice transforming linear classifiers into non-linear classifiers.'
prev: /chapter-03_03-classification-linearclassifiers
next: /chapter-03_05-classification-discriminantanalysis
type: chapter
id: 1
---

<exercise id="1" title="Video Lecture">

<iframe width="100%" height="480" src="https://www.youtube.com/embed/TLb29_fEzhU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

</exercise>

<exercise id="2" title="Slides">

<object data="pdfs/3/slides-classification-logistic.pdf" type="application/pdf" style="width:100%;height:480px">
    <embed src="pdfs/3/slides-classification-logistic.pdf" type="application/pdf" />
</object>

</exercise>


<exercise id="3" title="Quiz">
Which statements are true?
<choice>
<opt text="Logistic regression can be fitted by maximum likelihood with numerical optimization or solved analytically.">
</opt>
<opt text="Logistic regression follows a generative approach">
</opt>
<opt text="In logistic regression, the parameter vector `θ` that maximizes the model's likelihood is identical to the one minimizing its empirical risk." correct="true">
</opt>
</choice>
</exercise>

<exercise id="4" title="Coding">

#### *(P)* Training a logistic regression with `mlr3`

For this exercise, take a look at the `titanic_train` dataset from the `titanic` package. Just keep the features `Survived`, `Age`, and `Fare`. Remove all observations with missing values (`NA`s)
and transform `Survived` into a factor variable:


<codeblock id="03_04_01">

**Hints**

- Install and library the titanic package or use the namespace titanic to load the `titanic_train` dataset:
`titanic::titanic_train`

- Use `na.omit` to remove all observations that contains missing values
`na.omit(...)`

- Transform `Survived` into a factor variable:
`my_titanic$Survived <- factor(my_titanic$Survived)`
</codeblock>


Now define a classification task `task_titanic` on that dataset with target `Survived`, define a logistic regression learner with `predict_type` set to `prob`, and train that learner:

<codeblock id="03_04_02">

**Hints**

- We have to define a classification task since we are classifying if a passenger survived or not we:
`task_titanic <- TaskClassif$new(id = "titanic_task", backend = my_titanic, target = "Survived")`

- The learner we are looking for is `classif.logreg`:
`learner_logreg <- lrn("classif.log_reg", predict_type = "prob")`

- Finally we have to train the learner:
`learner_logreg$train(task_titanic)`
</codeblock>


Finally, visualize the model with `plot_learner_prediction()`:

<codeblock id="03_04_03">
</codeblock>


#### *(P)* Training a logistic regression with non-linear decision boundaries

The next demonstration shows how to include the features `Age` and `Fare` as polynomials and the effect on the decision boundary. As mentioned in the video, it is possible to transform a linear classifier into a non-linear classifier by just mapping features into a higher dimensional feature space (feature map):

<codeblock id="03_04_04">
</codeblock>
</exercise>


<exercise id="5" title="Logistic Regression & Newton-Raphson">
<object data="code-demos/code_demo_logreg.pdf" type="application/pdf" style="width:100%;height:480px">
    <embed src="code-demos/code_demo_logreg.pdf" type="application/pdf" />
</object>

You can run the code snippets in the demos on your local machine. The corresponding Rmd version of this demo can be found [here](https://github.com/compstat-lmu/lecture_i2ml/blob/master/code-demos/code_demo_logreg.Rmd). If you want to render the Rmd files to PDF, you need the accompanying [style files](https://github.com/compstat-lmu/lecture_i2ml/tree/master/style).

</exercise>
