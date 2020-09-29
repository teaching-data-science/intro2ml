---
title: 'Chapter 7: '
description:
  "Bla bla bla bla"
type: chapter
prev: /chapter06
next: null
id: 1
---


<section class="index-module-chapter-c72e2d57">
  <h2 class="index-module-chapter-title-5e0ebe7a">
  <a class="link-module-root-46224d00 link-module-hidden-7e2d93b5" href="/chapter07-01-tuning-introduction">Chapter 7.1: Introduction</a>

  </h2>
  <p class="index-module-chapter-desc-de526628">
  <a class="link-module-root-46224d00 link-module-hidden-7e2d93b5" href="/chapter07-01-tuning-introduction"> It is critical to understand the difference between model parameters and hyperparameters. While model parameters are optimized during training (typically via loss minimization), hyperparameters are specified before the training. In this chapter, you will see all hyperparameters that can be tuned and given as input to the model.</a>
  </p>
</section>





<section class="index-module-chapter-c72e2d57">
  <h2 class="index-module-chapter-title-5e0ebe7a">
  <a class="link-module-root-46224d00 link-module-hidden-7e2d93b5" href="/chapter07-02-tuning-problemdefinition">Chapter 7.2: Problem Definition</a>

  </h2>
  <p class="index-module-chapter-desc-de526628">
  <a class="link-module-root-46224d00 link-module-hidden-7e2d93b5" href="/chapter07-02-tuning-problemdefinition"> Hyperparameter tuning is the process of finding good model hyperparameters. This chapter formalizes the problem of tuning and explains why tuning is computationally hard.</a>
  </p>
</section>





<section class="index-module-chapter-c72e2d57">
  <h2 class="index-module-chapter-title-5e0ebe7a">
  <a class="link-module-root-46224d00 link-module-hidden-7e2d93b5" href="/chapter07-03-tuning-basictechniques">Chapter 7.3: Basic Techniques</a>

  </h2>
  <p class="index-module-chapter-desc-de526628">
  <a class="link-module-root-46224d00 link-module-hidden-7e2d93b5" href="/chapter07-03-tuning-basictechniques"> This chapter makes you familiar with different tuning strategies and discusses the advantages and disadvantages of the said strategies. In particular, grid search and random search are presented.</a>
  </p>
</section>





<section class="index-module-chapter-c72e2d57">
  <h2 class="index-module-chapter-title-5e0ebe7a">
  <a class="link-module-root-46224d00 link-module-hidden-7e2d93b5" href="/chapter07-04-tuning-nestedresamplingmotivation">Chapter 7.4: Nested Resampling Motivation</a>

  </h2>
  <p class="index-module-chapter-desc-de526628">
  <a class="link-module-root-46224d00 link-module-hidden-7e2d93b5" href="/chapter07-04-tuning-nestedresamplingmotivation"> Selecting the best model from a set of potential candidates is an important part of most machine learning problems. By examining an instructive and problematic example, this chapter introduces the untouched test set principle.</a>
  </p>
</section>





<section class="index-module-chapter-c72e2d57">
  <h2 class="index-module-chapter-title-5e0ebe7a">
  <a class="link-module-root-46224d00 link-module-hidden-7e2d93b5" href="/chapter07-05-tuning-trainingvalidationtesting">Chapter 7.5: Training - Validation - Testing</a>

  </h2>
  <p class="index-module-chapter-desc-de526628">
  <a class="link-module-root-46224d00 link-module-hidden-7e2d93b5" href="/chapter07-05-tuning-trainingvalidationtesting"> The simplest method to achieve an untouched test set is a 3-way split: a learner is first trained on the "training set" and then evaluated on the "validation set." After selecting the best model, the joint set (training+validation) will be trained again and the performance will be evaluated on the "test set." </a>
  </p>
</section>





<section class="index-module-chapter-c72e2d57">
  <h2 class="index-module-chapter-title-5e0ebe7a">
  <a class="link-module-root-46224d00 link-module-hidden-7e2d93b5" href="/chapter07-06-tuning-nestedresampling">Chapter 7.6: Nested Resampling</a>

  </h2>
  <p class="index-module-chapter-desc-de526628">
  <a class="link-module-root-46224d00 link-module-hidden-7e2d93b5" href="/chapter07-06-tuning-nestedresampling"> Just like we can generalize holdout splitting to resampling to get more reliable estimates of the predictive performance, we can generalize the training/validation/test approach to "nested resampling." In this chapter, you will learn why and how nested resampling is done. As a practical task, you will define the search space for parameter tuning and will conduct tuning for a specific learner.</a>
  </p>
</section>




