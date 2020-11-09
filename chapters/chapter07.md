---
title: 'Chapter 7: Tuning'
description:
  " This chapter introduces and formalizes the problem of hyperparameter tuning and defines the untouched test principle. Additionally, the concepts of train-val-test split and nested resampling are explained."
type: chapter
prev: /chapter06
next: null
id: 1
---


<section class="c72e2d57">
  <h2 class="_5e0ebe7a">
  <a class="_46224d00 _7e2d93b5" href="/chapter07-01-tuning-introduction">Chapter 7.1: Introduction</a>

  </h2>
  <p class="de526628">
  <a class="_46224d00 _7e2d93b5" href="/chapter07-01-tuning-introduction"> While model parameters are optimizied during training, hyperparameters are specified before the training. In this section, we will motivate why it is crucial to find good values for the hyperparameters, i.e. to "tune" the hyperparameters.</a>
  </p>
</section>





<section class="c72e2d57">
  <h2 class="_5e0ebe7a">
  <a class="_46224d00 _7e2d93b5" href="/chapter07-02-tuning-problemdefinition">Chapter 7.2: Problem Definition</a>

  </h2>
  <p class="de526628">
  <a class="_46224d00 _7e2d93b5" href="/chapter07-02-tuning-problemdefinition"> Hyperparameter tuning is the process of finding good model hyperparameters. In this section we formalize the problem of tuning and explain why tuning is computationally hard.</a>
  </p>
</section>





<section class="c72e2d57">
  <h2 class="_5e0ebe7a">
  <a class="_46224d00 _7e2d93b5" href="/chapter07-03-tuning-basictechniques">Chapter 7.3: Basic Techniques</a>

  </h2>
  <p class="de526628">
  <a class="_46224d00 _7e2d93b5" href="/chapter07-03-tuning-basictechniques"> In this section we make you familiar with different tuning strategies and discusse the advantages and disadvantages of the said strategies. In particular, grid search and random search are presented.</a>
  </p>
</section>





<section class="c72e2d57">
  <h2 class="_5e0ebe7a">
  <a class="_46224d00 _7e2d93b5" href="/chapter07-04-tuning-nestedresamplingmotivation">Chapter 7.4: Nested Resampling Motivation</a>

  </h2>
  <p class="de526628">
  <a class="_46224d00 _7e2d93b5" href="/chapter07-04-tuning-nestedresamplingmotivation"> Selecting the best model from a set of potential candidates is an important part of most machine learning problems. By examining an instructive and problematic example, we introduce the untouched test set principle.</a>
  </p>
</section>





<section class="c72e2d57">
  <h2 class="_5e0ebe7a">
  <a class="_46224d00 _7e2d93b5" href="/chapter07-05-tuning-trainingvalidationtesting">Chapter 7.5: Training - Validation - Testing</a>

  </h2>
  <p class="de526628">
  <a class="_46224d00 _7e2d93b5" href="/chapter07-05-tuning-trainingvalidationtesting"> The simplest method to achieve an untouched test set is a 3-way split: the models are first learned on the "training set" and then evaluated and compared on the "validation set." After selecting the best model, the performance will be evaluated on the "test set." </a>
  </p>
</section>





<section class="c72e2d57">
  <h2 class="_5e0ebe7a">
  <a class="_46224d00 _7e2d93b5" href="/chapter07-06-tuning-nestedresampling">Chapter 7.6: Nested Resampling</a>

  </h2>
  <p class="de526628">
  <a class="_46224d00 _7e2d93b5" href="/chapter07-06-tuning-nestedresampling">  In this section, we will explain why and how nested resampling is done.</a>
  </p>
</section>




