---
title: 'Chapter 4.9: Resampling'
description:
  ' In the present chapter, you would understand the idea of resampling and would get familiar with cross-validation, bootstrapping, and subsampling. You would also learn how to define and conduct a resampling strategy with mlr3. Additionally, you can find out how to apply benchmark experiments and interpret the benchmark results.'
prev: /chapter-04_08-evaluation-testerror
next: /chapter-05_01-trees-introduction
type: chapter
id: 1
---

<exercise id="1" title="Video Lecture">

<iframe width="100%" height="480" src="https://www.youtube.com/embed/NvDUk8Bxuho" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

</exercise>

<exercise id="2" title="Slides">

<object data="pdfs/4/slides-evaluation-resampling.pdf" type="application/pdf" style="width:100%;height:480px">
    <embed src="pdfs/4/slides-evaluation-resampling.pdf" type="application/pdf" />
</object>

</exercise>



<exercise id="3" title="Quiz">
Which statements are true?
<choice>
<opt text="cross-validation, bootstrap, and subsampling are resampling techniques." correct="true">
</opt>
<opt text="Estimating the expected generalization error is a goal of resampling." correct="true">
</opt>
<opt text="In resampling, the data set is split repeatedly into training and tests sets." correct="true">
</opt>
<opt text="Resampling strategies are completely unbiased.">
</opt>
</choice>
</exercise>


<exercise id="4" title="Coding">

#### *(P)* Define a resampling strategy

For this exercise we want to evaluate the learner with 10-fold cross-validation. Define the resampling using the function `rsmp()`:


<codeblock id="04_09_01">

**Hints**
- You can specify the `.key` in `rsmp()` for different strategies (see `mlr_resamplings`). For cross validation for instance:
`.key = "cv"`

- The parameter are also listed in the help page. To define how many folds use the `folds` argument:
`folds = 10`
</codeblock>


#### *(P)* Conduct resampling

Now it is time to evaluate the LDA learner (`"classif.lda`") with 10-fold cross-validation on the iris task (`"iris"`). Therefore, use the `resample()` function and specify the learner, task, and the resampling (the seed is required for checking your result, please let it as `123`, otherwise your results cannot be checked):


<codeblock id="04_09_02">

**Hints**

- The learner can be specified as character or via `lrn()`
`learner <- lrn("classif.lda")`

- For the task use the build in `iris`-task 
`task <- tsk("iris")`

- As resampling description use the 10-fold cross validation:
`res_desc <- rsmp("cv", folds = 10)`

- Finally, use resample on all the components to evaluate the learner
`res  <- resample(learner = learner, task = task, resampling = res_desc)`
</codeblock>


#### *(P)* Conduct a benchmark

It might be interesting to compare LDA, QDA, and naive Bayes on the iris task. Instead of calling three times the `resample()` function we now use `benchmark()` to compare multiple learner. Therefore, collect the learner to compare within a list and conduct the benchmark. Now, use just a 3-fold cross-validation to evaluate the performance:


<codeblock id="04_09_03">

**Hints**

- To compare multiple learner collect hem within a list
`learners <- list(lrn("classif.lda"), lrn("classif.qda"), lrn("classif.naive_bayes"))`

- Again, use the build in iris task 
`task <- tsk("iris")`

- As resampling we know use the 3-fold cross validation
`res_desc <- rsmp("cv", folds = 3)`

- Define the benchmark design
`design <- benchmark_grid(tasks = task, learners = learners, resamplings = res_desc)`

- Finally call benchmark
`bmr <- benchmark(design)`
</codeblock>


#### *(P)* Visualize the benchmark

Finally, visualize the benchmark result with `autoplot()`

<codeblock id="04_09_04">

</codeblock>
</exercise>

<exercise id="5" title="Quiz">
What can you observe?
<choice>
<opt text="The boxplots are drawn by taking the estimated performance of each fold." correct="true">
</opt>
<opt text="The median of LDA and QDA is zero." correct="true">
</opt>
<opt text="LDA seems to work best on the iris task." correct="true">
</opt>
<opt text="QDA and naive Bayes works equally good.">
</opt>
<opt text="The simplicity of LDA may be the trigger for the result." correct="true">
</opt>
<opt text="LDA is definitely the best model you can choose for that task.">
</opt>
</choice>
</exercise>


<exercise id="6" title="Resampling">
<object data="code-demos/code_demo_resampling.pdf" type="application/pdf" style="width:100%;height:480px">
    <embed src="code-demos/code_demo_resampling.pdf" type="application/pdf" />
</object>

You can run the code snippets in the demos on your local machine. The corresponding Rmd version of this demo can be found [here](https://github.com/compstat-lmu/lecture_i2ml/blob/master/code-demos/code_demo_resampling.Rmd). If you want to render the Rmd files to PDF, you need the accompanying [style files](https://github.com/compstat-lmu/lecture_i2ml/tree/master/style).

</exercise>