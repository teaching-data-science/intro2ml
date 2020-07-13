---
title: 'Chapter 3.7: 	K-Nearest Neighbors'
description:
  ' k-NN is a lazy classifier which has no real training step; it merely stores the complete data required during predictions. As will be shown in this chapter, because of not being based on distributional or strong functional assumptions, k-NN can theoretically model situations with arbitrary complexity. As a practical task, you would also learn how to fit different classifiers in mlr3.'
prev: /chapter-03_06-classification-naviebayes
next: /chapter-04_01-evaluation-introduction
type: chapter
id: 1
---

<exercise id="1" title="Video Lecture">

<iframe width="100%" height="480" src="https://www.youtube.com/embed/WkECa1jRTmw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

</exercise>

<exercise id="2" title="Slides">

<object data="pdfs/3/slides-classification-knn.pdf" type="application/pdf" style="width:100%;height:480px">
    <embed src="pdfs/3/slides-classification-knn.pdf" type="application/pdf" />
</object>

</exercise>


<exercise id="3" title="Quiz">
Which statements are true?
<choice>
<opt text="In LDA, each class density is modeled as a multivariate Gaussian with unequal covariance.">
</opt>
<opt text="LDA is a linear classifier" correct="true">
</opt>
<opt text="LDA follows a generative approach" correct="true">
</opt>
<opt text="In QDA, each class density is modeled as a multivariate Gaussian with equal covariance">
</opt>
<opt text="QDA follows a generative approach" correct="true">
</opt>
<opt text="QDA requires estimation of more parameters than LDA" correct="true">
</opt>
<opt text="Naive Bayes assumes that the features are independent within each outcome class `y`." correct="true">
</opt>
<opt text="Naive Bayes follows a generative approach" correct="true">
</opt>
<opt text="k-NN can be used in regression and classification" correct="true">
</opt>
<opt text="k-NN is a probabilistic classifier" correct="true">
</opt>
</choice>
</exercise>


<exercise id="4" title="Coding">

#### *(P)* Qualitative comparison of LDA, QDA, and naive Bayes

In this demo we want to compare LDA, QDA, and naive Bayes by looking at the decision boundaries (hint: with `mlr_learners` you get a list with all available learners. If their `properties` attribute contains `multiclass` they are suited for multiclass classification). Use `plot_learner_prediction()` to visualize the decision boundaries for the features `Sepal.Length` and `Sepal.Width`. You can use the build in iris task `"iris"` of `mlr3`. Store the plot for each model and plot them underneath each other with `grid.arrange()` from the `gridExtra` package:


<codeblock id="03_07">

**Hints**

- The mlr3 learner are:
`lrn("classif.lda", predict_type = "prob")`
`lrn("classif.qda", predict_type = "prob")`
`lrn("classif.naive_bayes", predict_type = "prob")`

</codeblock>
</exercise>


<exercise id="5" title="Quiz">
What can you observe?
<choice>
<opt text="The decision boundaries of all classifiers looks equal.">
</opt>
<opt text="The naive Bayes classifier has linear decision boundaries due to the simple construction.">
</opt>
<opt text="LDA is the only classifier with linear decision boundaries." correct="true">
</opt>
<opt text="QDA has non-linear decision boundaries due to the different covariances in each class." correct="true">
</opt>
</choice>
</exercise>


<exercise id="6" title="Comparison of Classification Methods">
<object data="code-demos/code_demo_cmpclass.pdf" type="application/pdf" style="width:100%;height:480px">
    <embed src="code-demos/code_demo_cmpclass.pdf" type="application/pdf" />
</object>

You can run the code snippets in the demos on your local machine. The corresponding Rmd version of this demo can be found [here](https://github.com/compstat-lmu/lecture_i2ml/blob/master/code-demos/code_demo_cmpclass.Rmd). If you want to render the Rmd files to PDF, you need the accompanying [style files](https://github.com/compstat-lmu/lecture_i2ml/tree/master/style).

</exercise>


<exercise id="7" title="Generative classification methods">
<object data="code-demos/code_demo_genclass.pdf" type="application/pdf" style="width:100%;height:480px">
    <embed src="code-demos/code_demo_genclass.pdf" type="application/pdf" />
</object>

You can run the code snippets in the demos on your local machine. The corresponding Rmd version of this demo can be found [here](https://github.com/compstat-lmu/lecture_i2ml/blob/master/code-demos/code_demo_genclass.Rmd). If you want to render the Rmd files to PDF, you need the accompanying [style files](https://github.com/compstat-lmu/lecture_i2ml/tree/master/style).

</exercise>