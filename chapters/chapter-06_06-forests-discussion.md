---
title: 'Chapter 6.6: Discussion'
description:
  ' This chapter aims to elucidate the pros and cons of random forests. It will be shown that all advantages of trees also apply to random forests: not much preprocessing required, missing value handling, etc.'
prev: /chapter-06_05-forests-proximitis
next: /chapter-07_01-tuning-introduction
type: chapter
id: 1
---

<exercise id="1" title="Video Lecture">

<iframe width="100%" height="480" src="https://www.youtube.com/embed/9bqNhq6OUUk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

</exercise>

<exercise id="2" title="Slides">

<object data="pdfs/6/slides-forests-discussion.pdf" type="application/pdf" style="width:100%;height:480px">
    <embed src="pdfs/6/slides-forests-discussion.pdf" type="application/pdf" />
</object>

</exercise>



<exercise id="3" title="Quiz">
Which statements are true?
<choice>
<opt text="To compute permutation variable importance for feature `j`, we permute the feature and see how the performance changes (in OOB observations)." correct="true">
</opt>
<opt text="The higher the variable importance, the more important the variable is for the model/ the prediction." correct="true">
</opt>
<opt text="The random forest is a bad out of the box model and requires tuning of hyperparameters.">
</opt>
<opt text="Random forests and trees can be used for high-dimensional data." correct="true">
</opt>
</choice>
</exercise>


<exercise id="4" title="Random Forests">
<object data="code-demos/code_demo_randforests.pdf" type="application/pdf" style="width:100%;height:480px">
    <embed src="code-demos/code_demo_randforests.pdf" type="application/pdf" />
</object>

You can run the code snippets in the demos on your local machine. The corresponding Rmd version of this demo can be found [here](https://github.com/compstat-lmu/lecture_i2ml/blob/master/code-demos/code_demo_randforests.Rmd). If you want to render the Rmd files to PDF, you need the accompanying [style files](https://github.com/compstat-lmu/lecture_i2ml/tree/master/style).

</exercise>
