# -------------------¿¹Á¦5-------------

library("dplyr")
library("ggplot2")
library("ggthemes")
library("reshape2")

DF <- read.csv('example_population_f.csv')
DF <- DF[,-1]
DF <- tbl_df(DF)

group <- group_by(DF, Provinces)
DF2 <- summarise(group, SumPopulation=sum(Population), Male=sum(Male),
Female=sum(Female))

DF3 <- melt(DF2, id.vars=c("Provinces", "SumPopulation"),
measure.vars = c("Male","Female"))

DF2

DF3

colnames(DF3)[3] <- "Sex"
colnames(DF3)[4] <- "Population"
DF3