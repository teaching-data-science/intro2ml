---
title: 'Chapter 1.3: Tasks and Data'
description:
  ' Supervised learning comes in two flavors: regression and classification. After studying this chapter, you should be able to differentiate between regression and classification tasks. We explain to you what the data generating process is, and you can create tasks in mlr3.'
prev: /chapter-01_02-basics-supervisedlearning
next: /chapter-01_04-basics-modelsandlearners
type: chapter
id: 1
---

<exercise id="1" title="Video Lecture">
<iframe width="100%" height="480" src="https://www.youtube.com/embed/d9YbO6P4AdU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</exercise>



<exercise id="2" title="Slides">
<object data="pdfs/1/slides-basics-datatask.pdf" type="application/pdf" style="width:100%;height:480px">
    <embed src="pdfs/1/slides-basics-datatask.pdf" type="application/pdf" />
</object>
</exercise>



<exercise id="3" title="Quiz">
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



<exercise id="4" title="Coding">

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
