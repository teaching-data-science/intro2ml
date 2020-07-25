---
title: 'Chapter 5.3: Growing a Tree'
description:
  ' In this chapter, you will learn how to grow a tree starting with an empty tree, a root node containing all the data. It will be shown that trees are grown by recursively applying greedy optimization to each node.'
prev: /chapter-05_02-trees-splittingcriteria
next: /chapter-05_04-trees-computationalaspects
type: chapter
id: 1
---

<exercise id="1" title="Video Lecture">

<iframe width="100%" height="480" src="https://www.youtube.com/embed/UjuJCgeZ6HA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

</exercise>

<exercise id="2" title="Slides">

<object data="pdfs/5/slides-cart-treegrowing.pdf" type="application/pdf" style="width:100%;height:480px">
    <embed src="pdfs/5/slides-cart-treegrowing.pdf" type="application/pdf" />
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