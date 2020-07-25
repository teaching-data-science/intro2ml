library(mlbench)
library(ggplot2)

set.seed(314)
spirals <- mlbench.spirals(500, sd = 0.1)
spirals <- as.data.frame(spirals)
spirals_task <- TaskClassif$new(id = "spirals_task", backend = spirals, target = "classes")

# Visualization of the data
ggplot(data = spirals, aes(x.1, x.2, color = classes)) + geom_point()