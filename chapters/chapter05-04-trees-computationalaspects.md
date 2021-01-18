---
title: 'Chapter 5.4: Computational Aspects of Finding Splits'
description:
  ' In this section, we explain the computational aspects of the node-splitting procedure, especially for nominal features. Additionally we illustrate how to deal with missing values.'
prev: /chapter05-03-trees-growingatree
next: /chapter05-05-trees-stoppingcriteria
type: subchapter
id: 1
---

<exercise id="1" title="Video Lecture">

<iframe width="100%" height="480" src="https://www.youtube.com/embed/RujQ_xP-NFA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

</exercise>

<exercise id="2" title="Slides">

<object data="pdfs/5/slides-cart-splitcomputation.pdf" type="application/pdf" style="width:100%;height:480px">
    <embed src="pdfs/5/slides-cart-splitcomputation.pdf" type="application/pdf" />
</object>

</exercise>

<exercise id="3" title="Quiz">
Which statements about CART are true?
<choice>
<opt text="To find optimal splits, one iterates over all features, and for each feature over all possible split points." correct="true">
</opt>
<opt text="To find optimal splits, we use the one that splits the data approximately in half in each step.">
</opt>
<opt text="To find optimal splits, we evaluate the possible splits only on the data that ended up in the parent node we are trying to split." correct="true">
</opt>
<opt text="The optimal split results in the lowest sum of empirical risks in the child nodes." correct="true">
</opt>
<opt text="Monotone transformations of several features will change the structure of the tree.">
</opt>
<opt text="The CART algorithm cannot go on training if every node contains exactly one observation" correct="true">
</opt>
</choice>
</exercise>

