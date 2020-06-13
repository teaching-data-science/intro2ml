# Use the 'ranger.learner' with 'predict_type = "prob"' to prepare the learner for predicting probabilities
learner <- lrn("classif.ranger", predict_type = "prob")
