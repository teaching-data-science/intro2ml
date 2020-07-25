library(mlr3)

res_desc <- rsmp("cv", folds = 10)

print(res_desc)