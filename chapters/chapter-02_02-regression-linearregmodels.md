---
title: 'Chapter 2.2:Linear Regression Models'
description:
  ' By exploiting a linear transformation of features, one can predict a numerical target variable. In this chapter, we show you how linear regression models work and how they fit into the machine learning world.'
prev: /chapter-02_01-regression-lossfunctions
next: /chapter-02_03-regression-polynomialregmodels
type: chapter
id: 1
---

<exercise id="1" title="Video Lecture">
<iframe width="100%" height="480" src="https://www.youtube.com/embed/XITIVU37wGY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</exercise>


<exercise id="2" title="Slides">
<object data="pdfs/2/slides-regression-linearmodel.pdf" type="application/pdf" style="width:100%;height:480px">
    <embed src="pdfs/2/slides-regression-linearmodel.pdf" type="application/pdf" />
</object>
</exercise>


<exercise id="3" title="Quiz">
Which statements are true?
<choice>
<opt text="The target in linear regression has to be numeric" correct="true">
</opt>
<opt text="The features in linear regression have to be numeric">
</opt>
<opt text="The linear model is linear regression with `L2`-loss" correct="true">
</opt>
<opt text="The hypothesis space of linear regression consists of linear functions of the features" correct="true">
</opt>
</choice>
</exercise>


<exercise id="4" title="Linear Model & Gradient Descent">
<object data="code-demos/code_demo_limo.pdf" type="application/pdf" style="width:100%;height:480px">
    <embed src="code-demos/code_demo_limo.pdf" type="application/pdf" />
</object>

You can run the code snippets in the demos on your local machine. The corresponding Rmd version of this demo can be found [here](https://github.com/compstat-lmu/lecture_i2ml/blob/master/code-demos/code_demo_limo.Rmd). If you want to render the Rmd files to PDF, you need the accompanying [style files](https://github.com/compstat-lmu/lecture_i2ml/tree/master/style).
</exercise>