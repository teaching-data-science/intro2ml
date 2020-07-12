---
title: 'Chapter 0.1: ML Basics'
description:
  ' This is a test Chapter!'
prev: null
next: /chapter-01_01-basics-whatisml
type: chapter
id: 1
---


<exercise id="1" title="Video: What is ML?">
<iframe width="100%" height="480" src="https://www.youtube.com/embed/CCzx4UDkzpA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</exercise>


<exercise id="2" title="Slides">
<object data="pdfs/1/slides-basics-whatisml.pdf
" type="application/pdf" style="width:100%;height:480px">
    <embed src="pdfs/1/slides-basics-whatisml.pdf
" type="application/pdf" />
</object>
</exercise>


<exercise id="3" title="Video: Supervised Learning">
<iframe width="100%" height="480" src="https://www.youtube.com/embed/R_HZBY9RMmo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</exercise>



<exercise id="4" title="Slides">
<object data="pdfs/1/slides-basics-supervised.pdf" type="application/pdf" style="width:100%;height:480px">
    <embed src="pdfs/1/slides-basics-supervised.pdf" type="application/pdf" />
</object>
</exercise>



<exercise id="5" title="Quiz 1">
Which statements are true?
<choice>
<opt text="Machine learning is a branch of statistics and computer science." correct="true">
</opt>
<opt text="A model `f` is a mapping from the feature space to the target space." correct="true">
</opt>
<opt text="The goal of an ML algorithm is to yield a model that reproduces the already seen data as accurately as possible.">
</opt>
<opt text="ML algorithms try to predict the target variable as accurately as possible based on the values of the features." correct="true">
</opt>
<opt text="Supervised learning tasks are prediction problems." correct="true">
</opt>
<opt text="Unsupervised learning tries to discover structure and patterns in the training data." correct="true">
</opt>
</choice>
</exercise>



<exercise id="6" title="Video: Tasks and Data">
<iframe width="100%" height="480" src="https://www.youtube.com/embed/d9YbO6P4AdU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</exercise>



<exercise id="7" title="Slides">
<object data="pdfs/1/slides-basics-datatask.pdf" type="application/pdf" style="width:100%;height:480px">
    <embed src="pdfs/1/slides-basics-datatask.pdf" type="application/pdf" />
</object>
</exercise>



<exercise id="8" title="Quiz 2">
Which statements are true?
<choice>
<opt text="Classification is a supervised learning task." correct="true">
</opt>
<opt text="Regression is a supervised learning task." correct="true">
</opt>
<opt text="Clustering is a supervised learning task.">
</opt>
<opt text="We assume that a probability distribution characterizes the process that generates the observed data. This is called the data generating process." correct="true">
</opt>
<opt text="The data generating process is the true underlying phenomenon creating the data." correct="true">
</opt>
</choice>
</exercise>



<exercise id="9" title="Coding 1">

For this exercise, take a look at the [`iris` dataset](https://en.wikipedia.org/wiki/Iris_flower_data_set). Define a new classification task called `iris_task` based on the `iris` dataset with target variable `Species` and just two features `Sepal.Width` and `Petal.Width`:

<codeblock id="01_03">

**Hints**
- Use the `TaskClassif$new()` function of mlr3. The identifier for the task `id` can be arbitrarily chosen, but must be set.
`iris_task <- TaskClassif$new(id = ..., backend = ..., target = ...)`

- Select just the three columns Sepal.Width, Petal.Width, and Species
`iris[, c("Species", "Sepal.Width", "Petal.Width")]`

- The target variable has to be specified as character of length 1 "Species"

</codeblock>
</exercise>



<exercise id="10" title="Video: Models and Learners">
<iframe width="100%" height="480" src="https://www.youtube.com/embed/UW1E4xO0hJQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</exercise>



<exercise id="11" title="Slides">
<object data="pdfs/1/slides-basics-learners.pdf" type="application/pdf" style="width:100%;height:480px">
    <embed src="pdfs/1/slides-basics-learners.pdf" type="application/pdf" />
</object>
</exercise>



<exercise id="12" title="Quiz 3">
Which statements are true?
<choice>
<opt text="We use the terms 'model' and 'hypothesis' synonymously." correct="true">
</opt>
<opt text="We use the terms 'learner' and 'inducer' synonymously." correct="true">
</opt>
<opt text="We use the terms 'model' and 'learner' synonymously.">
</opt>
<opt text="A learner takes the data set, does some computations on it and returns the model." correct="true">
</opt>
</choice>
</exercise>


<exercise id="13" title="Video: Losses and Risk Minimization">
<iframe width="100%" height="480" src="https://www.youtube.com/embed/2b4x765XbUI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</exercise>



<exercise id="14" title="Slides">
<object data="pdfs/1/slides-basics-riskminimization.pdf" type="application/pdf" style="width:100%;height:480px">
    <embed src="pdfs/1/slides-basics-riskminimization.pdf" type="application/pdf" />
</object>
</exercise>



<exercise id="15" title="Quiz 4">
Which statements are true?
<choice>
<opt text="Measures for model performance can be used as loss functions." correct="true">
</opt>
<opt text="The choice of loss function has no influence on the model.">
</opt>
<opt text="The empirical risk is the mean loss." correct="true">
</opt>
<opt text="To estimate model paramters, we usually minimize the empirical risk." correct="true">
</opt>
<opt text="By minimizing the empirical risk, we minimize the error (defined by the loss)." correct="true">
</opt>
<opt text="Any model can use any arbitrary loss function.">
</opt>
<opt text="Empirical risk minimization is a very general mathematical framework that turns 'finding a good model' into a mathematically tractable optimization problem." correct="true">
</opt>
<opt text="Since empirical risk minimization is a completely abstract and very general mathematical procedure, the choice of loss function should not depend on background knowledge about the data set at hand or what the model is going to be used for.">
</opt>
<opt text="How difficult the optimization of a learner is depends strongly on the properties of its loss function." correct="true">
</opt>
</choice>
</exercise>



<exercise id="16" title="Video: Components of a Learner">
<iframe width="100%" height="480" src="https://www.youtube.com/embed/zaB7WioK1Kw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</exercise>



<exercise id="17" title="Slides">
<object data="pdfs/1/slides-basics-learnercomponents-hro.pdf" type="application/pdf" style="width:100%;height:480px">
    <embed src="pdfs/1/slides-basics-learnercomponents-hro.pdf" type="application/pdf" />
</object>
</exercise>


<exercise id="18" title="Quiz 5">
Which statements are true?
<choice>
<opt text="For a given hypothesis class `H`, different optimization procedures can be used to find the best model `f∈H`." correct="true">
</opt>
<opt text="Providing two different training data sets to a learner will result in the same optimal model `f`.">
</opt>
<opt text="The representation of a learner defines its hypothesis class `H`." correct="true">
</opt>
<opt text="Supervised learning consists of three components: Hypothesis Space, Risk, and Optimization." correct="true">
</opt>
</choice>
</exercise>