---
title: 'Chapter 6: '
description:
  " This Chapter introduces bagging as method to increase the performance of trees. A modification of bagging leads to random forests. We explain the main idea of random forests, benchmark their performance with the methods seen so far and show how to quantify the impact of a single feature on the performance of the random forest as well as how to compute proximities between observations based on random forests."
type: chapter
prev: /chapter05
next: /chapter06
id: 1
---


<section class="index-module-chapter-c72e2d57">
  <h2 class="index-module-chapter-title-5e0ebe7a">
  <a class="link-module-root-46224d00 link-module-hidden-7e2d93b5" href="/chapter06-01-forests-baggingensembles">Chapter 6.1: Bagging Ensembles</a>

  </h2>
  <p class="index-module-chapter-desc-de526628">
  <a class="link-module-root-46224d00 link-module-hidden-7e2d93b5" href="/chapter06-01-forests-baggingensembles"> Bagging (bootstrap aggregation) is a method for combining many models into a meta-model, which often works much better than its individual components. This chapter teaches you the basic idea of bagging and explains why and when bagging works.</a>
  </p>
</section>





<section class="index-module-chapter-c72e2d57">
  <h2 class="index-module-chapter-title-5e0ebe7a">
  <a class="link-module-root-46224d00 link-module-hidden-7e2d93b5" href="/chapter06-02-forests-introduction">Chapter 6.2: Introduction</a>

  </h2>
  <p class="index-module-chapter-desc-de526628">
  <a class="link-module-root-46224d00 link-module-hidden-7e2d93b5" href="/chapter06-02-forests-introduction"> The introduction of random forests proper was first made in a paper by Leo Breiman. This chapter investigates the modern practice of random forests, which exploits out-of-bag error as an estimate of the generalization error and measures variable importance through permutation.</a>
  </p>
</section>





<section class="index-module-chapter-c72e2d57">
  <h2 class="index-module-chapter-title-5e0ebe7a">
  <a class="link-module-root-46224d00 link-module-hidden-7e2d93b5" href="/chapter06-03-forests-benchmarking">Chapter 6.3: Benchmarking Trees, Forests, and Bagging K-NN</a>

  </h2>
  <p class="index-module-chapter-desc-de526628">
  <a class="link-module-root-46224d00 link-module-hidden-7e2d93b5" href="/chapter06-03-forests-benchmarking"> The goal of this chapter is to compare the performance of random forest against stable and unstable methods. We explain the differences between trees, forest, and bagging. You would also train a random forest model using mlr3.</a>
  </p>
</section>





<section class="index-module-chapter-c72e2d57">
  <h2 class="index-module-chapter-title-5e0ebe7a">
  <a class="link-module-root-46224d00 link-module-hidden-7e2d93b5" href="/chapter06-04-forests-featureimportance">Chapter 6.4: Feature Importance</a>

  </h2>
  <p class="index-module-chapter-desc-de526628">
  <a class="link-module-root-46224d00 link-module-hidden-7e2d93b5" href="/chapter06-04-forests-featureimportance"> By how much would the random forest performance decrease if a specific feature were removed or rendered useless? The basic idea of this chapter is to examine this question. You will also learn what feature importance is and how to compute it.</a>
  </p>
</section>





<section class="index-module-chapter-c72e2d57">
  <h2 class="index-module-chapter-title-5e0ebe7a">
  <a class="link-module-root-46224d00 link-module-hidden-7e2d93b5" href="/chapter06-05-forests-proximitis">Chapter 6.5: Proximities</a>

  </h2>
  <p class="index-module-chapter-desc-de526628">
  <a class="link-module-root-46224d00 link-module-hidden-7e2d93b5" href="/chapter06-05-forests-proximitis"> The term "proximity" means the "closeness" between pairs of cases. Proximities are calculated for each pair of observations derived from random forests. You will find in this chapter that if two instances occupy the same terminal node through one tree, their proximity is increased by one.</a>
  </p>
</section>





<section class="index-module-chapter-c72e2d57">
  <h2 class="index-module-chapter-title-5e0ebe7a">
  <a class="link-module-root-46224d00 link-module-hidden-7e2d93b5" href="/chapter06-06-forests-discussion">Chapter 6.6: Discussion</a>

  </h2>
  <p class="index-module-chapter-desc-de526628">
  <a class="link-module-root-46224d00 link-module-hidden-7e2d93b5" href="/chapter06-06-forests-discussion"> This chapter aims to elucidate the pros and cons of random forests. It will be shown that all advantages of trees also apply to random forests: not much preprocessing required, missing value handling, etc.</a>
  </p>
</section>




