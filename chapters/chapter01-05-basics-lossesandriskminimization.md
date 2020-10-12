---
title: 'Chapter 1.5: Losses and Risk Minimization'
description:
  ' In order to find "good" ML models, we need a concept to evaluate and compare models. To this end, the concepts of "loss function", "empirical risk" and "empirical risk minimization" are introduced.'
prev: /chapter01-04-basics-modelsandlearners
next: /chapter01-06-basics-componentsoflearner
type: subchapter
id: 1
---

<exercise id="1" title="Video Lecture">
<iframe width="100%" height="480" src="https://www.youtube.com/embed/2b4x765XbUI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</exercise>



<exercise id="2" title="Slides">
<object data="pdfs/1/slides-basics-riskminimization.pdf" type="application/pdf" style="width:100%;height:480px">
    <embed src="pdfs/1/slides-basics-riskminimization.pdf" type="application/pdf" />
</object>
</exercise>



<exercise id="3" title="Quiz">
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

