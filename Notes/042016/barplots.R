library(ggplot2)
library(reshape2)

decoding.data <- melt(read.table("decoding-responses.tsv", sep="\t", header=TRUE), variable.name="Plot", value.name="Percent")

correct.values <- read.table("correct-values.tsv", header=TRUE)

p <- ggplot(decoding.data, aes(x=Percent))
p + geom_histogram() + geom_vline(data=correct.values, aes(xintercept=Percent), colour="blue") + facet_wrap(~ Plot)